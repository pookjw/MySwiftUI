// 7155BC0A5DB12E9050135C0952700740
internal import AttributeGraph

extension _ViewOutputs {
    static func makeDepthTransform(inputs: _ViewInputs, depth: () -> Attribute<ViewDepth>, body: (_ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        var inputs = inputs
        
        if inputs.needsGeometry {
            inputs.transform = Attribute(
                DepthTransform(
                    transform: inputs.transform,
                    depth: depth()
                )
            )
        }
        
        return body(inputs)
    }
    
    static func makeDepthTransform(inputs: _ViewInputs, geometry: () -> Attribute<ViewDepthGeometry>, body: (_ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        /*
         inputs -> x0 -> x27
         geometry -> x1/x2 -> x24/x20
         body -> x3/x4 -> sp + 0x28 / x23
         */
        // x29 - 0xc0
        let copy_1 = inputs
        assertUnimplemented()
    }
}

fileprivate struct DepthTransform : Rule, AsyncAttribute {
    @Attribute private(set) var transform: ViewTransform
    @Attribute private(set) var depth: ViewDepth
    
    var value: ViewTransform {
        var transform = transform
        transform.depth = depth
        return transform
    }
}
