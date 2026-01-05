// 20EDA2BED32E8B299AFBDA7A4F5BCE87
internal import AttributeGraph

extension DynamicLayoutViewAdaptor {
    static func makeDepthTransform(depthData: DynamicLayoutViewAdaptor.ChildDepthData, containerInfo: Attribute<DynamicContainer.Info>, id: DynamicContainerID, body: inout (_ViewInputs) -> _ViewOutputs) {
        let original = body
        
        switch depthData {
        case .geometries(let depthGeometry):
            body = { _ in
                // $s7SwiftUI24DynamicLayoutViewAdaptorV18makeDepthTransform9depthData13containerInfo2id4bodyyAC05ChildhK0O_14AttributeGraph0Q0VyAA0C9ContainerV0M0VGAA0cS2IDVAA01_E7OutputsVAA01_E6InputsVcztFZAvXcfU_TA
                fatalError("TODO")
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

fileprivate struct DynamicLayoutComputer<T: Layout>: StatefulRule, AsyncAttribute, CustomStringConvertible {
    @Attribute private(set) var layout: T
    @Attribute private(set) var environment: EnvironmentValues
    @OptionalAttribute var containerInfo: DynamicContainer.Info?
    var layoutMap: DynamicLayoutMap
    
    var description: String {
        fatalError("TODO")
    }
    
    typealias Value = LayoutComputer
    
    func updateValue() {
        fatalError("TODO")
    }
}

fileprivate struct DynamicLayoutViewChildDepth: StatefulRule, AsyncAttribute {
    @Attribute private(set) var containerInfo: DynamicContainer.Info
    @Attribute private(set) var childDepths: [ViewDepth]

    let id: DynamicContainerID
    
    typealias Value = ViewDepth
    
    func updateValue() {
        fatalError("TODO")
    }
}

fileprivate struct DynamicLayoutViewChildDepthGeometry {
    @Attribute private(set) var containerInfo: DynamicContainer.Info
    @Attribute private(set) var childGeometries: [ViewDepthGeometry]

    let id: DynamicContainerID
}
