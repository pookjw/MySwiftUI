// 6401BBC0F2663213443101ED0E1CE437
internal import AttributeGraph
internal import CoreGraphics

private struct PlatformViewChild<Content: CoreViewRepresentable>: StatefulRule, ObservedAttribute, RemovableAttribute, InvalidatableAttribute, ScrapeableAttribute {
    @Attribute private var view: Content
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
    private var coordinator: Content.Coordinator?
    private var platformView: Content.Host?
    private var resetSeed: UInt32
    private let tracker: PropertyList.Tracker
    
    init(
        view: Attribute<Content>,
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
        coordinator: Content.Coordinator?,
        platformView: Content.Host?,
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
    
    typealias Value = Never // ViewLeafView
    
    var representedViewProvider: Content.PlatformViewProvider? {
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
