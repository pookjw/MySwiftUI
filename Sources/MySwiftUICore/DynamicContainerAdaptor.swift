// FF3C661D9D8317A1C8FE2B7FD4EDE12C
internal import AttributeGraph
private import CoreGraphics

protocol DynamicContainerItem {
    // TODO
}

protocol DynamicContainerAdaptor {
    associatedtype Item : DynamicContainerItem
    associatedtype Items
    associatedtype ItemLayout
    // TODO
}

struct DynamicLayoutViewAdaptor: DynamicContainerAdaptor {
    typealias Item = DynamicContainerItem
    typealias Items = ViewList
    
    @Attribute private var items: ViewList
    @OptionalAttribute private var childGeometries: [ViewGeometry]?
    private var childDepthData: DynamicLayoutViewAdaptor.ChildDepthData
    private var mutateLayoutMap: ((inout DynamicLayoutMap) -> Void) -> Void
    
    init(
        items: Attribute<ViewList>,
        childGeometries: OptionalAttribute<[ViewGeometry]>,
        childDepthData: DynamicLayoutViewAdaptor.ChildDepthData,
        mutateLayoutMap: @escaping ((inout DynamicLayoutMap) -> Void) -> Void
    ) {
        self._items = items
        self._childGeometries = childGeometries
        self.childDepthData = childDepthData
        self.mutateLayoutMap = mutateLayoutMap
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
        var hasScrollable = copy_1.preferences.contains(ScrollablePreferenceKey.self)
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
        let copy_4 = copy_1
        
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
            childDepthData: childDepthData) { [layoutComputerAttribute] handler in
                // $s7SwiftUI6LayoutPAAE15makeDynamicView4root6inputs10properties4listAA01_F7OutputsVAA11_GraphValueVyxG_AA01_F6InputsVAA0C10PropertiesV09AttributeL00P0VyAA0F4List_pGtFZ10mapMutatorL_5thunkyyAA0eC3MapVzXE_tAaBRzlFTA
                fatalError("TODO")
            }
        let (containerInfo, outputs) = DynamicContainer.makeContainer(adaptor: adapter, inputs: copy_5)
        
        
        fatalError("TODO")
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
