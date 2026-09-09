public import MySwiftUICore

extension View {
    @inlinable nonisolated public func hidden() -> some View {
        return modifier(_HiddenModifier())
    }
}

@frozen public struct _HiddenModifier : ViewModifier {
    @inlinable public init() {}
    
    nonisolated public static func _makeView(modifier: _GraphValue<_HiddenModifier>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        /*
         modifier -> x0
         inputs -> x1 -> x22
         body -> x2/x3 -> x21 / x29 - 0x60
         */
        return makeHiddenView(
            allowedKeys: [.hostPreference],
            inputs: inputs,
            body: body
        )
    }
    
    public typealias Body = Swift.Never
}

extension _HiddenModifier : Sendable {}
extension _HiddenModifier : BitwiseCopyable {}
extension _HiddenModifier : MultiViewModifier {}
