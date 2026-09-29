// 5BC40379787EC8BFAE898D075045DC37
public import QuartzCore

@_spi(Internal)
public class CAHostingLayer<Content> : CALayer where Content : View {
    private let viewGraphHost: ViewGraphHost
    package let eventBindingManager = EventBindingManager()
    private var lastRenderTime: Time = .zero
    private var isUpdating: Bool = false
    private var needsDeferredUpdate: Bool = false
    package let focusedResponder: ResponderNode? = nil
    private var displayLinkProvider: ((Any, Selector) -> CADisplayLink?)? = nil
    
    public var rootView: Content {
        didSet {
            assertUnimplemented()
        }
    }
    
    private var environment: EnvironmentValues {
        didSet {
            assertUnimplemented()
        }
    }
    
    private let referenceInstant: ContinuousClock.Instant
    
    private lazy var eventContext: CAHostingLayerEvent.Context = {
        assertUnimplemented()
    }()
    
    public init(rootView: Content, environment: EnvironmentValues = .init()) {
        /*
         self -> x20 -> x19
         rootView -> x0 -> x29 - 0x68
         environment -> x1 -> x23
         */
        self.environment = environment
        self.rootView = rootView
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
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    override dynamic public func layoutSublayers() {
        assertUnimplemented()
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
        assertUnimplemented()
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

extension CAHostingLayer : @unchecked Sendable {}
