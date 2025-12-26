@available(visionOS 2.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public protocol HoverEffectContent {
    static func _makeHoverEffectContent(effect: _GraphValue<Self>, inputs: _HoverEffectContentInputs, body: @escaping (_HoverEffectContentInputs) -> _HoverEffectContentOutputs) -> _HoverEffectContentOutputs
}

public struct _HoverEffectContentInputs {
}

extension _HoverEffectContentInputs: Sendable {
}

public struct _HoverEffectContentOutputs {
}

extension _HoverEffectContentOutputs: Sendable {
}
