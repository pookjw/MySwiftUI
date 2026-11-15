// 9ED0B9F1F6CE74691B78276C750FEDD3
public import CoreGraphics
private import AttributeGraph

public protocol GeometryEffect : Animatable, ViewModifier, _RemoveGlobalActorIsolation where Self.Body == Never {
    func effectValue(size: CGSize) -> ProjectionTransform
    static var _affectsLayout: Bool { get }
}

extension GeometryEffect {
    public static var _affectsLayout: Bool {
        return true
    }
}

protocol GeometryEffectProvider {
    associatedtype Effect : GeometryEffect
    
    static func resolve(effect: Self.Effect, origin: inout CGPoint, size: CGSize, layoutDirection: LayoutDirection) -> DisplayList.Effect
}

extension GeometryEffectProvider {
    static func _makeGeometryEffect(modifier: _GraphValue<Self.Effect>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        /*
         modifier -> x0 -> w22
         inputs -> x1 -> x20
         body -> x2/x3 -> x19 + 0x30 / x19 + 0x28
         */
        guard inputs.base.options.contains(.viewNeedsGeometry) else {
            return body(_Graph(), inputs)
        }
        
        // <+148>
        let animatable = Effect.makeAnimatable(value: modifier, inputs: inputs.base)
        let layoutDirection = inputs.layoutDirection
        var copy_1 = inputs
        let size = inputs.animatedCGSize()
        let position = inputs.animatedPosition()
        
        copy_1.transform = Attribute(
            GeometryEffectTransform<Self.Effect>(
                effect: animatable,
                size: size,
                position: position,
                transform: inputs.transform,
                layoutDirection: layoutDirection
            )
        )
        
        let zeroPoint = ViewGraph.current.$zeroPoint
        copy_1.position = zeroPoint
        copy_1.containerPosition = zeroPoint
        
        copy_1.size = Attribute(
            RoundedSize(
                position: inputs.position,
                size: inputs.size,
                pixelLength: inputs.base.pixelLength
            )
        )
        
        var outputs = body(_Graph(), copy_1)
        
        guard inputs.preferences.contains(DisplayList.Key.self) else {
            return outputs
        }
        
        let identity: _DisplayList_Identity
        if inputs.base.options.contains(.needsStableDisplayListIDs) {
            identity = inputs[_DisplayList_StableIdentityScope.self].attribute!.value.pushIdentity()
        } else {
            identity = _DisplayList_Identity()
        }
        
        let displayList = Attribute(
            GeometryEffectDisplayList<Self>(
                identity: identity,
                effect: animatable,
                position: inputs.animatedPosition(),
                size: inputs.animatedCGSize(),
                layoutDirection: layoutDirection,
                containerPosition: inputs.containerPosition,
                content: OptionalAttribute(outputs.preferences[DisplayList.Key.self]),
                options: inputs[DisplayList.Options.self]
            )
        )
        
        outputs.preferences[DisplayList.Key.self] = displayList
        return outputs
    }
}

extension GeometryEffect {
    nonisolated public static func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        return self.makeGeometryEffect(modifier: modifier, inputs: inputs, body: body)
    }
    
    nonisolated public static func _makeViewList(modifier: _GraphValue<Self>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        return Self.makeMultiViewList(modifier: modifier, inputs: inputs, body: body)
    }
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    nonisolated public static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        return body(inputs)
    }
    
    nonisolated static func makeGeometryEffect(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        if let casted = modifier as? _GraphValue<_RotationEffect> {
            return _RotationEffect._makeGeometryEffect(modifier: casted, inputs: inputs, body: body)
        } else if let casted = modifier as? _GraphValue<_Rotation3DEffect> {
            return _Rotation3DEffect._makeGeometryEffect(modifier: casted, inputs: inputs, body: body)
        } else {
            return DefaultGeometryEffectProvider<Self>._makeGeometryEffect(modifier: modifier, inputs: inputs, body: body)
        }
    }
}

struct DefaultGeometryEffectProvider<T : GeometryEffect> : GeometryEffectProvider {
    func effectValue(size: CGSize) -> ProjectionTransform {
        assertUnimplemented()
    }
    
    static var _affectsLayout: Bool {
        assertUnimplemented()
    }
    
    static func resolve(effect: T, origin: inout CGPoint, size: CGSize, layoutDirection: LayoutDirection) -> DisplayList.Effect {
        assertUnimplemented()
    }
}

fileprivate struct GeometryEffectTransform<T : GeometryEffect> : AsyncAttribute, Rule {
    @Attribute private(set) var effect: T
    @Attribute private(set) var size: CGSize
    @Attribute private(set) var position: CGPoint
    @Attribute private(set) var transform: ViewTransform
    @Attribute private(set) var layoutDirection: LayoutDirection
    
    var value: ViewTransform {
        /*
         x29 -> sp + 0x260
         x19 -> sp
         */
        var result = self.transform
        result.appendPosition(self.position)
        result.positionAdjustment = .zero
        
        guard T._affectsLayout else {
            return result
        }
        
        // x19 + 0xc8
        let projectionTransform = self.effect.effectValue(size: self.size)
        // x19 + 0x80
        let transform: ProjectionTransform
        
        switch self.layoutDirection {
        case .leftToRight:
            transform = projectionTransform
        case .rightToLeft:
            let size = self.size
            
            var transform_1 = ProjectionTransform()
            transform_1.m11 = -1 // -0xc0
            transform_1.m12 = 0
            transform_1.m13 = 0 // -0xb0
            transform_1.m21 = 0
            transform_1.m22 = 1 // -0xa0
            transform_1.m23 = 0
            transform_1.m31 = size.width // -0x90
            transform_1.m32 = 0
            transform_1.m33 = 1
            
            // x19 + 0x110
            let transform_2 = transform_1.concatenating(projectionTransform)
            
            var transform_3 = ProjectionTransform()
            transform_3.m11 = -1
            transform_3.m12 = 0
            transform_3.m13 = 0
            transform_3.m21 = 0
            transform_3.m22 = 1
            transform_3.m23 = 0
            transform_3.m31 = size.width
            transform_3.m32 = 0
            transform_3.m33 = 1
            
            transform = transform_2.concatenating(transform_3)
        }
        
        if transform.isInvertible {
            result.appendProjectionTransform(transform, inverse: true)
        } else {
            Log.externalWarning("ignoring singular matrix: \(transform)")
        }
        
        return result
    }
}

fileprivate struct GeometryEffectDisplayList<T : GeometryEffectProvider> : CustomStringConvertible, AsyncAttribute, Rule {
    let identity: _DisplayList_Identity // 0x0
    @Attribute private(set) var effect: T.Effect // 0x4
    @Attribute private(set) var position: CGPoint // 0x8
    @Attribute private(set) var size: CGSize // 0xc
    @Attribute private(set) var layoutDirection: LayoutDirection // 0x10
    @Attribute private(set) var containerPosition: CGPoint // 0x14
    @OptionalAttribute var content: DisplayList? // 0x18
    let options: DisplayList.Options // 0x1c
    
    var description: String {
        assertUnimplemented()
    }
    
    var value: DisplayList {
        let content = self.content ?? DisplayList()
        
        guard !content.isEmpty else {
            return content
        }
        
        let v1_0: CGFloat
        let v1_1: CGFloat
        do {
            let position = self.position
            v1_0 = position.x
            v1_1 = position.y
        }
        
        var v0_0: CGFloat
        var v0_1: CGFloat
        do {
            let containerPosition = self.containerPosition
            v0_0 = containerPosition.x
            v0_1 = containerPosition.y
        }
        
        v0_0 = v1_0 - v0_0
        v0_1 = v1_1 - v0_1
        var x290xd0 = CGPoint(x: v0_0, y: v0_1)
        
        let effect = self.effect
        let size = self.size
        let layoutDirection = self.layoutDirection
        
        let resolved = T.resolve(
            effect: effect,
            origin: &x290xd0,
            size: size,
            layoutDirection: layoutDirection
        )
        
        var item = DisplayList.Item(
            .effect(resolved, content),
            frame: CGRect(origin: x290xd0, size: self.size),
            identity: self.identity,
            version: DisplayList.Version(forUpdate: ())
        )
        
        item.canonicalize(options: self.options)
        
        return DisplayList(item)
    }
}
