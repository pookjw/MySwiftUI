// B70BDD1D6CCDD38A0422AB36A90F7369
internal import MySwiftUICore
internal import Spatial
private import AttributeGraph

protocol _RendererEffect3D {
    func effectValue(size: Size3D) -> DisplayList.Effect
}

extension _RendererEffect3D {
    static nonisolated func _makeRendererEffect3D(effect: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        /*
         effect -> x0 -> x29 - 0xd0
         inputs -> x1 -> x27
         body -> x2/x3 -> x29 - 0x98 / x29 - 0xa0
         */
        // <+440>
        // x25
        var copy_1 = inputs
        
        if inputs.needsGeometry {
            copy_1.containerPosition = inputs.animatedPosition()
        }
        
        // <+488>
        var outputs = body(_Graph(), copy_1)
        
        if inputs.preferences.contains(DisplayList.Key.self) {
            let rule = RendererEffect3DDisplayList(
                identity: inputs.pushIdentity(),
                effect: effect.value,
                position: inputs.animatedPosition(),
                size: inputs.animatedSize(),
                depth: inputs.animatedDepth(),
                transform: inputs.transform,
                containerPosition: inputs.containerPosition,
                environment: inputs.environment,
                safeAreaInsets: inputs.safeAreaInsets,
                content: OptionalAttribute(outputs[DisplayList.Key.self]),
                options: inputs[DisplayList.Options.self]
            )
            
            let attribute = Attribute(rule)
            outputs[DisplayList.Key.self] = attribute
        }
        
        return outputs
    }
}

protocol RendererEffect3D: _RendererEffect3D {
}

extension RendererEffect3D {
    static nonisolated func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
}

fileprivate struct RendererEffect3DDisplayList<T: _RendererEffect3D>: Rule, AsyncAttribute {
    let identity: _DisplayList_Identity
    @Attribute private(set) var effect: T
    @Attribute private(set) var position: CGPoint
    @Attribute private(set) var size: ViewSize
    @Attribute private(set) var depth: ViewDepth
    @Attribute private(set) var transform: ViewTransform
    @Attribute private(set) var containerPosition: CGPoint
    @Attribute private(set) var environment: EnvironmentValues
    @OptionalAttribute var safeAreaInsets: SafeAreaInsets?
    @OptionalAttribute var content: DisplayList?
    let options: DisplayList.Options
    
    var value: DisplayList {
        assertUnimplemented()
    }
}
