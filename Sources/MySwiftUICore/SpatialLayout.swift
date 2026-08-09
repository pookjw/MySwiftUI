// 95F826677D45CA8B933F82B5C55B1E9B
internal import CoreGraphics
internal import Spatial
internal import AttributeGraph
private import _MySwiftUIShims

protocol SpatialLayout : Animatable {
    associatedtype Cache3D
    
    static var layoutProperties: SpatialLayoutProperties { get }
    
    func makeCache(subviews: SpatialLayoutSubviews) -> Self.Cache3D
    func updateCache(_ cache: inout Self.Cache3D, subviews: SpatialLayoutSubviews)
    func volumeThatFits(proposal: _ProposedSize3D, subviews: SpatialLayoutSubviews, cache: inout Self.Cache3D) -> Size3D
    func placeSubviews(in bounds: Rect3D, proposal: _ProposedSize3D, subviews: SpatialLayoutSubviews, cache: inout Self.Cache3D)
    func spacing(subviews: SpatialLayoutSubviews, cache: inout Self.Cache3D) -> ViewSpacing3D
    func explicitAlignment(of guide: DepthAlignment, in bounds: Rect3D, proposal: _ProposedSize3D, subviews: SpatialLayoutSubviews, cache: inout Self.Cache3D) -> CGFloat?
    func explicitAlignment(of guide: HorizontalAlignment, in bounds: Rect3D, proposal: _ProposedSize3D, subviews: SpatialLayoutSubviews, cache: inout Self.Cache3D) -> CGFloat?
    func explicitAlignment(of guide: VerticalAlignment, in bounds: Rect3D, proposal: _ProposedSize3D, subviews: SpatialLayoutSubviews, cache: inout Self.Cache3D) -> CGFloat?
    static func _makeSpatialLayoutView(root: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewListOutputs) -> _ViewOutputs
    
    // 아래들은 method descriptor는 없지만 symbol이 존재함
    static func makeDynamicSpatialLayoutView(root: _GraphValue<Self>, inputs: _ViewInputs, properties: SpatialLayoutProperties, list: Attribute<any ViewList>) -> _ViewOutputs
    static func makeStaticSpatialLayoutView(root: _GraphValue<Self>, inputs: _ViewInputs, properties: SpatialLayoutProperties, list: _ViewList_Elements) -> _ViewOutputs
}

extension SpatialLayout {
    func updateSpatialLayoutComputer<T : StatefulRule>(rule: inout T, layoutContext: SizeAndSpacingContext, children: LayoutProxyCollection) where T.Value == LayoutComputer {
        rule.update(
            modify: { (engine: inout StashedDepthLayoutEngine<ViewSpatialLayoutEngine<Self>>) in
                // $s7SwiftUI13SpatialLayoutPAAE06updatecD8Computer4rule13layoutContext8childrenyqd__z_AA014SizeAndSpacingI0VAA0D15ProxyCollectionVt14AttributeGraph12StatefulRuleRd__AA0dF0V5ValueRtd__lFyAA012StashedDepthD6EngineVyAA04ViewcdW0VyxGGzXEfU_TA
                engine.base
                    .update(
                        layout: self,
                        context: layoutContext,
                        children: children
                    )
            },
            create: {
                // $s7SwiftUI13SpatialLayoutPAAE06updatecD8Computer4rule13layoutContext8childrenyqd__z_AA014SizeAndSpacingI0VAA0D15ProxyCollectionVt14AttributeGraph12StatefulRuleRd__AA0dF0V5ValueRtd__lFAA012StashedDepthD6EngineVyAA04ViewcdW0VyxGGyXEfU0_TA
                let engine = ViewSpatialLayoutEngine<Self>(
                    layout: self,
                    layoutContext: layoutContext,
                    children: children
                )
                
                return StashedDepthLayoutEngine(base: engine)
            }
        )
    }
}

// $s7SwiftUI13SpatialLayoutPAAE011makeDynamiccD4View4root6inputs10properties4listAA01_G7OutputsVAA11_GraphValueVyxG_AA01_G6InputsVAA0cD10PropertiesV09AttributeM00Q0VyAA0G4List_pGtFZAA07_ZStackD0V_Tt2t4B5
extension SpatialLayout where Self == _ZStackLayout {
    nonisolated static func makeDynamicSpatialLayoutView(root: _GraphValue<_ZStackLayout>, inputs: _ViewInputs, properties: SpatialLayoutProperties, list: Attribute<any ViewList>) -> _ViewOutputs {
        /*
         root -> x0 -> w26
         inputs -> x1 -> x23
         properties -> dead
         list -> w2 -> x19 + 0x60
         */
        // w24
        let hasScrollablePreference = inputs.preferences.contains(ScrollablePreferenceKey.self)
        // x19 + 0x48
        let hasScrollTargetRoleContent = inputs.preferences.contains(ScrollTargetRole.ContentKey.self)
        
        // x29 - 0xf0
        let copy_1 = inputs.base
        // x19 + 0x150
        let _ = copy_1
        // x19 + 0x84
        let scrollTargetRole = copy_1.scrollTargetRole
        // x19 + 0x38
        let scrollTargetRemovePreference = copy_1.scrollTargetRemovePreference
        
        // <+180>
        // x19 + 0x8c
        let options = copy_1.options
        
        // x19 + 0x88
        let withinAccessibilityRotor: Bool
        if options.contains(.needsAccessibility) {
            withinAccessibilityRotor = copy_1[WithinAccessibilityRotor.self]
        } else {
            withinAccessibilityRotor = false
        }
        
        // <+228>
        // hasScrollablePreference -> w24 -> x19 + 0x6c
        // x28
        var layoutComputerAttribute: Attribute<LayoutComputer>? = nil
        // x19 + 0x78
        var childViewGeometriesAttribute = OptionalAttribute<[ViewGeometry]>()
        // w24
        var childDepthGeometriesAttribute = OptionalAttribute<[ViewDepthGeometry]>()
        
        if
            !options.intersection([.viewNeedsGeometry, .viewRequestsLayoutComputer]).isEmpty ||
                hasScrollablePreference ||
                withinAccessibilityRotor
        {
            // <+316>
            // x19 + 0x150
            let layoutComputer = DynamicLayoutComputer<Self>(
                layout: root.value,
                environment: copy_1.environment,
                containerInfo: OptionalAttribute(),
                layoutMap: DynamicLayoutMap()
            )
            
            let _layoutComputerAttribute = Attribute(layoutComputer)
            layoutComputerAttribute = _layoutComputerAttribute
            
            // x19 + 0x150
            let parentSize3D = ParentSize3D(
                size: inputs.size,
                depth: inputs.transform.depth
            )
            
            let viewSize3D = Attribute(parentSize3D)
            
            let layoutChildGeometries3D = LayoutChildGeometries3D<ViewSpatialLayoutEngine<_ZStackLayout>>(
                parentSize: viewSize3D,
                parentPosition: inputs.position,
                layoutComputer: _layoutComputerAttribute
            )
            
            let geometries3D = Attribute(layoutChildGeometries3D)
            let childViewGeometries = ChildViewGeometries(geometries3D: geometries3D)
            childViewGeometriesAttribute = OptionalAttribute(Attribute(childViewGeometries))
            let childDepthGeometries = ChildDepthGeometries(geometries3D: geometries3D)
            childDepthGeometriesAttribute = OptionalAttribute(Attribute(childDepthGeometries))
            // <+932>
        }
        
        // <+932>
        // x19 + 0x1e0
        var copy_2 = inputs
        copy_2.base.options = options.subtracting(.viewRequestsLayoutComputer)
        
        if !hasScrollTargetRoleContent || !scrollTargetRemovePreference {
            // <+1060>
            // x19 + 0x150
            let _ = inputs
        } else {
            copy_2.preferences.remove(ScrollTargetRole.ContentKey.self)
            copy_2.preferences.remove(UpdateScrollStateRequestKey.self)
            
            // x19 + 0x150
            let _ = inputs
            // <+1080>
        }
        
        // <+1080>
        if scrollTargetRole.attribute != nil {
            copy_2.scrollTargetRole = OptionalAttribute()
            copy_2.scrollTargetRemovePreference = true
            copy_2.base.resetScrollPosition(kind: .scrollContent)
        }
        
        // <+1244>
        func mapMutator(thunk: (inout DynamicLayoutMap) -> Void) {
            // $s7SwiftUI13SpatialLayoutPAAE011makeDynamiccD4View4root6inputs10properties4listAA01_G7OutputsVAA11_GraphValueVyxG_AA01_G6InputsVAA0cD10PropertiesV09AttributeM00Q0VyAA0G4List_pGtFZ10mapMutatorL_5thunkyyAA0fD3MapVzXE_tAaBRzlFAA07_ZStackD0V_Tg5TA
            guard let layoutComputerAttribute else {
                return
            }
            
            layoutComputerAttribute.mutateBody(as: DynamicLayoutComputer<Self>.self, invalidating: true) { dynamicLayoutComputer in
                thunk(&dynamicLayoutComputer.layoutMap)
            }
        }
        
        let childDepthData: DynamicLayoutViewAdaptor.ChildDepthData
        if let depthsAttribute = childDepthGeometriesAttribute.attribute {
            childDepthData = .geometries(depthsAttribute)
        } else {
            childDepthData = .none
        }
        
        let adaptor = DynamicLayoutViewAdaptor(
            items: list,
            childGeometries: childViewGeometriesAttribute,
            childDepthData: childDepthData,
            mutateLayoutMap: mapMutator(thunk:)
        )
        
        // x29 - 0xc0
        let copy_3 = copy_2
        // x19 + 0xb4 / x26
        var (containerInfo, outputs) = DynamicContainer.makeContainer(adaptor: adaptor, inputs: copy_3)
        
        if let layoutComputerAttribute {
            // <+1368>
            layoutComputerAttribute.mutateBody(as: DynamicLayoutComputer<Self>.self, invalidating: true) { dynamicLayoutComputer in
                // $s7SwiftUI8Layout3DPAAE17makeDynamicView3D4root6inputs10properties4listAA12_ViewOutputsVAA11_GraphValueVyxG_AA01_K6InputsVAA16LayoutPropertiesV09AttributeM00R0VyAA0K4List_pGtFZyAA0eP8Computer33_20EDA2BED32E8B299AFBDA7A4F5BCE87LLVyxGzXEfU_AA06ZStackC1DV_Tg5TA
                dynamicLayoutComputer.$containerInfo = containerInfo
            }
        }
        
        // <+1520>
        if
            scrollTargetRole.attribute != nil ||
                withinAccessibilityRotor ||
                hasScrollablePreference
        {
            let scrollable = DynamicLayoutScrollable(
                list: WeakAttribute(list),
                container: WeakAttribute(containerInfo),
                childGeometries: WeakAttribute(childViewGeometriesAttribute.attribute),
                position: WeakAttribute(inputs.position),
                transform: WeakAttribute(inputs.transform),
                parent: WeakAttribute(copy_1.scrollable.attribute),
                children: WeakAttribute(outputs.preferences[ScrollablePreferenceKey.self])
            )
            
            if withinAccessibilityRotor || hasScrollablePreference {
                outputs.preferences[ScrollablePreferenceKey.self] = Attribute(
                    value: [scrollable as (any Scrollable)]
                )
            }
            
            if let scrollTargetRoleAttribute = scrollTargetRole.attribute {
                let collection = Attribute(value: scrollable as (any ScrollableCollection))
                
                if inputs.preferences.keys.contains(ScrollTargetRole.ContentKey.self) {
                    let setLayout = ScrollTargetRole.SetLayout(
                        role: scrollTargetRoleAttribute,
                        collection: collection
                    )
                    
                    let setLayoutAttribute = Attribute(setLayout)
                    outputs.preferences.makePreferenceTransformer(inputs: inputs.preferences, key: ScrollTargetRole.ContentKey.self, transform: setLayoutAttribute)
                }
                
                let transform = ScrollStateRequestTransform(
                    collection: collection,
                    inputs: inputs
                )
                
                if inputs.preferences.keys.contains(UpdateScrollStateRequestKey.self) {
                    let requestAttribute = Attribute(transform)
                    outputs.preferences.makePreferenceTransformer(inputs: inputs.preferences, key: UpdateScrollStateRequestKey.self, transform: requestAttribute)
                }
            }
            
            if withinAccessibilityRotor {
                copy_1.layoutAccessibilityProvider.makeAccessibility(inputs: inputs, outputs: &outputs)
            }
        }
        
        // <+1700>
        if options.contains(.viewRequestsLayoutComputer) {
            outputs.layoutComputer = layoutComputerAttribute
        }
        
        return outputs
    }
    
    nonisolated static func makeStaticSpatialLayoutView(root: _GraphValue<_ZStackLayout>, inputs: _ViewInputs, properties: SpatialLayoutProperties, list: any _ViewList_Elements) -> _ViewOutputs {
        /*
         root -> x0 -> x21
         inputs -> x1 -> x22
         properties -> x2 -> x24
         list -> x3 -> x23
         return pointer -> x8 -> x19
         */
        let count = list.count
        // true -> <+128> / false -> <+592>
        let flag: Bool
        
        if count == 1 {
            // <+124>
            if ((properties.value & (1 &<< 16)) != 0) {
                // <+592>
                flag = false
            } else {
                // <+128>
                flag = true
            }
        } else if count != 0 || ((properties.value & (1 &<< 8)) == 0) {
            // <+128>
            flag = true
        } else {
            // <+752>
            return _ViewOutputs()
        }
        
        if flag {
            // <+128>
            // x29 - 0xf0
            var geometriesAttribute: Attribute<[ViewGeometry3D]>? = nil
            // x29 - 0x110 / w27
            let layoutComputerAttribute: Attribute<LayoutComputer>?
            // x29 - 0x10c
            let options = inputs.base.options
            let requests = !options.intersection([.viewRequestsLayoutComputer, .viewNeedsGeometry]).isEmpty
            
            if unsafe (requests || inputs.preferences.contains(DisplayList.Key.self, includeHostPreferences: false)) {
                // <+184>
                // x29 - 0xd0
                let layoutComputer = StaticSpatialLayoutComputer<_ZStackLayout>(
                    layout: root.value,
                    environment: inputs.environment,
                    childAttributes: []
                )
                
                let _layoutComputerAttribute = Attribute(layoutComputer)
                layoutComputerAttribute = _layoutComputerAttribute
                
                if !requests {
                    // <+584>
                    // <+796>
                } else {
                    // <+336>
                    // x29 - 0xd0
                    let parentSize = ParentSize3D(
                        size: inputs.size,
                        depth: inputs.transform[keyPath: \.depth]
                    )
                    
                    let parentSizeAttribute = Attribute(parentSize)
                    
                    let geometries = LayoutChildGeometries3D<ViewSpatialLayoutEngine<Self>>(
                        parentSize: parentSizeAttribute,
                        parentPosition: inputs.position,
                        layoutComputer: _layoutComputerAttribute
                    )
                    
                    geometriesAttribute = Attribute(geometries)
                    // <+796>
                }
            } else {
                // <+784>
                layoutComputerAttribute = nil
                // <+796>
            }
            
            // <+796>
            // x29 - 0x100
            var count = 0
            // x29 - 0xf8
            var attributes: [LayoutProxyAttributes] = []
            
            var outputs = list.makeAllElements(inputs: inputs) { inputs, transform in
                // $s7SwiftUI13SpatialLayoutPAAE010makeStaticcD4View4root6inputs10properties4listAA01_G7OutputsVAA11_GraphValueVyxG_AA01_G6InputsVAA0cD10PropertiesVAA01_G13List_Elements_ptFZAJSgAO_AjOctXEfU0_TA.20
                /*
                 inputs -> x0
                 transform -> x1/2 -> x23/x24
                 geometriesAttribute -> x3
                 count -> x4 -> x19
                 array -> x5
                 */
                // sp + 0x70
                var copy_1 = inputs
                // sp + 0xd0 (x29 - 0xc0)
                let copy_2 = inputs
                
                // sp + 0x18
                let outputs: _ViewOutputs
                if copy_2.base.options.contains(.viewNeedsGeometry) {
                    // <+180>
                    // array -> x5 -> x20
                    let geometry = IndexedValue<ViewGeometry3D>(values: geometriesAttribute!, index: count)
                    // w24
                    let geometryAtribute = Attribute<ViewGeometry3D>(geometry)
                    // w25
                    let sizeAttribute: Attribute<ViewSize> = geometryAtribute[keyPath: \.dimensions][keyPath: \.size].size2D
                    copy_1.size = sizeAttribute
                    let originAttribute = geometryAtribute[keyPath: \.origin][keyPath: \.origin2D]
                    copy_1.position = originAttribute
                    
                    outputs = _ViewOutputs.makeDepthTransform(
                        inputs: copy_1,
                        geometry: { 
                            return geometryAtribute.depthGeometry
                        },
                        body: transform
                    )
                    
                    let layoutAttribute = LayoutProxyAttributes(
                        layoutComputer: OptionalAttribute(outputs.layoutComputer),
                        traitsList: OptionalAttribute()
                    )
                    attributes.append(layoutAttribute)
                    // <+632>
                } else {
                    // <+140>
                    // sp + 0x18
                    let _ = copy_2
                    outputs = transform(copy_1)
                    // <+632>
                }
                
                // <+632>
                count &+= 1
                return outputs
            } ?? _ViewOutputs()
            
            // <+1144>
            if let layoutComputerAttribute {
                layoutComputerAttribute.mutateBody(as: StaticSpatialLayoutComputer<_ZStackLayout>.self, invalidating: true) { layoutComputer in
                    layoutComputer.childAttributes = attributes
                }
            }
            
            // <+1312>
            if options.contains(.viewRequestsLayoutComputer) {
                outputs.layoutComputer = layoutComputerAttribute
            }
            
            return outputs
        } else {
            // <+592>
            // x29 - 0xd0
            let copy_1 = inputs
            
            let outputs = list.makeAllElements(inputs: copy_1) { inputs, transform in
                // $s7SwiftUI18_ViewList_ElementsPAAE07makeAllE06inputs11indirectMap4bodyAA01_C7OutputsVSgAA01_C6InputsV_AA017IndirectAttributeJ0CSgAjL_AiLctXEtFA2jL_AiLctcXEfU_AJ_SbtAL_AiLctXEfU_03$s7a5UI11_cm9VAcA01_C7l178VIegnr_AESgIgngr_A2cEIegnr_AFIegngr_TR03$s7a67UI8Layout3DPAAE16makeStaticView3D4root6inputs10properties4listAA12_ce28VAA11_GraphValueVyxG_AA01_K6D65VAA16LayoutPropertiesVAA01_K13d1_E32_ptFZAJSgAO_AjOctXEfU_Tf3nnnpf_nTf3nnnpf_n
                return transform(inputs)
            } ?? _ViewOutputs()
            
            return outputs
        }
    }
}

extension SpatialLayout where Self == ZStackLayout3D {
    static func makeStaticSpatialLayoutView(root: _GraphValue<Self>, inputs: _ViewInputs, properties: SpatialLayoutProperties, list: _ViewList_Elements) -> _ViewOutputs {
        /*
         root -> x0 -> x21
         inputs -> x1 -> x22
         properties -> x2 -> x24
         list -> x3 -> x23
         return pointer -> x8 -> x19
         */
        let count = list.count
        // true -> <+128> / false -> <+592>
        let flag: Bool
        
        if count == 1 {
            // <+124>
            if ((properties.value & (1 &<< 16)) != 0) {
                // <+592>
                flag = false
            } else {
                // <+128>
                flag = true
            }
        } else if count != 0 || ((properties.value & (1 &<< 8)) == 0) {
            // <+128>
            flag = true
        } else {
            // <+752>
            return _ViewOutputs()
        }
        
        if flag {
            // <+128>
            // x29 - 0xf0
            var geometriesAttribute: Attribute<[ViewGeometry3D]>? = nil
            // x29 - 0x110 / w27
            let layoutComputerAttribute: Attribute<LayoutComputer>?
            // x29 - 0x10c
            let options = inputs.base.options
            let requests = !options.intersection([.viewRequestsLayoutComputer, .viewNeedsGeometry]).isEmpty
            
            if unsafe (requests || inputs.preferences.contains(DisplayList.Key.self, includeHostPreferences: false)) {
                // <+184>
                // x29 - 0xd0
                let layoutComputer = StaticSpatialLayoutComputer<ZStackLayout3D>(
                    layout: root.value,
                    environment: inputs.environment,
                    childAttributes: []
                )
                
                let _layoutComputerAttribute = Attribute(layoutComputer)
                layoutComputerAttribute = _layoutComputerAttribute
                
                if !requests {
                    // <+584>
                    // <+796>
                } else {
                    // <+336>
                    // x29 - 0xd0
                    let parentSize = ParentSize3D(
                        size: inputs.size,
                        depth: inputs.transform[keyPath: \.depth]
                    )
                    
                    let parentSizeAttribute = Attribute(parentSize)
                    
                    let geometries = LayoutChildGeometries3D<ViewSpatialLayoutEngine<Self>>(
                        parentSize: parentSizeAttribute,
                        parentPosition: inputs.position,
                        layoutComputer: _layoutComputerAttribute
                    )
                    
                    geometriesAttribute = Attribute(geometries)
                    // <+796>
                }
            } else {
                // <+784>
                layoutComputerAttribute = nil
                // <+796>
            }
            
            // <+796>
            // x29 - 0x100
            var count = 0
            // x29 - 0xf8
            var attributes: [LayoutProxyAttributes] = []
            
            var outputs = list.makeAllElements(inputs: inputs) { inputs, transform in
                // $s7SwiftUI13SpatialLayoutPAAE010makeStaticcD4View4root6inputs10properties4listAA01_G7OutputsVAA11_GraphValueVyxG_AA01_G6InputsVAA0cD10PropertiesVAA01_G13List_Elements_ptFZAJSgAO_AjOctXEfU0_TA.20
                /*
                 inputs -> x0
                 transform -> x1/2 -> x23/x24
                 geometriesAttribute -> x3
                 count -> x4 -> x19
                 array -> x5
                 */
                // sp + 0x70
                var copy_1 = inputs
                // sp + 0xd0 (x29 - 0xc0)
                let copy_2 = inputs
                
                // sp + 0x18
                let outputs: _ViewOutputs
                if copy_2.base.options.contains(.viewNeedsGeometry) {
                    // <+180>
                    // array -> x5 -> x20
                    let geometry = IndexedValue<ViewGeometry3D>(values: geometriesAttribute!, index: count)
                    // w24
                    let geometryAtribute = Attribute<ViewGeometry3D>(geometry)
                    // w25
                    let sizeAttribute: Attribute<ViewSize> = geometryAtribute[keyPath: \.dimensions][keyPath: \.size].size2D
                    copy_1.size = sizeAttribute
                    let originAttribute = geometryAtribute[keyPath: \.origin][keyPath: \.origin2D]
                    copy_1.position = originAttribute
                    
                    outputs = _ViewOutputs.makeDepthTransform(
                        inputs: copy_1,
                        geometry: { 
                            return geometryAtribute.depthGeometry
                        },
                        body: transform
                    )
                    
                    let layoutAttribute = LayoutProxyAttributes(
                        layoutComputer: OptionalAttribute(outputs.layoutComputer),
                        traitsList: OptionalAttribute()
                    )
                    attributes.append(layoutAttribute)
                    // <+632>
                } else {
                    // <+140>
                    // sp + 0x18
                    let _ = copy_2
                    outputs = transform(copy_1)
                    // <+632>
                }
                
                // <+632>
                count &+= 1
                return outputs
            } ?? _ViewOutputs()
            
            // <+1144>
            if let layoutComputerAttribute {
                layoutComputerAttribute.mutateBody(as: StaticSpatialLayoutComputer<ZStackLayout3D>.self, invalidating: true) { layoutComputer in
                    layoutComputer.childAttributes = attributes
                }
            }
            
            // <+1312>
            if options.contains(.viewRequestsLayoutComputer) {
                outputs.layoutComputer = layoutComputerAttribute
            }
            
            return outputs
        } else {
            // <+592>
            // x29 - 0xd0
            let copy_1 = inputs
            
            let outputs = list.makeAllElements(inputs: copy_1) { inputs, transform in
                // $s7SwiftUI18_ViewList_ElementsPAAE07makeAllE06inputs11indirectMap4bodyAA01_C7OutputsVSgAA01_C6InputsV_AA017IndirectAttributeJ0CSgAjL_AiLctXEtFA2jL_AiLctcXEfU_AJ_SbtAL_AiLctXEfU_03$s7a5UI11_cm9VAcA01_C7l178VIegnr_AESgIgngr_A2cEIegnr_AFIegngr_TR03$s7a67UI8Layout3DPAAE16makeStaticView3D4root6inputs10properties4listAA12_ce28VAA11_GraphValueVyxG_AA01_K6D65VAA16LayoutPropertiesVAA01_K13d1_E32_ptFZAJSgAO_AjOctXEfU_Tf3nnnpf_nTf3nnnpf_n
                return transform(inputs)
            } ?? _ViewOutputs()
            
            return outputs
        }
    }
}

struct ViewSpacing3D {
    let spacing: Spacing3D // 0x0
}

struct ParentSize3D : Rule, AsyncAttribute {
    @Attribute fileprivate private(set) var size: ViewSize
    @Attribute fileprivate private(set) var depth: ViewDepth
    
    var value: ViewSize3D {
        let size_1 = self.size
        let depth_1 = self.depth
        let size_2 = self.size
        let depth_2 = self.depth
        
        let value = Size3D(
            width: size_2.value.width,
            height: size_2.value.height,
            depth: depth_2.value
        )
        
        let proposal = _ProposedSize3D(
            width: size_1.proposal.width,
            height: size_1.proposal.height,
            depth: depth_1.proposal
        )
        
        return ViewSize3D(value, proposal: proposal)
    }
}

struct LayoutChildGeometries3D<E : SpatialLayoutEngine> : Rule, AsyncAttribute {
    @Attribute fileprivate private(set) var parentSize: ViewSize3D
    @Attribute fileprivate private(set) var parentPosition: CGPoint
    @Attribute fileprivate private(set) var layoutComputer: LayoutComputer
    
    var value: [ViewGeometry3D] {
        let position = self.parentPosition
        
        let size3D = Size3D(
            width: position.x,
            height: position.y,
            depth: 0
        )
        
        let parentSize = self.parentSize
        let layoutComputer = self.layoutComputer
        
        return layoutComputer.withMutableEngine(type: StashedDepthLayoutEngine<E>.self) { engine in
            return engine.base.childGeometries3D(
                at: ViewSize3D(
                    parentSize.value,
                    proposal: parentSize.proposal
                ),
                origin: Point3D(size3D)
            )
        }
    }
}

protocol SpatialLayoutEngine {
    associatedtype Cache3D
    
    mutating func volumeThatFits(_ proposedSize: _ProposedSize3D) -> Size3D
    mutating func childGeometries3D(at size: ViewSize3D, origin: Point3D) -> [ViewGeometry3D]
    mutating func explicitAlignment(of alignment: AlignmentKey, at size: ViewSize3D) -> CGFloat?
    func explicitDepthAlignment(_ key: DepthAlignmentKey, at size: ViewSize3D) -> CGFloat?
    func layoutPriority() -> Double
    func ignoresAutomaticPadding() -> Bool
    func requiresSpacingProjection() -> Bool
    mutating func spacing() -> Spacing3D
    func lengthThatFits(_ size: _ProposedSize3D, in axis: _Axis3D) -> CGFloat
    func requiresTrueDepthLayout() -> Bool
}

extension SpatialLayoutEngine {
    func ignoresAutomaticPadding() -> Bool {
        assertUnimplemented()
    }
    
    func requiresSpacingProjection() -> Bool {
        assertUnimplemented()
    }
    
    func lengthThatFits(_ size: _ProposedSize3D, in axis: _Axis3D) -> CGFloat {
        assertUnimplemented()
    }
    
    func explicitAlignment(of alignment: AlignmentKey, at size: ViewSize3D) -> CGFloat? {
        assertUnimplemented()
    }
    
    func explicitDepthAlignment(_ key: DepthAlignmentKey, at size: ViewSize3D) -> CGFloat? {
        assertUnimplemented()
    }
    
    func layoutPriority() -> Double {
        assertUnimplemented()
    }
    
    func spacing() -> Spacing3D {
        return Spacing3D(
            spacing2D: Spacing(),
            depthSpacing: Spacing3D.DepthSpacing(value: nil)
        )
    }
}

struct Spacing3D {
    let spacing2D: Spacing
    let depthSpacing: Spacing3D.DepthSpacing
}

let defaultSpacing3DValue = Size3D(width: 0, height: 0, depth: 0)

extension Spacing3D {
    struct DepthSpacing {
        let value: CGFloat?
    }
}

struct IndexedValue<T> : Rule, AsyncAttribute {
    @Attribute fileprivate private(set) var values: [T]
    fileprivate let index: Int
    
    var value: T {
        return self.values[self.index]
    }
}

struct StashedDepthLayoutEngine<E : SpatialLayoutEngine> : LayoutEngine {
    var base: E
    
    func layoutPriority() -> Double {
        return 0
    }
    
    func ignoresAutomaticPadding() -> Bool {
        return false
    }
    
    func requiresSpacingProjection() -> Bool {
        return false
    }
    
    mutating func spacing() -> Spacing {
        return self.base.spacing().spacing2D
    }
    
    mutating func sizeThatFits(_ proposedSize: _ProposedSize) -> CGSize {
        let depth: CGFloat?
        if let data = unsafe _threadLayoutDepthData() {
            depth = unsafe data
                .assumingMemoryBound(to: CGFloat?.self)
                .pointee
        } else {
            depth = nil
        }
        
        let size = _ProposedSize3D(
            width: proposedSize.width,
            height: proposedSize.height,
            depth: depth
        )
        
        let size3D = self.base.volumeThatFits(size)
        return CGSize(width: size3D.width, height: size3D.height)
    }
    
    mutating func lengthThatFits(_ proposedSize: _ProposedSize, in axis: Axis) -> CGFloat {
        let size = self.sizeThatFits(proposedSize)
        switch axis {
        case .horizontal:
            return size.width
        case .vertical:
            return size.height
        }
    }
    
    func childGeometries(at viewSize: ViewSize, origin: CGPoint) -> [ViewGeometry] {
        preconditionFailure("implement or don't call me!")
    }
    
    mutating func explicitAlignment(_ alignmentKey: AlignmentKey, at viewSize: ViewSize) -> CGFloat? {
        return LayoutDepthData.withCurrent { depth in
            // $s7SwiftUI24StashedDepthLayoutEngineV17explicitAlignment_2at12CoreGraphics7CGFloatVSgAA0H3KeyV_AA8ViewSizeVtFA2IXEfU_
            let volume = self.base.volumeThatFits(
                _ProposedSize3D(
                    width: viewSize.width,
                    height: viewSize.height,
                    depth: depth
                )
            )
            
            return self.base.explicitAlignment(
                of: alignmentKey,
                at: ViewSize3D(
                    viewSize,
                    depth: ViewDepth(volume.depth, proposal: depth)
                )
            )
        }
    }
    
    func childPlacement(at viewSize: ViewSize) -> _Placement {
        assertUnimplemented()
    }
    
    func childPlacement(at viewSize: ViewSize, placementContext: _PositionAwarePlacementContext) -> _Placement {
        assertUnimplemented()
    }
    
    mutating func depthThatFits(_ proposedSize: _ProposedSize3D) -> CGFloat {
        return self.base.volumeThatFits(proposedSize).depth
    }
    
    func explicitDepthAlignment(_ alignmentKey: DepthAlignmentKey, at viewSize: ViewSize3D) -> CGFloat? {
        assertUnimplemented()
    }
    
    func requiresTrueDepthLayout() -> Bool {
        return self.base.requiresTrueDepthLayout()
    }
    
    var debugContentDescription: String? {
        return nil
    }
}

struct ViewVolumeCache {
    private var cache = Cache3<_ProposedSize3D, Size3D>()
    
    mutating func get(_ key: _ProposedSize3D, makeValue: () -> Size3D) -> Size3D {
        return self.cache.get(key, makeValue: makeValue)
    }
}

/*
 key -> 0x0
 case -> 0x8 (size: 0x1)
 */
enum AlignmentKey3D {
    case alignment(AlignmentKey) // 0x0
    case depthAlignment(DepthAlignmentKey) // 0x1
    
    var objectIdentifier: ObjectIdentifier {
        switch self {
        case .alignment(let key):
            return ObjectIdentifier(key.id)
        case .depthAlignment(let key):
            return ObjectIdentifier(key.id)
        }
    }
}

protocol DerivedSpatialLayout : SpatialLayout {
    associatedtype SpatialBase/* : SpatialLayout*/
}

fileprivate struct DynamicLayoutComputer<T : Layout3D> : CustomStringConvertible, AsyncAttribute, StatefulRule {
    @Attribute private(set) var layout: T
    @Attribute private(set) var environment: EnvironmentValues
    @OptionalAttribute var containerInfo: DynamicContainer.Info?
    var layoutMap: DynamicLayoutMap
    
    typealias Value = LayoutComputer
    
    mutating func updateValue() {
        self.updateLayoutComputer3D(
            layout: self.layout,
            environment: self.$environment,
            attributes: self.layoutMap.attributes(info: self.containerInfo!)
        )
    }
    
    var description: String {
        assertUnimplemented()
    }
}

fileprivate struct ChildViewGeometries : AsyncAttribute, Rule {
    @Attribute private(set) var geometries3D: [ViewGeometry3D]
    
    var value: [ViewGeometry] {
        assertUnimplemented()
    }
}

fileprivate struct ChildDepthGeometries : AsyncAttribute, Rule {
    @Attribute private(set) var geometries3D: [ViewGeometry3D]
    
    var value: [ViewDepthGeometry] {
        assertUnimplemented()
    }
}
