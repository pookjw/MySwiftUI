// 9ED0B9F1F6CE74691B78276C750FEDD3
public import CoreGraphics
private import AttributeGraph

public protocol GeometryEffect : Animatable, ViewModifier, _RemoveGlobalActorIsolation where Self.Body == Never {
    func effectValue(size: CGSize) -> ProjectionTransform
    static var _affectsLayout: Bool { get }
}

extension GeometryEffect {
    public static var _affectsLayout: Bool {
        assertUnimplemented()
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
        assertUnimplemented()
    }
}

fileprivate struct GeometryEffectDisplayList<T : GeometryEffectProvider> : CustomStringConvertible, AsyncAttribute, Rule {
    let identity: _DisplayList_Identity
    @Attribute private(set) var effect: T.Effect
    @Attribute private(set) var position: CGPoint
    @Attribute private(set) var size: CGSize
    @Attribute private(set) var layoutDirection: LayoutDirection
    @Attribute private(set) var containerPosition: CGPoint
    @OptionalAttribute var content: DisplayList?
    let options: DisplayList.Options
    
    var description: String {
        assertUnimplemented()
    }
    
    var value: DisplayList {
        assertUnimplemented()
    }
}
