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
        fatalError("TODO")
    }
    
    func removeItemLayout(uniqueId: UInt32, itemLayout: ItemLayout) {
        fatalError("TODO")
    }
}

extension DynamicLayoutViewAdaptor {
    fileprivate struct MakeTransition {
        private var containerInfo: Attribute<DynamicContainer.Info>
        private var uniqueId: UInt32
        private var item: DynamicViewListItem
        private var inputs: _ViewInputs
        private var makeElt: (_ViewInputs) -> _ViewOutputs
        private var outputs: _ViewOutputs?
        private var isArchived: Bool
    }
    
    struct ItemLayout {
        private var release: _ViewList_SubgraphRelease?
    }
    
    enum ChildDepthData {
        case geometries(Attribute<[ViewDepthGeometry]>)
        case depths(Attribute<[ViewDepth]>)
        case none
    }
}

extension Layout {
    static func makeDynamicView(root: _GraphValue<Self>, inputs: _ViewInputs, properties: LayoutProperties, list: Attribute<any ViewList>) -> _ViewOutputs {
        // properties은 안 쓰는듯
        /*
         inputs -> x21
         */
        // w22
        let root = root
        // sp + 0x260
        let copy_1 = inputs
        // sp + 0x60
        let list = list
        // sp + 0x94
        let hasScrollable = copy_1.preferences.contains(ScrollablePreferenceKey.self)
        // w20
        let hasScrollContent = copy_1.preferences.contains(ScrollTargetRole.ContentKey.self)
        // sp + 0x2c0
        let copy_2 = inputs.base
        // sp + 0x98
        let scrollTargetRole = copy_2.scrollTargetRole
        // sp + 0x48
        let scrollTargetRemovePreference = copy_2.scrollTargetRemovePreference
        // w26
        let options = copy_2.options
        // x24
        let inputs = copy_2.customInputs
        
        // sp + 0x9c
        let withinAccessibilityRotor: Bool
        if options.contains(.needsAccessibility) {
            withinAccessibilityRotor = false
        } else {
            withinAccessibilityRotor = inputs[WithinAccessibilityRotor.self]
        }
        
        // <+252>
        // x27 / sp + 0x70
        var layoutComputerAttribute: Attribute<LayoutComputer>?
        // w23
        let depthsAttribute: Attribute<[ViewDepth]>
        // w25
        let geometriesAttribute: Attribute<[ViewGeometry]>
        
        // options -> sp + 0x7c
        if hasScrollable || options.isSuperset(of: [.viewRequestsLayoutComputer, .viewNeedsGeometry]) || withinAccessibilityRotor {
            // <+352>
            // w26
            let _layoutComputerAttribute = Attribute(
                DynamicLayoutComputer(
                    layout: root.value,
                    environment: copy_2.environment,
                    containerInfo: OptionalAttribute(),
                    layoutMap: DynamicLayoutMap()
                )
            )
            layoutComputerAttribute = _layoutComputerAttribute
            
            // w27
            let sizeAttribute = copy_1.size
            
            // w25
            geometriesAttribute = Attribute(
                LayoutChildGeometries(
                    parentSize: sizeAttribute,
                    parentPosition: copy_1.position,
                    layoutComputer: _layoutComputerAttribute
                )
            )
            
            // <+724>
            // w23
            depthsAttribute = Attribute(
                LayoutChildDepths<Self>(
                    parentSize: sizeAttribute,
                    parentDepth: copy_1.transform[keyPath: \.depth],
                    childGeometries: geometriesAttribute,
                    layoutComputer: _layoutComputerAttribute
                )
            )
            
            let enableLayoutDepthStashing = inputs[EnableLayoutDepthStashing.self]
            if enableLayoutDepthStashing && geometriesAttribute.identifier != .empty {
                // <+944>
                geometriesAttribute.mutateBody(as: LayoutChildGeometries.self, invalidating: true) { rule in
                    // $sSo11AGAttributea14AttributeGraphE10mutateBody2as12invalidating_yxm_SbyxzXEtlFySvXEfU_7SwiftUI21DynamicLayoutComputer33_20EDA2BED32E8B299AFBDA7A4F5BCE87LLVyAG22GeometryReaderLayout3D33_638EB2064D6D992C8A48A894A8F58A16LLVG_Tg5TA
                    rule.$layoutComputer = Attribute(
                        DepthStashingLayoutComputer(
                            layoutComputer: rule.$layoutComputer,
                            depth: copy_1.transform[keyPath: \.depth]
                        )
                    )
                }
                // <+1088>
            } else {
                // <+1072>
                // <+1088>
            }
        } else {
            // <+340>
            depthsAttribute = Attribute(identifier: .empty)
            geometriesAttribute = Attribute(identifier: .empty)
            // <+1088>
        }
        
        // <+1088>
        // sp + 0x1a0
        var copy_3 = copy_1
        copy_3.base.options = options.subtracting(.viewRequestsLayoutComputer)
        
        if hasScrollContent, scrollTargetRemovePreference {
            // <+1188>
            copy_3.preferences.remove(ScrollTargetRole.ContentKey.self)
            copy_3.preferences.remove(UpdateScrollStateRequestKey.self)
        }
        
        // <+1448>
        // sp + 0x110
        _ = copy_1
        
        if scrollTargetRole.attribute != nil {
            // <+1488>
            copy_3.scrollTargetRole = OptionalAttribute<ScrollTargetRole.Role?>()
            copy_3.scrollTargetRemovePreference = true
            copy_3.base.resetScrollPosition(kind: .scrollContent)
        }
        
        // <+1632>
        // sp + 0x200
        let copy_5 = copy_3
        
        let childDepthData: DynamicLayoutViewAdaptor.ChildDepthData
        if depthsAttribute.identifier == .empty {
            childDepthData = .none
        } else {
            childDepthData = .depths(depthsAttribute)
        }
        let adapter = DynamicLayoutViewAdaptor(
            items: list,
            childGeometries: OptionalAttribute(geometriesAttribute),
            childDepthData: childDepthData
        ) { [layoutComputerAttribute] handler in
            // $s7SwiftUI6LayoutPAAE15makeDynamicView4root6inputs10properties4listAA01_F7OutputsVAA11_GraphValueVyxG_AA01_F6InputsVAA0C10PropertiesV09AttributeL00P0VyAA0F4List_pGtFZ10mapMutatorL_5thunkyyAA0eC3MapVzXE_tAaBRzlFTA
            fatalError("TODO")
        }
        // sp + 0xd4 / sp + 0xc0
        var (containerInfo, outputs) = DynamicContainer.makeContainer(adaptor: adapter, inputs: copy_5)
        
        if let layoutComputerAttribute {
            layoutComputerAttribute.mutateBody(as: DynamicLayoutComputer<Self>.self, invalidating: true) { dynamicLayoutComputer in
                dynamicLayoutComputer.$containerInfo = containerInfo
            }
        }
        
        // <+1908>
        if (scrollTargetRole.attribute != nil) || hasScrollable || withinAccessibilityRotor {
            // <+1936>
            fatalError("TODO")
        } else {
            // <+2064>
            // <+3312>
        }
        
        // <+3312>
        if options.contains(.viewRequestsLayoutComputer) {
            outputs.layoutComputer = layoutComputerAttribute
        }
        
        return outputs
    }
}

fileprivate struct DynamicLayoutComputer<T: Layout>: StatefulRule, AsyncAttribute, CustomStringConvertible {
    @Attribute private var layout: T
    @Attribute private var environment: EnvironmentValues
    @OptionalAttribute var containerInfo: DynamicContainer.Info?
    private var layoutMap: DynamicLayoutMap
    
    var description: String {
        fatalError("TODO")
    }
    
    init(
        layout: Attribute<T>,
        environment: Attribute<EnvironmentValues>,
        containerInfo: OptionalAttribute<DynamicContainer.Info>,
        layoutMap: DynamicLayoutMap
    ) {
        self._layout = layout
        self._environment = environment
        self._containerInfo = containerInfo
        self.layoutMap = layoutMap
    }
    
    typealias Value = LayoutComputer
    
    func updateValue() {
        fatalError("TODO")
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
