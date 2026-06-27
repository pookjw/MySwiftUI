// CA243A05CF611D3DFDB2A050BB76974B
internal import Spatial
internal import AttributeGraph

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
            var index = 0
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
                     transform -> x1/x2 -> x23/x20
                     geometries -> x3
                     index -> x4 -> x19
                     depthGeometries -> x5 -> x24
                     attrbitues -> x6 -> x22
                     */
                    // sp + 0xd0
                    let copy_1 = inputs
                    // sp + 0x70
                    var copy_2 = inputs
                    // sp + 0x18
                    let copy_3: _ViewInputs
                    
                    if copy_1.base.options.contains(.viewNeedsGeometry) {
                        // <+164>
                        copy_3 = copy_1
                        
                        let geometryRule = LayoutChildGeometry(
                            childGeometries: geometries!,
                            index: index
                        )
                        
                        let geometryAttribute = Attribute(geometryRule)
                        
                        copy_2.position = geometryAttribute[keyPath: \.origin]
                        copy_2.size = geometryAttribute[keyPath: \.dimensions.size]
                        // <+312>
                    } else {
                        // <+148>
                        copy_3 = copy_1
                        // <+312>
                    }
                    
                    // <+312>
                    let outputs: _ViewOutputs
                    if let depthGeometries {
                        // <+420>
                        outputs = _ViewOutputs.makeDepthTransform(
                            inputs: copy_2,
                            geometry: {
                                let geometry = LayoutChildDepthGeometry(
                                    childGeometries: depthGeometries,
                                    index: index
                                )
                                
                                return Attribute(geometry)
                            },
                            body: transform
                        )
                    } else {
                        // <+324>
                        outputs = transform(copy_2)
                    }
                    
                    if copy_1.base.options.contains(.viewNeedsGeometry) {
                        // <+340>
                        let attribute = LayoutProxyAttributes(
                            layoutComputer: OptionalAttribute(outputs.layoutComputer),
                            traitsList: OptionalAttribute()
                        )
                        
                        attrbitues.append(attribute)
                        // <+460>
                    } else {
                        // <+460>
                    }
                    
                    index &+= 1
                    return outputs
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

struct LayoutChildDepthGeometries<L : Layout3D> : Rule, AsyncAttribute {
    @Attribute var parentSize: ViewSize
    @Attribute var parentPosition: CGPoint
    @Attribute var parentDepth: ViewDepth
    @Attribute var layoutComputer: LayoutComputer
    
    var value: [ViewDepthGeometry] {
        let parentPosition = self.parentPosition
        let size = Size3D(
            width: parentPosition.x,
            height: parentPosition.y,
            depth: 0
        )
        
        let viewSize = ViewSize3D(self.parentSize, depth: self.parentDepth)
        
        return self.layoutComputer.withMutableEngine(type: ViewLayoutEngine3D<L>.self) { engine in
            // $s7SwiftUI26LayoutChildDepthGeometriesV5valueSayAA04ViewE8GeometryVGvgAgA0hC8Engine3DVyxGzXEfU_TA
            return engine.childDepthGeometries(at: viewSize, origin: size)
        }
    }
}

fileprivate struct LayoutChildDepthGeometry : AsyncAttribute, Rule {
    @Attribute private(set) var childGeometries: [ViewDepthGeometry]
    let index: Int
    
    var value: ViewDepthGeometry {
        return self.childGeometries[self.index]
    }
}

fileprivate struct StaticLayoutComputer<L : Layout3D>: StatefulRule, AsyncAttribute, CustomStringConvertible {
    @Attribute private(set) var layout: L
    @Attribute private(set) var environment: EnvironmentValues
    var childAttributes: [LayoutProxyAttributes]
    
    var description: String {
        assertUnimplemented()
    }
    
    typealias Value = LayoutComputer
    
    mutating func updateValue() {
        updateLayoutComputer3D(layout: layout, environment: $environment, attributes: childAttributes)
    }
}

fileprivate struct LayoutChildGeometry : Rule, AsyncAttribute {
    @Attribute private(set) var childGeometries: [ViewGeometry]
    let index: Int
    
    var value: ViewGeometry {
        return childGeometries[index]
    }
}

struct DepthAlignedLayout<L : Layout> : DerivedLayout, Layout3D, _VariadicView_UnaryViewRoot {
    var base: L
    var depthAlignment: DepthAlignment
    
    fileprivate func placeChildren<T : Sequence>(
        _: T,
        proposal: _ProposedSize3D,
        place: (LayoutSubview3D, DepthAlignedLayout<T>.DepthGeometry) -> ()
    ) where T.Element == (_ proxy: LayoutSubview3D, _ geo: ViewGeometry) -> Double {
        assertUnimplemented()
    }
    
    nonisolated func depthThatFits(proposal: _ProposedSize3D, subviews: LayoutSubviews3D, cache: inout L.Cache) -> CGFloat {
        assertUnimplemented()
    }
    
    nonisolated func placeSubviewDepths(in rect: Rect3D, proposal: _ProposedSize3D, subviews: LayoutSubviews3D, cache: inout L.Cache) {
        assertUnimplemented()
    }
    
    nonisolated static func _makeLayoutView(root: _GraphValue<DepthAlignedLayout<L>>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewListOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
}

extension DepthAlignedLayout {
    struct DepthGeometry {
        private let offset: Double
        private let dimensions: ViewDimensions3D
    }
}
