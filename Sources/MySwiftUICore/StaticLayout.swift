// A7DFBD5AC47BCDAAE5525781FBD33CF6 | CA243A05CF611D3DFDB2A050BB76974B
internal import AttributeGraph

extension Layout {
    static func makeStaticView(root: _GraphValue<Self>, inputs: _ViewInputs, properties: LayoutProperties, list: any _ViewList_Elements) -> _ViewOutputs {
#if os(visionOS)
        return Self.makeStaticView3D(root: root, inputs: inputs, properties: properties, list: list)
#else
        fatalError("TODO")
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
        let phase = inputs.base.phase
        // sp + 0x8c
        let transaction = inputs.base.transaction
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
            let copy_2 = copy_1
            var outputs: _ViewOutputs = list.makeAllElements(inputs: copy_2, indirectMap: nil) { inputs, transform in
                // $s7SwiftUI6LayoutPAAE14makeStaticView4root6inputs10properties4listAA01_F7OutputsVAA11_GraphValueVyxG_AA01_F6InputsVAA0C10PropertiesVAA01_F13List_Elements_ptFZAJSgAO_AjOctXEfU0_TA를
                /*
                 inputs -> x25
                 transform -> x28, x20
                 */
                // sp + 0x1c0
                let copy_1 = inputs
                // w22
                let changedDebugProperties = copy_1.base.changedDebugProperties
                // w24
                let changedDebugProperties_2: _ViewDebug.Properties
                // sp + 0x120
                let copy_2: _ViewInputs
                // copy_1.options -> sp + 0x24
                // w19
                var originAttribute = copy_1.position
                // w27
                var sizeAttribute = copy_1.size
                if !copy_1.base.options.contains(.viewNeedsGeometry) {
                    // <+192>
                    copy_2 = copy_1
                    changedDebugProperties_2 = changedDebugProperties
                    // <+340>
                } else {
                    // <+192>
                    copy_2 = copy_1
                    
                    // w24
                    let geometryAttribute = Attribute(LayoutChildGeometry(childGeometries: childGeometriesAttribute!, index: index))
                    originAttribute = geometryAttribute.origin()
                    sizeAttribute = geometryAttribute.size()
                    changedDebugProperties_2 = changedDebugProperties.union([.position, .size])
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
                let copy_4 = inputs
                // sp + 0x60
                var copy_5 = inputs
                copy_5.position = originAttribute
                copy_5.size = sizeAttribute
                
                // sp + 0x120
                let _ = copy_5
                // sp + 0x40
                var outputs = transform(copy_5)
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
                outputs.preferences.debugProperties = changedDebugProperties_2
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
                outputs.layoutComputer = layoutComputerAttribute
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

fileprivate struct StaticLayoutComputer<L: Layout>: StatefulRule, AsyncAttribute, CustomStringConvertible {
    @Attribute private(set) var layout: L
    @Attribute private(set) var environment: EnvironmentValues
    var childAttributes: [LayoutProxyAttributes]
    
    var description: String {
        fatalError("TODO")
    }
    
    typealias Value = LayoutComputer
    
    mutating func updateValue() {
        updateLayoutComputer(layout: layout, environment: $environment, attributes: childAttributes)
    }
}

fileprivate struct LayoutChildGeometry: Rule, AsyncAttribute {
    @Attribute private(set) var childGeometries: [ViewGeometry]
    let index: Int
    
    var value: ViewGeometry {
        return childGeometries[index]
    }
}

fileprivate struct LayoutChildDepth: Rule, AsyncAttribute {
    @Attribute var childDepths: [ViewDepth]
    let index: Int
    
    typealias Value = ViewDepth
    
    var value: ViewDepth {
        return childDepths[index]
    }
}
