// B70BDD1D6CCDD38A0422AB36A90F7369
internal import MySwiftUICore
internal import Spatial
private import AttributeGraph
private import CoreGraphics

protocol _RendererEffect3D {
    func effectValue(size: Size3D) -> DisplayList.Effect
}

extension _RendererEffect3D {
    nonisolated static func _makeRendererEffect3D(effect: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
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
                _depth: inputs.animatedDepth(),
                transform: inputs.transform,
                containerPosition: inputs.containerPosition,
                environment: inputs.environment,
                safeAreaInsets: inputs.safeAreaInsets,
                _content: OptionalAttribute(outputs[DisplayList.Key.self]),
                options: inputs[DisplayList.Options.self]
            )
            
            let attribute = Attribute(rule)
            outputs[DisplayList.Key.self] = attribute
        }
        
        return outputs
    }
}

protocol RendererEffect3D : _RendererEffect3D {
}

extension RendererEffect3D {
    nonisolated static func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
}

fileprivate struct RendererEffect3DDisplayList<T : _RendererEffect3D>: Rule, AsyncAttribute {
    let identity: _DisplayList_Identity // 0x0
    @Attribute private(set) var effect: T // 0x4
    @Attribute private(set) var position: CGPoint // 0x8
    @Attribute private(set) var size: ViewSize // 0xc
    private(set) var _depth: Attribute<ViewDepth> // 0x10
    @Attribute private(set) var transform: ViewTransform // 0x14
    @Attribute private(set) var containerPosition: CGPoint // 0x18
    @Attribute private(set) var environment: EnvironmentValues // 0x1c
    @OptionalAttribute var safeAreaInsets: SafeAreaInsets? // 0x20
    private(set) var _content: OptionalAttribute<DisplayList> // 0x24
    let options: DisplayList.Options // 0x28
    
    var depth: ViewDepth {
        return _depth.value
    }
    
    var content: DisplayList? {
        return _content.wrappedValue
    }
    
    var value: DisplayList {
        // self -> x20 -> x22
        // <+712>
        // x27
        let displayList = self.content ?? DisplayList()
        
        guard !displayList.isEmpty else {
            return DisplayList()
        }
        
        // <+872>
        // x23
        let version = DisplayList.Version(forUpdate: ())
        // x20
        var proxy = GeometryProxy(
            owner: .current!,
            size: $size,
            environment: $environment,
            transform: $transform,
            position: $position,
            safeAreaInsets: $safeAreaInsets,
            seed: numericCast(version.value)
        )
        
        let effect: DisplayList.Effect = proxy.asCurrent { 
            // $s7SwiftUI27RendererEffect3DDisplayList33_B70BDD1D6CCDD38A0422AB36A90F7369LLV5valueAA07DisplayF0VvgAG6EffectOyXEfU_TA
            let effect = self.effect
            let size = self.size.value
            let depth = self.depth.value
            return effect.effectValue(size: Size3D(size, depth: depth))
        }
        
        var d8: CGFloat
        var d9: CGFloat
        do {
            let position = self.position
            d8 = position.x
            d9 = position.y
        }
        
        let d0: CGFloat
        let d1: CGFloat
        do {
            let containerPosition = self.containerPosition
            d0 = containerPosition.x
            d1 = containerPosition.y
        }
        
        d8 = d8 - d0
        d9 = d9 - d1
        
        var item = DisplayList.Item(
            .effect(effect, displayList),
            frame: CGRect(origin: CGPoint(x: d8, y: d9), size: self.size.value),
            identity: self.identity,
            version: version
        )
        item.canonicalize(options: self.options)
        
        return DisplayList(item)
    }
}
