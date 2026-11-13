@frozen public struct _EnvironmentKeyTransformModifier<Value> : ViewModifier, _GraphInputsModifier, PrimitiveViewModifier {
    @safe public nonisolated(unsafe) var keyPath: WritableKeyPath<EnvironmentValues, Value>
    @safe public nonisolated(unsafe) var transform: (inout Value) -> Void
    
    @inlinable public nonisolated init(keyPath: WritableKeyPath<EnvironmentValues, Value>, transform: @escaping (inout Value) -> Void) {
        self.keyPath = keyPath
        self.transform = transform
    }
    
    public static func _makeInputs(modifier: _GraphValue<_EnvironmentKeyTransformModifier<Value>>, inputs: inout _GraphInputs) {
        assertUnimplemented()
    }
    
    public typealias Body = Never
}

@available(*, unavailable)
extension _EnvironmentKeyTransformModifier : Sendable {
}

extension View {
    @inlinable nonisolated public func transformEnvironment<V>(_ keyPath: WritableKeyPath<EnvironmentValues, V>, transform: @escaping (inout V) -> Void) -> some View {
        return modifier(_EnvironmentKeyTransformModifier(
            keyPath: keyPath, transform: transform))
    }
}
