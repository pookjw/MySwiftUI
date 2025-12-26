@available(iOS 18.0, tvOS 18.0, visionOS 2.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
public protocol CustomHoverEffect {
    associatedtype Body: CustomHoverEffect
    typealias Content = EmptyHoverEffect
    func body(content: Self.Content) -> Self.Body
    static func _makeCustomHoverEffect(effect: _GraphValue<Self>, inputs: _CustomHoverEffectInputs, body: @escaping (_CustomHoverEffectInputs) -> _CustomHoverEffectOutputs) -> _CustomHoverEffectOutputs
}

extension CustomHoverEffect where Self.Body == Never {
    public func body(content: Self.Content) -> Self.Body {
        fatalError("TODO")
    }
}

extension CustomHoverEffect {
    public static func _makeCustomHoverEffect(effect: _GraphValue<Self>, inputs: _CustomHoverEffectInputs, body: @escaping (_CustomHoverEffectInputs) -> _CustomHoverEffectOutputs) -> _CustomHoverEffectOutputs {
        fatalError("TODO")
    }
}

public struct EmptyHoverEffect: CustomHoverEffect {
    public static func _makeCustomHoverEffect(effect: _GraphValue<EmptyHoverEffect>, inputs: _CustomHoverEffectInputs, body: @escaping (_CustomHoverEffectInputs) -> _CustomHoverEffectOutputs) -> _CustomHoverEffectOutputs {
        fatalError("TODO")
    }
    
    public typealias Body = Never
}

extension CustomHoverEffect where Self == EmptyHoverEffect {
    public static var empty: EmptyHoverEffect {
        fatalError("TODO")
    }
}

@available(*, unavailable)
extension EmptyHoverEffect: Sendable {
}

public struct _CustomHoverEffectInputs {
}

@available(*, unavailable)
extension _CustomHoverEffectInputs: Sendable {
}

public struct _CustomHoverEffectOutputs {
}

@available(*, unavailable)
extension _CustomHoverEffectOutputs: Sendable {
}

extension Never: CustomHoverEffect {
}
