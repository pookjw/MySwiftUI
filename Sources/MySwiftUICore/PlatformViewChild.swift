// 6401BBC0F2663213443101ED0E1CE437
internal import AttributeGraph
internal import CoreGraphics

struct PlatformViewChild<Representable: CoreViewRepresentable>: StatefulRule, ObservedAttribute, RemovableAttribute, InvalidatableAttribute, ScrapeableAttribute {
    @Attribute private var view: Representable
    @Attribute private var environment: EnvironmentValues
    @Attribute private var transaction: Transaction
    @Attribute private var phase: _GraphInputs.Phase
    @Attribute private var position: CGPoint
    @Attribute private var size: ViewSize
    @Attribute private var transform: ViewTransform
    private let parentID: ScrapeableID
    private let bridge: PreferenceBridge
    private var links: _DynamicPropertyBuffer
    private var features: CoreViewRepresentableFeatureBufferProxy
    private var coordinator: Representable.Coordinator?
    private var platformView: Representable.Host?
    private var resetSeed: UInt32
    private let tracker: PropertyList.Tracker
    
    init(
        view: Attribute<Representable>,
        environment: Attribute<EnvironmentValues>,
        transaction: Attribute<Transaction>,
        phase: Attribute<_GraphInputs.Phase>,
        position: Attribute<CGPoint>,
        size: Attribute<ViewSize>,
        transform: Attribute<ViewTransform>,
        parentID: ScrapeableID,
        bridge: PreferenceBridge,
        links: _DynamicPropertyBuffer,
        features: CoreViewRepresentableFeatureBufferProxy,
        coordinator: Representable.Coordinator?,
        platformView: Representable.Host?,
        resetSeed: UInt32
    ) {
        self._view = view
        self._environment = environment
        self._transaction = transaction
        self._phase = phase
        self._position = position
        self._size = size
        self._transform = transform
        self.parentID = parentID
        self.bridge = bridge
        self.links = links
        self.features = features
        self.coordinator = coordinator
        self.platformView = platformView
        self.resetSeed = resetSeed
        self.tracker = PropertyList.Tracker()
    }
    
    typealias Value = ViewLeafView<Representable>
    
    var representedViewProvider: Representable.PlatformViewProvider? {
        fatalError("TODO")
    }
    
    func updateValue() {
        fatalError("TODO")
    }
    
    func resetPlatformView() {
        fatalError("TODO")
    }
    
    func destroy() {
        fatalError("TODO")
    }
    
    fileprivate func reset() {
        fatalError("TODO")
    }
    
    static func willRemove(attribute: AnyAttribute) {
        fatalError("TODO")
    }
    
    static func willInvalidate(attribute: AnyAttribute) {
        fatalError("TODO")
    }
    
    static func didReinsert(attribute: AnyAttribute) {
        fatalError("TODO")
    }
}

struct ViewLeafView<Representable: CoreViewRepresentable>: UnaryView, PrimitiveView, PlatformViewFactory {
    let content: Representable
    let platformView: Representable.Host
    private var coordinator: Representable.Coordinator
    
    init(content: Representable, platformView: Representable.Host, coordinator: Representable.Coordinator) {
        self.content = content
        self.platformView = platformView
        self.coordinator = coordinator
    }
    
    var representedViewProvider: Representable.PlatformViewProvider {
        fatalError("TODO")
    }
    
    func makePlatformView() -> AnyObject? {
        fatalError("TODO")
    }
    
    func updatePlatformView(_ platformView: inout AnyObject) {
        fatalError("TODO")
    }
    
    func renderPlatformView(in context: GraphicsContext, size: CGSize, renderer: DisplayList.GraphicsRenderer) {
        fatalError("TODO")
    }
    
    func sizeThatFits(in proposedSize: _ProposedSize, environment: Attribute<EnvironmentValues>, context: AnyRuleContext) -> CGSize {
        fatalError("TODO")
    }
    
    fileprivate func unifiedLayoutSize(in proposedSize: _ProposedSize) -> CGSize {
        fatalError("TODO")
    }
    
    func layoutTraits() -> _LayoutTraits {
        fatalError("TODO")
    }
    
    func depthThatFits(in proposedSize: _ProposedSize3D) -> CGFloat {
        fatalError("TODO")
    }
    
    var viewType: Any.Type {
        fatalError("TODO")
    }
}
