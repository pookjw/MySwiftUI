// 5BC40379787EC8BFAE898D075045DC37
public import QuartzCore

@_spi(Internal)
public class CAHostingLayer<Content> : CALayer where Content : View {
    @safe private nonisolated(unsafe) let viewGraphHost: ViewGraphHost
    @safe package nonisolated(unsafe) let eventBindingManager = EventBindingManager()
    private nonisolated(unsafe) var lastRenderTime: Time = .zero
    private nonisolated(unsafe) var isUpdating: Bool = false
    private nonisolated(unsafe) var needsDeferredUpdate: Bool = false
    @safe package nonisolated(unsafe) let focusedResponder: ResponderNode? = nil
    private nonisolated(unsafe) var displayLinkProvider: ((Any, Selector) -> CADisplayLink?)? = nil
    
    public nonisolated(unsafe) var rootView: Content {
        didSet {
            assertUnimplemented()
        }
    }
    
    private nonisolated(unsafe) var environment: EnvironmentValues {
        didSet {
            assertUnimplemented()
        }
    }
    
    private let referenceInstant: ContinuousClock.Instant
    
    private lazy nonisolated var eventContext: CAHostingLayerEvent.Context = {
        assertUnimplemented()
    }()
    
    public init(rootView: Content, environment: EnvironmentValues = .init()) {
        /*
         self -> x20 -> x19
         rootView -> x0 -> x29 - 0x68
         environment -> x1 -> x23
         */
        unsafe self.environment = environment
        unsafe self.rootView = rootView
        self.referenceInstant = .now
        
        Update.begin()
        
        self.viewGraphHost = ViewGraphHost(
            rootViewType: Content.self,
            viewDefinition: CALayerPlatformViewDefinition.self
        )
        
        super.init()
        self.postInit()
        
        Update.end()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        assertUnimplemented()
    }
    
    public override var bounds: CGRect {
        get {
            return super.bounds
        }
        set {
            let oldValue = super.bounds
            super.bounds = newValue
            
            if oldValue.size != newValue.size {
                self.invalidateProperties([.size], mayDeferUpdate: false)
            }
        }
    }
    
    override dynamic public func layoutSublayers() {
        super.layoutSublayers()
        
        Update.locked { 
            let viewGraphHost = self.viewGraphHost
            
            Update.locked { 
                if let displayLink = viewGraphHost.displayLink {
                    displayLink.nextThread = .main
                }
            }
            
            // <+396>
            let timestamp: Time = .systemUptime
            let interval: Double
            if let viewGraphHost = viewGraphHost.displayLink {
                let nextUpdate = viewGraphHost.nextUpdate
                
                if (nextUpdate < .infinity || nextUpdate > .infinity) {
                    interval = 0
                } else {
                    interval = self.renderInterval(timestamp: timestamp)
                }
            } else {
                interval = self.renderInterval(timestamp: timestamp)
            }
            
            // <+460>
            unsafe self.isUpdating = true
            self.render(interval: interval, updateDisplayList: true, targetTimestamp: nil)
            unsafe self.isUpdating = false
            
            // <+536>
            guard unsafe self.needsDeferredUpdate else {
                return
            }
            
            DispatchQueue.main.asyncAfter(
                deadline: .now() + (1.0 / 60.0),
                qos: .unspecified,
                flags: []
            ) { [weak self = UncheckedSendable(self).value] in
                // $s7SwiftUI14CAHostingLayerC15layoutSublayersyyFyyScMYccfU0_TA
                guard let self else {
                    return
                }
                
                var d8 = Time.systemUptime - timestamp
                d8 = d8 + self.viewGraphHost.currentTimestamp.seconds
                self.viewGraphHost.currentTimestamp = d8
                self.setNeedsUpdate()
            }
            
            unsafe self.needsDeferredUpdate = false
        }
    }
    
    public override var contentsScale: CGFloat {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public override init(layer: Any) {
        assertUnimplemented()
    }
    
    fileprivate final func postInit() {
        let viewGraphHost = self.viewGraphHost
        viewGraphHost.updateDelegate = self
        viewGraphHost.renderDelegate = self
        viewGraphHost.setUp()
        
        let eventBindingManager = self.eventBindingManager
        eventBindingManager.host = self
        eventBindingManager.delegate = self
    }
    
    fileprivate final func renderInterval(timestamp: Time) -> Double {
        assertUnimplemented()
    }
}

extension CAHostingLayer : EventGraphHost {
    package func didBind(to event: EventBinding, id eventID: EventID) {
        // noop
    }
    
    package func didUpdate(phase: GesturePhase<Void>, in manager: EventBindingManager) {
        assertUnimplemented()
    }
    
    package func didUpdate(gestureCategory: GestureCategory, in manager: EventBindingManager) {
        // noop
    }
    
    package func isDescendant(of object: AnyObject) -> Bool {
        return false
    }
}

extension CAHostingLayer : ViewRendererHost {
    package var viewGraph: ViewGraph {
        assertUnimplemented()
    }
    
    package var currentTimestamp: Time {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    package var valuesNeedingUpdate: ViewGraphRootValues {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    package var renderingPhase: ViewRenderingPhase {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    package var externalUpdateCount: Int {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @_spi(Internal) public func updateRootView() {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func updateEnvironment() {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func updateTransform() {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func updateSize() {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func updateSafeArea() {
        // noop
    }
    
    @_spi(Internal) public func updateContainerSize() {
        // noop
    }
    
    @_spi(Internal) public func updateFocusStore() {
        // noop
    }
    
    @_spi(Internal) public func updateFocusedItem() {
        // noop
    }
    
    @_spi(Internal) public func updateFocusedValues() {
        // noop
    }
    
    @_spi(Internal) public func updateAccessibilityEnvironment() {
        // noop
    }
}

extension CAHostingLayer : ViewGraphDelegate {
    @_spi(Internal) public func preferencesDidChange() {
        // noop
    }
    
    @_spi(Internal) public nonisolated func `as`<T>(_ type: T.Type) -> T? {
        if let result = self.viewGraphHost.as(T.self) {
            return result
        } else if T.self == ViewGraphRenderDelegate.self {
            return (self as! T)
        } else if type == CALayer.self {
            return (self as! T)
        } else if type == ViewRendererHost.self {
            return (self as! T)
        } else if type == EventGraphHost.self {
            return (self as! T)
        } else if type == ViewGraphDelegate.self {
            return (self as! T)
        } else {
            return nil
        }
    }
    
    @_spi(Internal) public nonisolated func requestUpdate(after time: Double) {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func setNeedsUpdate() {
        assertUnimplemented()
    }
}

extension CAHostingLayer : ViewGraphRenderDelegate {
    package var renderingRootView: AnyObject {
        return self
    }
    
    package func updateRenderContext(_ context: inout ViewGraphRenderContext) {
        assertUnimplemented()
    }
    
    package func renderIntervalForDisplayLink(timestamp: Time) -> Double {
        assertUnimplemented()
    }
}
