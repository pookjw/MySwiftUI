// FF3C661D9D8317A1C8FE2B7FD4EDE12C
internal import AttributeGraph
private import CoreGraphics

protocol DynamicContainerItem {
    var count: Int { get }
    var needsTransitions: Bool { get }
    var zIndex: Double { get }
    func matchesIdentity(of item: Self) -> Bool
    static var supportsReuse: Bool { get }
    func canBeReused(by item: Self) -> Bool
    var list: Attribute<ViewList>? { get }
    var viewID: _ViewList_ID? { get }
}

extension DynamicContainerItem {
    var needsTransitions: Bool {
        return false
    }
    
    var zIndex: Double {
        return 0
    }
    
    static var supportsReuse: Bool {
        return false
    }
    
    func canBeReused(by item: Self) -> Bool {
        return false
    }
    
    var list: Attribute<ViewList>? {
        return nil
    }
    
    var viewID: _ViewList_ID? {
        return nil
    }
}

protocol DynamicContainerAdaptor {
    associatedtype Item : DynamicContainerItem
    associatedtype Items
    associatedtype ItemLayout
    
    static var maxUnusedItems: Int { get }
    func updatedItems() -> Self.Items?
    func foreachItem(items: Self.Items, _ body: (Self.Item) -> Void)
    static func containsItem(_ items: Self.Items, _ item: Self.Item) -> Bool
    func makeItemLayout(item: Self.Item, uniqueId: UInt32, inputs: _ViewInputs, containerInfo: Attribute<DynamicContainer.Info>, containerInputs: (inout _ViewInputs) -> Void) -> (_ViewOutputs, Self.ItemLayout)
    func removeItemLayout(uniqueId: UInt32, itemLayout: Self.ItemLayout)
}

extension DynamicContainerAdaptor {
    static var maxUnusedItems: Int {
        return 0
    }
}

extension DynamicContainerAdaptor where Self.Item == Self.Items {
    func foreachItem(items: Self.Items, _ body: (Self.Item) -> Void) {
        body(items)
    }
    
    static func containsItem(_ items: Self.Items, _ item: Self.Item) -> Bool {
        return items.matchesIdentity(of: item)
    }
}

struct DynamicLayoutViewAdaptor: DynamicContainerAdaptor {
    typealias Item = DynamicViewListItem
    typealias Items = ViewList
    
    @Attribute private(set) var items: any ViewList
    @OptionalAttribute var childGeometries: [ViewGeometry]?
    private(set) var childDepthData: DynamicLayoutViewAdaptor.ChildDepthData
    private(set) var mutateLayoutMap: ((inout DynamicLayoutMap) -> Void) -> Void
    
    func updatedItems() -> ViewList? {
        let (items, changed) = $items.changedValue(options: [])
        if changed {
            return items
        } else {
            return nil
        }
    }
    
    func foreachItem(items: ViewList, _ body: (DynamicViewListItem) -> Void) {
        var number = 0
        _ = items.applySublists(from: &number, list: $items) { sublist in
            // $s7SwiftUI24DynamicLayoutViewAdaptorV11foreachItem5items_yAA0E4List_p_yAA0cejH0VXEtFSbAA01_eJ8_SublistVXEfU_TA
            let item = DynamicViewListItem(
                id: sublist.id,
                elements: sublist.elements,
                traits: sublist.traits,
                list: sublist.list
            )
            body(item)
            return true
        }
    }
    
    static func containsItem(_ items: ViewList, _ item: DynamicViewListItem) -> Bool {
        fatalError("TODO")
    }
    
    func makeItemLayout(item: DynamicViewListItem, uniqueId: UInt32, inputs: _ViewInputs, containerInfo: Attribute<DynamicContainer.Info>, containerInputs: (inout _ViewInputs) -> Void) -> (_ViewOutputs, ItemLayout) {
        /*
         $s7SwiftUI24DynamicLayoutViewAdaptorV08makeItemD04item8uniqueId6inputs13containerInfo0M6InputsAA01_E7OutputsV_AC0hD0VtAA0ce4ListH0V_s6UInt32VAA01_eO0V14AttributeGraph0S0VyAA0C9ContainerV0N0VGyASzXEtF
         
         $s7SwiftUI20DynamicContainerInfoV8makeItem_8uniqueId9container18disableTransitionsAA0cD0V0gE0C0G0Qz_s6UInt32V14AttributeGraph0N0VyAI0E0VGSbtFAKyXEfU0_AA0C17LayoutViewAdaptorV_Tg5
         inlined : <+328>~
         */
        // w25
        let isArchived = inputs[ArchivedViewInput.self].isArchived
        
        let canTransition = item.traits.value(for: CanTransitionTraitKey.self, defaultValue: false)
        // true -> <+332>
        var flag = false
        // x27
        var transition_1: AnyTransition!
        // x21
        var transition_2: AnyTransition?
        if canTransition {
            // <+232>
            transition_1 = item.traits.value(for: TransitionTraitKey.self)
            
            if isArchived {
                // <+332>
                flag = true
            } else {
                // <+288>
                if transition_1.isIdentity {
                    // <+308>
                    transition_2 = nil
                    // <+596>
                } else {
                    // <+332>
                    flag = true
                }
            }
        } else {
            // <+324>
            transition_2 = nil
            // <+604>
        }
        
        if flag {
            // <+332>
            // <+568> (inlined)
            // isArchived -> x19 + 0x4
            // x26
            let accessibilityPrefersCrossFadeTransitions = Graph.withoutUpdate {
                let environment = inputs.environment.value
                return environment.accessibilityPrefersCrossFadeTransitions
            }
            
            // inlined
            transition_2 = transition_1.adjustedForAccessibility(prefersCrossFade: accessibilityPrefersCrossFadeTransitions)
            
            // <+572>
            // <+604>
        }
        
        // <+604>
        // <+812> (inlined)
        
        // x29 - 0x68
        let outputs: _ViewOutputs? = withoutActuallyEscaping(containerInputs) { escapingClosure in
            var viewIndex: Int32 = 0
            
            if item.elements.subgraphs.isValid {
                return item.elements.base.makeAllElements(inputs: inputs) { incoming, transform in
                    // $s7SwiftUI24DynamicLayoutViewAdaptorV08makeItemD04item8uniqueId6inputs13containerInfo0M6InputsAA01_E7OutputsV_AC0hD0VtAA0ce4ListH0V_s6UInt32VAA01_eO0V14AttributeGraph0S0VyAA0C9ContainerV0N0VGyASzXEtFAKSgAS_AkSctXEfU0_
                    // self -> x19
                    // x19 + 0x240
                    let copy_1 = incoming
                    // x19 + 0x1e0
                    var copy_2 = incoming
                    let options = copy_1.base.options
                    // x28
                    let cachedEnvironmentBox = copy_1.base.cachedEnvironment
                    // sp + 0x2a0
                    let cachedEnvironment = cachedEnvironmentBox.value
                    // x21
                    copy_2.base.cachedEnvironment = MutableBox(cachedEnvironmentBox.value)
                    _ = consume copy_1
                    
                    // <+316>
                    escapingClosure(&copy_2)
                    
                    if options.contains(.viewNeedsGeometry) {
                        // <+328>
                        let childGeometries = Attribute(
                            DynamicLayoutViewChildGeometry(
                                containerInfo: containerInfo,
                                childGeometries: self.$childGeometries!,
                                id: DynamicContainerID(
                                    uniqueId: uniqueId,
                                    viewIndex: viewIndex
                                )
                            )
                        )
                        
                        copy_2.size = childGeometries.size()
                        copy_2.position = childGeometries.origin()
                        copy_2.requestsLayoutComputer = true
                    }
                    
                    // <+488>
                    // x20
                    let transition = transition_2
                    
                    // inlined
                    var transform = transform
                    DynamicLayoutViewAdaptor.makeDepthTransform(
                        depthData: childDepthData,
                        containerInfo: containerInfo,
                        id: DynamicContainerID(
                            uniqueId: uniqueId,
                            viewIndex: viewIndex
                        ),
                        body: &transform
                    )
                    
                    // x22
                    let outputs: _ViewOutputs
                    if let transition {
                        // x19 + 0x170
                        let _ = copy_2
                        let copy_3 = copy_2
                        
                        var makeTransition = DynamicLayoutViewAdaptor.MakeTransition(
                            containerInfo: containerInfo,
                            uniqueId: uniqueId,
                            item: item,
                            inputs: copy_3,
                            makeElt: transform,
                            outputs: nil,
                            isArchived: isArchived
                        )
                        
                        transition.visitBase(applying: &makeTransition)
                        outputs = makeTransition.outputs!
                        // <+968>
                    } else {
                        // <+836>
                        // x19 + 0x170
                        let copy_3 = copy_2
                        // x19 + 0x110
                        let copy_4 = copy_2
                        // x19 + 0x30
                        let _ = copy_3
                        outputs = transform(copy_4)
                        // <+968>
                    }
                    
                    // <+968>
                    mutateLayoutMap { _ in
                        // outputs
                        // $s7SwiftUI24DynamicLayoutViewAdaptorV08makeItemD04item8uniqueId6inputs13containerInfo0M6InputsAA01_E7OutputsV_AC0hD0VtAA0ce4ListH0V_s6UInt32VAA01_eO0V14AttributeGraph0S0VyAA0C9ContainerV0N0VGyASzXEtFAKSgAS_AkSctXEfU0_yAA0cD3MapVzXEfU_TA
                        fatalError("TODO")
                    }
                    
                    // <+1080>
                    viewIndex &+= 1
                    return outputs
                }
            } else {
                return nil
            }
        }
        
        let outputs_2 = outputs ?? _ViewOutputs()
        let itemLayout = DynamicLayoutViewAdaptor.ItemLayout(release: item.elements.subgraphs.retain())
        
        return (outputs_2, itemLayout)
    }
    
    func removeItemLayout(uniqueId: UInt32, itemLayout: ItemLayout) {
        fatalError("TODO")
    }
}

extension DynamicLayoutViewAdaptor {
    fileprivate struct MakeTransition: TransitionVisitor {
        private(set) var containerInfo: Attribute<DynamicContainer.Info>
        private(set) var uniqueId: UInt32
        private(set) var item: DynamicViewListItem
        private(set) var inputs: _ViewInputs
        private(set) var makeElt: (_ViewInputs) -> _ViewOutputs
        private(set) var outputs: _ViewOutputs?
        private(set) var isArchived: Bool // 0xd0
        
        mutating func visit<T: Transition>(_ transition: T) {
            /*
             transition -> x23
             */
            let list: OptionalAttribute<ViewList>
            if let _list = item.list {
                list = OptionalAttribute(_list)
            } else {
                list = OptionalAttribute()
            }
            
            // x25
            let helper = TransitionHelper<T>(
                list: list,
                info: containerInfo,
                uniqueId: uniqueId,
                transition: transition,
                phase: .identity
            )
            
            if isArchived {
                makeArchivedTransition(helper: helper)
            } else {
                // x28
                let copy_1 = helper
                // x24
                let copy_2 = copy_1
                // x19 + 0x34
                let transitionValue = _GraphValue(ViewListTransition(helper: copy_2))
                // x19 + 0x50
                let copy_3 = inputs
                
                let outputs = T.makeView(view: transitionValue, inputs: copy_3) { [makeElt] graph, inputs in
                    // $s7SwiftUI16ModifiedElements33_E479C0E92CDD045BAF2EF653123E2E0BLLV04makeD04from6inputs11indirectMap4bodyAA12_ViewOutputsVSg_SbtSiz_AA01_S6InputsVAA017IndirectAttributeQ0CSgAL_SbtAN_AkNctXEtFAL_SbtAL_SbtAN_AkNctcXEfU_AL_SbtAN_AkNctXEfU_AkNcfU_7projectL_yAKxmAA0S8ModifierRzlFAkA6_GraphV_ANtcfU_TA
                    return makeElt(inputs)
                }
                
                self.outputs = outputs
            }
        }
        
        fileprivate func makeArchivedTransition<T: Transition>(helper: TransitionHelper<T>) {
            fatalError("TODO")
        }
    }
    
    struct ItemLayout {
        private(set) var release: _ViewList_SubgraphRelease?
    }
    
    enum ChildDepthData {
        case geometries(Attribute<[ViewDepthGeometry]>)
        case depths(Attribute<[ViewDepth]>)
        case none
    }
}

struct LayoutChildGeometries: Rule, AsyncAttribute {
    @Attribute private var parentSize: ViewSize
    @Attribute private var parentPosition: CGPoint
    @Attribute var layoutComputer: LayoutComputer
    
    init(parentSize: Attribute<ViewSize>, parentPosition: Attribute<CGPoint>, layoutComputer: Attribute<LayoutComputer>) {
        self._parentSize = parentSize
        self._parentPosition = parentPosition
        self._layoutComputer = layoutComputer
    }
    
    var value: [ViewGeometry] {
        fatalError("TODO")
    }
}

struct LayoutChildDepths<T: Layout>: Rule, AsyncAttribute {
    @Attribute private var parentSize: ViewSize
    @Attribute private var parentDepth: ViewDepth
    @Attribute private var childGeometries: [ViewGeometry]
    @Attribute private var layoutComputer: LayoutComputer
    
    init(parentSize: Attribute<ViewSize>, parentDepth: Attribute<ViewDepth>, childGeometries: Attribute<[ViewGeometry]>, layoutComputer: Attribute<LayoutComputer>) {
        self._parentSize = parentSize
        self._parentDepth = parentDepth
        self._childGeometries = childGeometries
        self._layoutComputer = layoutComputer
    }
    
    var value: [ViewDepth] {
        fatalError("TODO")
    }
}

fileprivate struct DynamicLayoutViewChildGeometry: StatefulRule, AsyncAttribute {
    @Attribute private(set) var containerInfo: DynamicContainer.Info
    @Attribute private(set) var childGeometries: [ViewGeometry]
    let id: DynamicContainerID
    
    typealias Value = ViewGeometry
    
    func updateValue() {
        fatalError("TODO")
    }
}

fileprivate struct TransitionHelper<T: Transition> {
    @OptionalAttribute var list: ViewList?
    @Attribute private(set) var info: DynamicContainer.Info
    let uniqueId: UInt32
    private(set) var transition: T
    private(set) var phase: TransitionPhase
    
    func update() {
        fatalError("TODO")
    }
}

fileprivate struct ViewListTransition<T: Transition>: StatefulRule, AsyncAttribute {
    private(set) var helper: TransitionHelper<T>
    
    typealias Value = T.Body
    
    func updateValue() {
        fatalError("TODO")
    }
}

fileprivate struct ViewListContentTransition<T: Transition>: StatefulRule, AsyncAttribute {
    private(set) var helper: TransitionHelper<T>
    @Attribute private(set) var size: ViewSize
    @Attribute private(set) var environment: EnvironmentValues
    
    init(helper: TransitionHelper<T>, size: Attribute<ViewSize>, environment: Attribute<EnvironmentValues>) {
        self.helper = helper
        self._size = size
        self._environment = environment
    }
    
    typealias Value = ContentTransitionEffect
    
    func updateValue() {
        fatalError("TODO")
    }
}
