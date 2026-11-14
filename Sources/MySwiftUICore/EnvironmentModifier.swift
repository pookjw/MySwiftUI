// E370275CDB55AC7AD9ACF0420859A9E8
package import AttributeGraph

package protocol EnvironmentModifier : _GraphInputsModifier {
    static func makeEnvironment(modifier: Attribute<Self>, environment: inout EnvironmentValues)
}

extension EnvironmentModifier {
    package static func _makeInputs(modifier: _GraphValue<Self>, inputs: inout _GraphInputs) {
        /*
         modifier -> x0 -> w23
         inputs -> x1 -> x19
         */
        inputs.environment = Attribute(
            UpdateEnvironment(
                modifier: modifier.value,
                environment: inputs.environment
            )
        )
    }
}

fileprivate struct UpdateEnvironment<T : EnvironmentModifier> : AsyncAttribute, Rule {
    @Attribute private(set) var modifier: T
    @Attribute private(set) var environment: EnvironmentValues
    
    var value: EnvironmentValues {
        var environment = self.environment
        T.makeEnvironment(modifier: self.$modifier, environment: &environment)
        return environment
    }
}

@frozen public struct _EnvironmentKeyTransformModifier<Value> : ViewModifier, _GraphInputsModifier, PrimitiveViewModifier {
    @safe public nonisolated(unsafe) var keyPath: WritableKeyPath<EnvironmentValues, Value>
    @safe public nonisolated(unsafe) var transform: (inout Value) -> Void
    
    @inlinable public nonisolated init(keyPath: WritableKeyPath<EnvironmentValues, Value>, transform: @escaping (inout Value) -> Void) {
        self.keyPath = keyPath
        self.transform = transform
    }
    
    public static func _makeInputs(modifier: _GraphValue<_EnvironmentKeyTransformModifier<Value>>, inputs: inout _GraphInputs) {
        let environment = Attribute(
            ChildEnvironment(
                modifier: modifier.value,
                environment: inputs.environment,
                oldValue: nil,
                oldKeyPath: nil
            )
        )
        
        inputs.environment = environment
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

fileprivate struct ChildEnvironment<Value> : CustomStringConvertible, AsyncAttribute, StatefulRule {
    @Attribute private var modifier: _EnvironmentKeyTransformModifier<Value>
    @Attribute private var environment: EnvironmentValues
    private var oldValue: Value?
    private var oldKeyPath: WritableKeyPath<EnvironmentValues, Value>?
    
    init(modifier: Attribute<_EnvironmentKeyTransformModifier<Value>>, environment: Attribute<EnvironmentValues>, oldValue: Value?, oldKeyPath: WritableKeyPath<EnvironmentValues, Value>?) {
        self._modifier = modifier
        self._environment = environment
        self.oldValue = oldValue
        self.oldKeyPath = oldKeyPath
    }
    
    typealias Value = EnvironmentValues
    
    func updateValue() {
        assertUnimplemented()
    }
    
    var description: String {
        assertUnimplemented()
    }
}
