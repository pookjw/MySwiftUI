// 6401BBC0F2663213443101ED0E1CE437
public import AttributeGraph
internal import CoreGraphics

struct PlatformViewChild<Representable: CoreViewRepresentable>: StatefulRule, ObservedAttribute, RemovableAttribute, InvalidatableAttribute, ScrapeableAttribute {
    @Attribute private var view: Representable // 0x0
    @Attribute private var environment: EnvironmentValues // 0x4
    @Attribute private var transaction: Transaction // 0x8
    @Attribute private var phase: _GraphInputs.Phase // 0xc
    @Attribute private var position: CGPoint // 0x10
    @Attribute private var size: ViewSize // 0x14
    @Attribute private var transform: ViewTransform // 0x18
    private let parentID: ScrapeableID // 0x1c
    private let bridge: PreferenceBridge // 0x20
    private var links: _DynamicPropertyBuffer // 0x28
    private var features: CoreViewRepresentableFeatureBufferProxy // 0x30
    private var coordinator: Representable.Coordinator? // 0x48 (offset) / 0x4c (offset field)
    private var platformView: Representable.Host? // 0x50 (offset) / 0x50 (offset field)
    private var resetSeed: UInt32 // 0x58 (offset) / 0x54 (offset field)
    private let tracker: PropertyList.Tracker // 0x60 (offset) / 0x58 (offset field)
    
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
    
    mutating func updateValue() {
        // self -> x20 -> x22
        let graph = Graph.currentAttribute.graph
        let pattern: UInt
        if let platformView {
            pattern = UInt(bitPattern: ObjectIdentifier(platformView))
        } else {
            pattern = 0
        }
        
        Signpost.platformUpdate.traceInterval(object: platformView, "PlatformUpdate: (%p) %{public}@ [ %p ]", [UInt(bitPattern: ObjectIdentifier(graph)), "\(Representable.self)", pattern]) { 
            // $s7SwiftUI17PlatformViewChildV11updateValueyyFyyXEfU_
            // self -> x0 -> x28
            // <+1124>
            
            // x29 - 0x148 / x19
            var (view, viewChanged) = $view.valueAndFlags(options: [])
            // w21 -> x29 - 0x140 / x29 - 0x1a0
            let (phase, phaseChanged) = $phase.valueAndFlags(options: [])
            // x20 (x29 - 0x170), x24 / x29 - 0x1b0
            var (environment, environmentChanged) = $environment.valueAndFlags(options: [])
            
            if phase.resetSeed != self.resetSeed {
                // <+1348>
                links.reset()
                resetPlatformView()
            }
            
            // <+1404>
            // x20
            let leafView: UnsafePointer<ViewLeafView<Representable>>? = Graph.outputValue()
            // x29 - 0x278
            let hasLeafView = (leafView != nil)
            
            let updated = withUnsafePointer(to: &view) { pointer in
                // $s7SwiftUI17PlatformViewChildV11updateValueyyFyyXEfU_SbSpyxGXEfU_TA
                return links.update(container: UnsafeMutableRawPointer(mutating: pointer), phase: phase)
            }
            
            // x29 - 0x200
            var modified = true
            if !updated {
                // <+1572>
                if (leafView != nil), viewChanged == .unchanged, phaseChanged == .unchanged {
                    // <+1588>
                    modified = Graph.currentAttributeWasModified
                } else {
                    // <+1616>
                }
            } else {
                // <+1628>
            }
            
            // environment -> x29 - 0x170 -> x20
            // <+1644>
            // x29 - 0xa8
            let transaction = Graph.withoutUpdate { 
                // $s7SwiftUI17PlatformViewChildV11updateValueyyFyyXEfU_AA11TransactionVyXEfU0_
                /*
                 self -> x0 -> x28
                 view -> x1 -> x29 - 0x88
                 */
                // <+416>
                if self.coordinator == nil {
                    // <+500>
                    let unchecked = MainActor.assumeIsolated { [unchecked =  UncheckedSendable(view)] in
                        return UncheckedSendable(unchecked.value.makeCoordinator())
                    }
                    
                    self.coordinator = unchecked.value
                }
                
                // <+656>
                return self.transaction
            }
            
            // <+1696>
            /*
             transaction -> x29 - 0xa8 -> x25
             environment -> x20/x24 -> x29 - 0x70/x29 - 0x68
             */
            environment.preferenceBridge = self.bridge
            
            // <+1800>
            // x29 - 0x160
            let coordinator = UncheckedSendable(self.coordinator)
            // x27
            let platformView = self.platformView
            /*
             transaction -> x25 -> x29 - 0x198
             self -> x28 -> x29 - 0x168
             */
            // x29 - 0x190
            let bridge = self.bridge
            
            if let platformView {
                // <+1948>
                if environmentChanged == .changed {
                    // <+1972>
                    if tracker.hasDifferentUsedValues(environment.plist) {
                        // <+2028>
                        tracker.reset()
                        modified = true
                    }
                    
                    // <+2064>
                } else {
                    // <+2128>
                }
                
                for feature in features {
                    feature.update(forHost: platformView, environment: &environment, isInitialUpdate: false)
                }
                
                // <+2324>
                /*
                 phaseChanged -> x29 - 0x1a0 -> x24
                 environment -> x29 - 0x70 -> x28
                 */
                // <+2376>
                // x26
                let tracker = self.tracker
                tracker.initializeValues(from: environment.plist)
                // <+2468>
                Graph.withoutUpdate { 
                    // $s7SwiftUI17PlatformViewChildV11updateValueyyFyyXEfU_yyXEfU1_
                    /*
                     phaseChanged -> w0
                     environmentChanged -> w1
                     hasLeafView -> w2
                     platformView -> x3
                     environment -> x4
                     tracker -> x5
                     phase -> w6
                     */
                    fatalError("TODO")
                }
                fatalError("TODO")
            } else {
                // <+2076>
                tracker.reset()
                // <+2724>
                fatalError("TODO")
            }
            fatalError("TODO")
        }
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
