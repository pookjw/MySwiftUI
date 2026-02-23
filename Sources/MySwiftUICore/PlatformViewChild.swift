// 6401BBC0F2663213443101ED0E1CE437
public import AttributeGraph
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

@_spi(Internal) public struct ViewLeafView<Representable: CoreViewRepresentable>: UnaryView, PrimitiveView, PlatformViewFactory {
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
    
    public static nonisolated func _makeView(view: _GraphValue<ViewLeafView<Representable>>, inputs: _ViewInputs) -> _ViewOutputs {
        /*
         view -> x0 -> x29 - 0xf4
         inputs -> x1 -> x24
         return register -> x8 -> x28
         */
        var outputs = _ViewOutputs()
        // x29 - 0x118 (sp + 0x48)
        let copy_1 = inputs
        // <+152>
        if inputs.preferences.contains(DisplayList.Key.self) {
            // <+196>
            // x29 - 0x158
            let identity: _DisplayList_Identity
            if !inputs.base.options.contains(.needsStableDisplayListIDs) {
                // <+240>
                identity = _DisplayList_Identity()
                // <+280>
            } else {
                // <+1348>
                let weakAttribute = copy_1[_DisplayList_StableIdentityScope.self]
                let attribute = weakAttribute.attribute!
                identity = attribute.value.pushIdentity()
                // <+280>
            }
            
            // <+280>
            // x29 - 0xb8 (sp + 0xa8)
            let copy_2 = copy_1
            
            // x29 - 0xb8 (sp + 0xa8)
            let platformDisplayList = PlatformViewDisplayList<Representable>(
                identity: identity,
                view: view.value,
                position: copy_2.animatedPosition(),
                containerPosition: inputs.position,
                size: copy_2.animatedSize(), // <+580>
                transform: inputs.transform,
                _environment: copy_2.environment,
                safeAreaInsets: inputs.safeAreaInsets,
                contentSeed: DisplayList.Seed()
            )
            // x29 - 0xd0 (sp + 0x90)
            let platformDisplayListAttribute = Attribute(platformDisplayList)
            outputs.preferences.appendPreference(key: DisplayList.Key.self, value: platformDisplayListAttribute)
            
            // <+788>
        }
        
        // <+804>
        if inputs.base.options.contains(.animationsDisabled) {
            // <+812>
            let environment = LeafLayoutEnvironment(environment: inputs.environment, tracker: PropertyList.Tracker())
            // w24
            let environmentAttribute = Attribute(environment)
            
            let layoutComputer = InvalidatableLeafLayoutComputer(_view: view.value, environment: environmentAttribute, viewGraph: .current)
            let layoutAttribute = Attribute(layoutComputer)
            outputs.layoutComputer = layoutAttribute
        }
        
        // <+1292>
        return outputs
    }
}

fileprivate struct PlatformViewDisplayList<Representable: CoreViewRepresentable>: StatefulRule {
    let identity: _DisplayList_Identity
    @Attribute private(set) var view: ViewLeafView<Representable>
    @Attribute private(set) var position: CGPoint
    @Attribute private(set) var containerPosition: CGPoint
    @Attribute private(set) var size: ViewSize
    @Attribute private(set) var transform: ViewTransform
    private(set) var _environment: Attribute<EnvironmentValues>
    @OptionalAttribute var safeAreaInsets: SafeAreaInsets?
    private(set) var contentSeed: DisplayList.Seed
    
    var environment: EnvironmentValues {
        return _environment.value
    }
    
    typealias Value = DisplayList
    
    func updateValue() {
        fatalError("TODO")
    }
}

fileprivate struct LeafLayoutEnvironment: StatefulRule {
    @Attribute var environment: EnvironmentValues
    let tracker: PropertyList.Tracker
    
    typealias Value = EnvironmentValues
    
    func updateValue() {
        fatalError("TODO")
    }
}

fileprivate struct InvalidatableLeafLayoutComputer<Representable: CoreViewRepresentable>: StatefulRule, CustomStringConvertible {
    private(set) var _view: Attribute<ViewLeafView<Representable>>
    @Attribute private(set) var environment: EnvironmentValues
    private(set) weak var viewGraph: ViewGraph?
    
    var view: ViewLeafView<Representable> {
        return _view.value
    }
    
    var description: String {
        fatalError("TODO")
    }
    
    typealias Value = LayoutComputer
    
    func updateValue() {
        fatalError("TODO")
    }
}
