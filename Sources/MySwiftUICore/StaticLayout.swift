// A7DFBD5AC47BCDAAE5525781FBD33CF6 | CA243A05CF611D3DFDB2A050BB76974B
internal import AttributeGraph

extension Layout {
    static func makeStaticView(root: _GraphValue<Self>, inputs: _ViewInputs, properties: LayoutProperties, list: any _ViewList_Elements) -> _ViewOutputs {
#if os(visionOS)
        return Self.makeStaticView3D(root: root, inputs: inputs, properties: properties, list: list)
#else
        assertUnimplemented()
#endif
    }
    
    static func makeStaticView3D(root: _GraphValue<Self>, inputs: _ViewInputs, properties: LayoutProperties, list: any _ViewList_Elements) -> _ViewOutputs {
        // properties은 안 쓰는듯
        /*
         root -> w19
         inputs -> x21
         list -> x27
         */
        // sp + 0x48
        let copy_1 = inputs
        // inputs.phase (pointer) -> x24
        // sp + 0x88
        let _ = inputs.base.phase
        // sp + 0x8c
        let _ = inputs.base.transaction
        // w25
        let isDefaultEmptyLayout = properties.isDefaultEmptyLayout
        // w22
        let isIdentityUnaryLayout = properties.isIdentityUnaryLayout
        let count = list.count
        
        if count == 1 && isIdentityUnaryLayout {
            // <+292>
            // sp + 0xc0
            return list.makeAllElements(inputs: inputs, indirectMap: nil) { inputs, transform in
                return transform(inputs)
            } ?? _ViewOutputs()
        } else if (count == 1 && !isIdentityUnaryLayout) || (count != 0 || !isDefaultEmptyLayout) {
            var childGeometriesAttribute: Attribute<[ViewGeometry]>? = nil
            // sp + 0x98
            var depthsAttribute: Attribute<[ViewDepth]>? = nil
            // sp + 0x8
            var layoutComputerAttribute: Attribute<LayoutComputer>?
            let sp0x0c = copy_1.base.options.intersection([.viewRequestsLayoutComputer, .viewNeedsGeometry])
            if !sp0x0c.isEmpty {
                // <+616>
                // sp + 0xc0
                let layoutComputerRule = StaticLayoutComputer(layout: root.value, environment: copy_1.environment, childAttributes: [])
                layoutComputerAttribute = Attribute(layoutComputerRule)
                
                let layoutDepthStashingEnabled = copy_1[EnableLayoutDepthStashing.self]
                // w19
                let transform = copy_1.transform
                
                let layoutComputer: Attribute<LayoutComputer>
                if layoutDepthStashingEnabled {
                    // <+888>
                    layoutComputer = Attribute(DepthStashingLayoutComputer(layoutComputer: layoutComputerAttribute!, depth: transform[keyPath: \.depth]))
                } else {
                    layoutComputer = layoutComputerAttribute!
                }
                
                // <+968>
                // x20
                childGeometriesAttribute = Attribute(LayoutChildGeometries(parentSize: copy_1.size, parentPosition: copy_1.position, layoutComputer: layoutComputer))
                
                depthsAttribute = Attribute(
                    LayoutChildDepths<Self>(
                        parentSize: copy_1.size,
                        parentDepth: transform[keyPath: \.depth],
                        childGeometries: childGeometriesAttribute!,
                        layoutComputer: layoutComputerAttribute!
                    )
                )
                // <+1356>
            } else {
                // <+1328>
                layoutComputerAttribute = nil
                // <+1356>
            }
            
            // <+1356>
            // sp + 0xd0
            var attributes: [LayoutProxyAttributes] = []
            // sp + 0x78
            var index = 0
            // sp + 0x110
            var copy_2 = copy_1
            var outputs: _ViewOutputs = list.makeAllElements(inputs: copy_2, indirectMap: nil) { inputs, transform in
                // $s7SwiftUI6LayoutPAAE14makeStaticView4root6inputs10properties4listAA01_F7OutputsVAA11_GraphValueVyxG_AA01_F6InputsVAA0C10PropertiesVAA01_F13List_Elements_ptFZAJSgAO_AjOctXEfU0_TA를
                /*
                 inputs -> x25
                 transform -> x28, x20
                 */
                // sp + 0x1c0
                let copy_1 = inputs
                // w22
                let _ = copy_1.base.changedDebugProperties
                // sp + 0x120
                let _: _ViewInputs
                // copy_1.options -> sp + 0x24
                // w19
                var originAttribute = copy_1.position
                // w27
                var sizeAttribute = copy_1.size
                if !copy_1.base.options.contains(.viewNeedsGeometry) {
                    // <+192>
                    copy_2 = copy_1
                    // <+340>
                } else {
                    // <+192>
                    copy_2 = copy_1
                    
                    // w24
                    let geometryAttribute = Attribute(LayoutChildGeometry(childGeometries: childGeometriesAttribute!, index: index))
                    originAttribute = geometryAttribute.origin()
                    sizeAttribute = geometryAttribute.size()
                }
                
                // <+340>
                // sp + 0x50
                var transform = transform
                // x28
                let _index = index
                // sp + 0x120
                let copy_3 = copy_1
                Self.makeChildDepthTransform(at: _index, inputs: copy_3, childDepths: depthsAttribute, body: &transform)
                
                // <+444>
                // transform -> x21/x20
                // sp + 0xc0
                let _ = inputs
                // sp + 0x60
                var copy_5 = inputs
                copy_5.position = originAttribute
                copy_5.size = sizeAttribute
                
                // sp + 0x120
                let _ = copy_5
                // sp + 0x40
                let outputs = transform(copy_5)
                // <+564>
                // sp + 0x120
                let _ = copy_5
                // outputs -> x21/w22/w27
                
                // <+612>
                if copy_1.base.options.contains(.viewNeedsGeometry) {
                    // <+620>
                    let layoutComputer: OptionalAttribute<LayoutComputer>
                    if let _layoutComputer = outputs.layoutComputer {
                        layoutComputer = OptionalAttribute(_layoutComputer)
                    } else {
                        layoutComputer = OptionalAttribute()
                    }
                    attributes.append(LayoutProxyAttributes(layoutComputer: layoutComputer))
                }
                
                // <+684>
                index &+= 1
                return outputs
            } ?? _ViewOutputs()
            
            // outputs -> x19, w21, w24
            // <+1776>
            let requestsLayoutComputer = copy_1.base.options.contains(.viewRequestsLayoutComputer)
            
            if !sp0x0c.isEmpty {
                // <+1836>
                layoutComputerAttribute!.mutateBody(as: StaticLayoutComputer<Self>.self, invalidating: true) { layoutComputer in
                    layoutComputer.childAttributes = attributes
                }
            }
            
            // <+1984>
            if requestsLayoutComputer {
                outputs.layoutComputer = layoutComputerAttribute ?? Attribute(identifier: .empty)
            }
            
            return outputs
        } else {
            return _ViewOutputs()
        }
    }
    
    static func makeChildDepthTransform(at index: Int, inputs: _ViewInputs, childDepths: Attribute<[ViewDepth]>?, body: inout (_ViewInputs) -> _ViewOutputs) {
        guard let childDepths else {
            return
        }
        
        body = { [childDepths, index, body] inputs in
            // $s7SwiftUI6LayoutPAAE23makeChildDepthTransform2at6inputs11childDepths4bodyySi_AA11_ViewInputsV14AttributeGraph0O0VySayAA0mF0VGGSgAA01_M7OutputsVAJcztFZAtJcfU_TA
            /*
             inputs -> x19
             body -> x21, x20
             return register -> x22
             */
            // inlined
            return _ViewOutputs.makeDepthTransform(
                inputs: inputs,
                depth: {
                    return Attribute(LayoutChildDepth(childDepths: childDepths, index: index))
                },
                body: body
            )
        }
    }
}

extension Layout3D {
    static func makeStaticView3D(root: _GraphValue<Self>, inputs: _ViewInputs, properties: LayoutProperties, list: any _ViewList_Elements) -> _ViewOutputs {
        /*
         root -> x0 -> w23
         inputs -> x1 -> x24
         properties -> x2
         list -> x3/x4 -> x28/x29 - 0x138
         */
        // x29 - 0x148
        // 값이 놓이는 순서가 다름
        let copy_1 = inputs
        // w22
        let isDefaultEmptyLayout = properties.isDefaultEmptyLayout
        // w26
        let isIdentityUnaryLayout = properties.isIdentityUnaryLayout
        let count = list.count
        
        // true -> <+296> / false -> <+560>
        let flag: Bool
        if count == 1 {
            // <+292>
            if isIdentityUnaryLayout {
                // <+296>
                flag = true
            } else {
                // <+560>
                flag = false
            }
        } else if count != 0 {
            // <+560>
            flag = false
        } else {
            // <+268>
            if isDefaultEmptyLayout {
                // <+272>
                return _ViewOutputs()
            } else {
                // <+560>
                flag = false
            }
        }
        
        if flag {
            // <+296>
            // x29 - 0xc8
            let copy_2 = copy_1
            
            // x29 - 0xe0
            let outputs = list.makeAllElements(
                inputs: copy_2,
                indirectMap: nil,
                body: { inputs, transform in
                    // $s7SwiftUI18_ViewList_ElementsPAAE07makeAllE06inputs11indirectMap4bodyAA01_C7OutputsVSgAA01_C6InputsV_AA017IndirectAttributeJ0CSgAjL_AiLctXEtFA2jL_AiLctcXEfU_AJ_SbtAL_AiLctXEfU_03$s7a5UI11_cm9VAcA01_C7l178VIegnr_AESgIgngr_A2cEIegnr_AFIegngr_TR03$s7a67UI8Layout3DPAAE16makeStaticView3D4root6inputs10properties4listAA12_ce28VAA11_GraphValueVyxG_AA01_K6D65VAA16LayoutPropertiesVAA01_K13d1_E32_ptFZAJSgAO_AjOctXEfU_Tf3nnnpf_nTf3nnnpf_n
                    return transform(inputs)
                }
            ) ?? _ViewOutputs()
            
            return outputs
        } else {
            // <+560>
            // x29 - 0xe8
            var geometries: Attribute<[ViewGeometry]>? = nil
            // x29 - 0xf0
            var depthGeometries: Attribute<[ViewDepthGeometry]>? = nil
            let w22 = copy_1.base.options.intersection([.viewRequestsLayoutComputer, .viewNeedsGeometry])
            
            // x29 - 0x18c
            let layoutComputer: Attribute<LayoutComputer>?
            
            if
                w22.isEmpty &&
                    !inputs.preferences.contains(DisplayList.Key.self, includeHostPreferences: false)
            {
                // <+1952>
                layoutComputer = nil
                // <+1284>
            } else {
                // <+620>
                // x29 - 0xc8
                let layoutComputerRule = StaticLayoutComputer(
                    layout: root.value,
                    environment: inputs.environment,
                    childAttributes: []
                )
                // w26
                let layoutComputerAttribute = Attribute(layoutComputerRule)
                
                // <+852>
                if !w22.isEmpty {
                    var lc = layoutComputerAttribute
                    if inputs[EnableLayoutDepthStashing.self] == true {
                        // x29 - 0xc8
                        let layoutComputerRule = DepthStashingLayoutComputer(
                            layoutComputer: layoutComputerAttribute,
                            depth: copy_1.transform[keyPath: \.depth]
                        )
                        
                        lc = Attribute(layoutComputerRule)
                    }
                    
                    // <+976>
                    let geometriesRule = LayoutChildGeometries(
                        parentSize: inputs.size,
                        parentPosition: inputs.position,
                        layoutComputer: lc
                    )
                    
                    geometries = Attribute(geometriesRule)
                    // <+1084>
                }
                
                // <+1084>
                // x29 - 0xc8
                let depthGeometriesRule = LayoutChildDepthGeometries<Self>(
                    parentSize: inputs.size,
                    parentPosition: inputs.position,
                    parentDepth: copy_1.transform[keyPath: \.depth],
                    layoutComputer: layoutComputerAttribute
                )
                
                depthGeometries = Attribute(depthGeometriesRule)
                layoutComputer = layoutComputerAttribute
                // <+1284>
            }
            
            // <+1284>
            // x29 - 0x108
            var attrbitues: [LayoutProxyAttributes] = []
            // x29 - 0x110
            var count = 0
            // x29 - 0xc8
            let copy_2 = copy_1
            
            // x29 - 0x70
            var outputs = list.makeAllElements(
                inputs: copy_2,
                indirectMap: nil,
                body: { inputs, transform in
                    // $s7SwiftUI8Layout3DPAAE16makeStaticView3D4root6inputs10properties4listAA12_ViewOutputsVAA11_GraphValueVyxG_AA01_K6InputsVAA16LayoutPropertiesVAA01_K13List_Elements_ptFZAJSgAO_AjOctXEfU0_TA
                    /*
                     inputs -> x0
                     transform -> x1/x2
                     geometries -> x3
                     count -> x4
                     depthGeometries -> x5
                     attrbitues -> x6
                     */
                    assertUnimplemented()
                }
            ) ?? _ViewOutputs()
            
            // <+1724>
            if let layoutComputer {
                // <+1760>
                layoutComputer.mutateBody(as: StaticLayoutComputer<Self>.self, invalidating: true) { geometries in
                    geometries.childAttributes = attrbitues
                }
            }
            
            // <+1900>
            if copy_1.base.options.contains(.viewRequestsLayoutComputer) {
                outputs.layoutComputer = layoutComputer
            }
            
            return outputs
        }
    }
}

fileprivate struct StaticLayoutComputer<L : Layout>: StatefulRule, AsyncAttribute, CustomStringConvertible {
    @Attribute private(set) var layout: L
    @Attribute private(set) var environment: EnvironmentValues
    var childAttributes: [LayoutProxyAttributes]
    
    var description: String {
        assertUnimplemented()
    }
    
    typealias Value = LayoutComputer
    
    mutating func updateValue() {
        updateLayoutComputer(layout: layout, environment: $environment, attributes: childAttributes)
    }
}

fileprivate struct LayoutChildGeometry : Rule, AsyncAttribute {
    @Attribute private(set) var childGeometries: [ViewGeometry]
    let index: Int
    
    var value: ViewGeometry {
        return childGeometries[index]
    }
}

fileprivate struct LayoutChildDepth : Rule, AsyncAttribute {
    @Attribute var childDepths: [ViewDepth]
    let index: Int
    
    typealias Value = ViewDepth
    
    var value: ViewDepth {
        return childDepths[index]
    }
}

struct LayoutChildDepthGeometries<L> : Rule, AsyncAttribute {
    @Attribute var parentSize: ViewSize
    @Attribute var parentPosition: CGPoint
    @Attribute var parentDepth: ViewDepth
    @Attribute var layoutComputer: LayoutComputer
    
    var value: [ViewDepthGeometry] {
        assertUnimplemented()
    }
}
