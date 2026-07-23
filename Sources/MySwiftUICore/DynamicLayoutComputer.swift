// 20EDA2BED32E8B299AFBDA7A4F5BCE87
internal import AttributeGraph

extension DynamicLayoutViewAdaptor {
    static func makeDepthTransform(depthData: DynamicLayoutViewAdaptor.ChildDepthData, containerInfo: Attribute<DynamicContainer.Info>, id: DynamicContainerID, body: inout (_ViewInputs) -> _ViewOutputs) {
        let original = body
        
        switch depthData {
        case .geometries(let _):
            body = { _ in
                // $s7SwiftUI24DynamicLayoutViewAdaptorV18makeDepthTransform9depthData13containerInfo2id4bodyyAC05ChildhK0O_14AttributeGraph0Q0VyAA0C9ContainerV0M0VGAA0cS2IDVAA01_E7OutputsVAA01_E6InputsVcztFZAvXcfU_TA
                assertUnimplemented()
            }
        case .depths(let depths):
            body = { inputs in
                // $s7SwiftUI24DynamicLayoutViewAdaptorV18makeDepthTransform9depthData13containerInfo2id4bodyyAC05ChildhK0O_14AttributeGraph0Q0VyAA0C9ContainerV0M0VGAA0cS2IDVAA01_E7OutputsVAA01_E6InputsVcztFZAvXcfU0_TA
                if inputs.needsGeometry {
                    // <+132>
                    // inlined
                    return _ViewOutputs.makeDepthTransform(
                        inputs: inputs,
                        depth: {
                            return Attribute(
                                DynamicLayoutViewChildDepth(
                                    containerInfo: containerInfo,
                                    childDepths: depths,
                                    id: id
                                )
                            )
                        },
                        body: original)
                } else {
                    return original(inputs)
                }
            }
        case .none:
            break
        }
    }
}

extension Layout3D {
    static func makeDynamicView3D(root: _GraphValue<Self>, inputs: _ViewInputs, properties: LayoutProperties, list: Attribute<any ViewList>) -> _ViewOutputs {
        /*
         root -> x0 -> w24
         inputs -> x1
         properties -> x2 (dead)
         list -> w3 -> x19 + 0x60
         */
        // x26 + 0xc0 (sp + 0x200)
        let copy_1 = inputs
        // x19 + 0x78
        let hasScrollable = copy_1.preferences.contains(ScrollablePreferenceKey.self)
        // x19 + 0x9c
        let scrollTargetRole: OptionalAttribute<ScrollTargetRole.Role?> 
        if copy_1.preferences.contains(ScrollTargetRole.ContentKey.self) {
            scrollTargetRole = copy_1.scrollTargetRole
        } else {
            scrollTargetRole = OptionalAttribute()
        }
        
        // <+188>
        // x19 + 0x48
        let hasScrollContent = copy_1.preferences.contains(ScrollTargetRole.ContentKey.self)
        // x19 + 0x28
        let scrollTargetRemovePreference = copy_1.scrollTargetRemovePreference
        // w28
        let options = copy_1.base.options
        // x19 + 0x8c
        let withinAccessibilityRotor: Bool
        if options.contains(.needsAccessibility) {
            // <+248>
            withinAccessibilityRotor = copy_1[WithinAccessibilityRotor.self]
        } else {
            withinAccessibilityRotor = false
        }
        
        // <+260>
        // x23
        var layoutComputerAttribute: Attribute<LayoutComputer>? = nil
        // <+300>
        // x19 + 0x78
        let x190x78 = !options.intersection([.viewRequestsLayoutComputer, .viewNeedsGeometry]).isEmpty || hasScrollable
        // options -> w28 -> x19 + 0x6c
        
        // x19 + 0x58
        let geometriesAttribute: OptionalAttribute<[ViewGeometry]>
        // w24
        let depthGeometriesAttribute: OptionalAttribute<[ViewDepthGeometry]>
        if x190x78 || withinAccessibilityRotor {
            // <+368>
            let dynamicLayoutComputer = DynamicLayoutComputer<Self>(
                layout: root.value,
                environment: copy_1.environment,
                containerInfo: OptionalAttribute(),
                layoutMap: DynamicLayoutMap(
                    map: [],
                    sortedArray: [],
                    sortedSeed: 0
                )
            )
            
            // w25
            let _layoutComputerAttribute = Attribute(dynamicLayoutComputer)
            layoutComputerAttribute = _layoutComputerAttribute
            
            // <+628>
            // x19 + 0x1a0
            let geometries = LayoutChildGeometries(
                parentSize: copy_1.size,
                parentPosition: copy_1.position,
                layoutComputer: _layoutComputerAttribute
            )
            
            geometriesAttribute = OptionalAttribute(Attribute(geometries))
            
            // x19 + 0x1a0
            let depthGeometries = LayoutChildDepthGeometries<Self>(
                parentSize: copy_1.size,
                parentPosition: copy_1.position,
                parentDepth: copy_1.transform[keyPath: \.depth],
                layoutComputer: _layoutComputerAttribute
            )
            
            depthGeometriesAttribute = OptionalAttribute(Attribute(depthGeometries))
            // <+964>
        } else {
            depthGeometriesAttribute = OptionalAttribute()
            geometriesAttribute = OptionalAttribute()
            // <+964>
        }
        
        // <+964>
        func mapMutator(thunk: (inout DynamicLayoutMap) -> Void) {
            // $s7SwiftUI8Layout3DPAAE17makeDynamicView3D4root6inputs10properties4listAA12_ViewOutputsVAA11_GraphValueVyxG_AA01_K6InputsVAA16LayoutPropertiesV09AttributeM00R0VyAA0K4List_pGtFZ10mapMutatorL_5thunkyyAA0eP3MapVzXE_tAaBRzlFTA
            /*
             thunk -> x0/x1 -> x22/x21
             layoutComputerAttribute -> x2 -> x23
             */
            guard let layoutComputerAttribute else {
                return
            }
            
            layoutComputerAttribute.mutateBody(as: DynamicLayoutComputer<Self>.self, invalidating: true) { layoutComputer in
                // $sSo11AGAttributea14AttributeGraphE10mutateBody2as12invalidating_yxm_SbyxzXEtlFySvXEfU_TA
                thunk(&layoutComputer.layoutMap)
            }
        }
        
        // <+1012>
        var copy_2 = copy_1
        copy_2.base.options = options.subtracting(.viewRequestsLayoutComputer)
        
        if !hasScrollContent || !scrollTargetRemovePreference {
            // <+1136>
            assertUnimplemented()
        } else {
            // <+1068>
            assertUnimplemented()
        }
        
        assertUnimplemented()
        
        let childDepthData: DynamicLayoutViewAdaptor.ChildDepthData
        if let attribute = depthGeometriesAttribute.attribute {
            childDepthData = .geometries(attribute)
        } else {
            childDepthData = .none
        }
        
        let adaptor = DynamicLayoutViewAdaptor(
            items: list,
            childGeometries: geometriesAttribute,
            childDepthData: childDepthData,
            mutateLayoutMap: mapMutator(thunk:)
        )
        
        // x19 + 0xa4 / x19 + 0x90
        let (infoAttribute, outputs) = DynamicContainer
            .makeContainer(
                adaptor: adaptor,
                inputs: copy_2
            )
        
        // <+1508>
        assertUnimplemented()
    }
}

fileprivate struct DynamicLayoutComputer<T : Layout>: StatefulRule, AsyncAttribute, CustomStringConvertible {
    @Attribute private(set) var layout: T
    @Attribute private(set) var environment: EnvironmentValues
    @OptionalAttribute var containerInfo: DynamicContainer.Info?
    var layoutMap: DynamicLayoutMap
    
    var description: String {
        assertUnimplemented()
    }
    
    typealias Value = LayoutComputer
    
    func updateValue() {
        assertUnimplemented()
    }
}

fileprivate struct DynamicLayoutViewChildDepth : StatefulRule, AsyncAttribute {
    @Attribute private(set) var containerInfo: DynamicContainer.Info
    @Attribute private(set) var childDepths: [ViewDepth]

    let id: DynamicContainerID
    
    typealias Value = ViewDepth
    
    func updateValue() {
        // self -> x21
        // sp + 0x10
        let containerInfo = containerInfo
        // x19, x20
        if
            let viewIndex = containerInfo.viewIndex(id: id),
            childDepths.indices.contains(viewIndex)
        {
            // <+188>
            let childDepths = childDepths
            if childDepths.indices.contains(viewIndex) {
                value = childDepths[viewIndex]
                return
            } else {
                // <+312>
            }
        } else {
            // <+312>
        }
        
        // <+312>
        if !hasValue {
            value = .fixed(0)
        }
    }
}

fileprivate struct DynamicLayoutViewChildDepthGeometry {
    @Attribute private(set) var containerInfo: DynamicContainer.Info
    @Attribute private(set) var childGeometries: [ViewDepthGeometry]

    let id: DynamicContainerID
}
