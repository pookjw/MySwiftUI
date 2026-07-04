internal import CoreGraphics
internal import Spatial
internal import AttributeGraph

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
        assertUnimplemented()
    }
}

extension SpatialLayout where Self == _ZStackLayout {
    nonisolated static func makeDynamicSpatialLayoutView(root: _GraphValue<_ZStackLayout>, inputs: _ViewInputs, properties: SpatialLayoutProperties, list: Attribute<any ViewList>) -> _ViewOutputs {
        /*
         root -> x0
         inputs -> x1
         properties -> dead
         list -> x2
         */
        assertUnimplemented()
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
            
            if (requests || inputs.preferences.contains(DisplayList.Key.self, includeHostPreferences: false)) {
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

// type descriptor가 존재하지 않음
struct SpatialLayoutProperties {
    let value: UInt32
}

struct SpatialLayoutSubview {
    // TODO
}

struct SpatialLayoutSubviews {
    // TODO
}

struct ViewSpacing3D {
    // TODO
}

struct ParentSize3D : Rule, AsyncAttribute {
    @Attribute fileprivate private(set) var size: ViewSize
    @Attribute fileprivate private(set) var depth: ViewDepth
    
    var value: ViewSize3D {
        assertUnimplemented()
    }
}

struct LayoutChildGeometries3D<E : SpatialLayoutEngine> : Rule, AsyncAttribute {
    @Attribute fileprivate private(set) var parentSize: ViewSize3D
    @Attribute fileprivate private(set) var parentPosition: CGPoint
    @Attribute fileprivate private(set) var layoutComputer: LayoutComputer
    
    var value: [ViewGeometry3D] {
        assertUnimplemented()
    }
}

struct ViewSpatialLayoutEngine<L : SpatialLayout> : SpatialLayoutEngine, DefaultSpatialAlignmentFunctions {
    // TODO
}

protocol SpatialLayoutEngine {
    // TODO
}

fileprivate protocol DefaultSpatialAlignmentFunctions {
    // TODO
}

struct IndexedValue<T> : Rule, AsyncAttribute {
    @Attribute fileprivate private(set) var values: [T]
    fileprivate let index: Int
    
    var value: T {
        return self.values[self.index]
    }
}
