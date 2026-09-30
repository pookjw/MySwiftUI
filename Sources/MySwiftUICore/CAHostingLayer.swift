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
            self.invalidateProperties([.rootView], mayDeferUpdate: true)
        }
    }
    
    private nonisolated(unsafe) var environment: EnvironmentValues {
        didSet {
            self.invalidateProperties([.environment], mayDeferUpdate: true)
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
        self.viewGraphHost.tearDown(delegate: self)
        self.viewGraphHost.clearDisplayLink()
        self.viewGraphHost.clearUpdateTimer()
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
        didSet {
            guard oldValue != self.contentsScale else {
                return
            }
            
            self.invalidateProperties([.environment], mayDeferUpdate: true)
        }
    }
    
    public override init(layer: Any) {
        let casted = layer as! CAHostingLayer<Content>
        
        unsafe self.environment = casted.environment
        unsafe self.rootView = casted.rootView
        self.referenceInstant = .now
        
        Update.begin()
        
        self.viewGraphHost = ViewGraphHost(
            rootViewType: Content.self,
            viewDefinition: CALayerPlatformViewDefinition.self
        )
        
        super.init(layer: layer)
        self.postInit()
        
        Update.end()
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
        let d1 = timestamp.seconds
        var d0 = unsafe self.lastRenderTime.seconds
        
        if (d0 != 0) && !(d1 < d0) {
            // <+84>
        } else {
            d0 = -0.000001
            d0 = d1 + d0
            unsafe self.lastRenderTime = Time(seconds: d0)
        }
        
        d0 = unsafe self.lastRenderTime.seconds
        d0 = d1 - d0
        unsafe self.lastRenderTime = Time(seconds: d1)
        
        return d0
    }
    
    fileprivate final func startDisplayLink(delay: Double) {
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
        unsafe self.viewGraphHost.setRootView(self.rootView)
    }
    
    @_spi(Internal) public func updateEnvironment() {
        var environment = unsafe self.environment
        environment.displayScale = self.contentsScale
        
        self.viewGraphHost.setEnvironment(environment, wrapper: ViewGraphHostEnvironmentWrapper())
    }
    
    @_spi(Internal) public func updateSize() {
        let size = self.bounds.size
        self.viewGraphHost.viewGraph.setSize(
            ViewSize(size, proposal: _ProposedSize(size))
        )
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
        /*
         self -> x20
         time -> d0 -> d8
         */
        Update.locked {
            let flag: Bool
            
            if time != 0 {
                // <+368>
                flag = true
            } else {
                // <+208>
                if
                    self.viewGraphHost.viewGraph.mayDeferUpdate,
                    let displayLink = self.viewGraphHost.displayLink
                {
                    let nextUpdate = displayLink.nextUpdate
                    
                    if nextUpdate == .infinity || nextUpdate.seconds.isNaN {
                        // <+436>
                        flag = false
                    } else {
                        // <+368>
                        flag = true
                    }
                } else {
                    // <+436>
                    flag = false
                }
            }
            
            if flag {
                // <+368>
                if !(time < 0.25) {
                    // <+904>
                    self.viewGraphHost.startUpdateTimer(delay: time)
                    return
                }
                
                if unsafe self.displayLinkProvider == nil {
                    // <+964>
                    if unsafe self.isUpdating {
                        unsafe self.needsDeferredUpdate = true
                    } else {
                        // <+456>
                        self.setNeedsUpdate()
                    }
                } else {
                    self.startDisplayLink(delay: time)
                }
            } else {
                // <+436>
                if Thread.isMainThread {
                    self.setNeedsUpdate()
                } else {
                    // <+464>
                    DispatchQueue.main.async(group: nil, qos: .unspecified, flags: []) { [weak self = UncheckedSendable(self).value] in
                        // $s7SwiftUI14CAHostingLayerC13requestUpdate5afterySd_tFyyScMYccfU_TA
                        guard let self else {
                            return
                        }
                        
                        self.setNeedsUpdate()
                    }
                }
            }
        }
    }
    
    @_spi(Internal) public func setNeedsUpdate() {
        let viewGraphHost = self.viewGraphHost
        
        Update.locked {
            if let displayLink = viewGraphHost.displayLink {
                displayLink.nextThread = .main
            }
        }
        
        self.setNeedsLayout()
    }
}

extension CAHostingLayer : ViewGraphRenderDelegate {
    package var renderingRootView: AnyObject {
        return self
    }
    
    package func updateRenderContext(_ context: inout ViewGraphRenderContext) {
        context.contentsScale = self.contentsScale
    }
    
    package func renderIntervalForDisplayLink(timestamp: Time) -> Double {
        assertUnimplemented()
    }
}
