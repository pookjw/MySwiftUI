// 3B04936F6043A290A3E53AE94FE09355
private import AttributeGraph

extension View {
    @inlinable public nonisolated func environment<V>(_ keyPath: WritableKeyPath<EnvironmentValues, V>, _ value: V) -> some View {
        modifier(_EnvironmentKeyWritingModifier(keyPath: keyPath, value: value))
    }
}

@frozen public struct _EnvironmentKeyWritingModifier<Value>: ViewModifier, _GraphInputsModifier {
    @safe public nonisolated(unsafe) var keyPath: WritableKeyPath<EnvironmentValues, Value>
    @safe public nonisolated(unsafe) var value: Value
    
    @inlinable public nonisolated init(keyPath: WritableKeyPath<EnvironmentValues, Value>, value: Value) {
        self.keyPath = keyPath
        self.value = value
    }
    
    public static func _makeInputs(modifier: _GraphValue<_EnvironmentKeyWritingModifier<Value>>, inputs: inout _GraphInputs) {
        /*
         modifier -> x23
         inputs -> x20
         */
        // <+176>
        let rule = ChildEnvironment<Value>(modifier: modifier.value, env: inputs.environment, oldModifier: nil)
        inputs.environment = Attribute(rule)
    }
    
    public typealias Body = Never
}

@available(*, unavailable)
extension _EnvironmentKeyWritingModifier : Sendable {
}

fileprivate struct ChildEnvironment<Value>: StatefulRule, AsyncAttribute, CustomStringConvertible {
    @Attribute private var modifier: _EnvironmentKeyWritingModifier<Value>
    @Attribute private var env: EnvironmentValues
    private var oldModifier: _EnvironmentKeyWritingModifier<Value>?
    
    init(modifier: Attribute<_EnvironmentKeyWritingModifier<Value>>, env: Attribute<EnvironmentValues>, oldModifier: _EnvironmentKeyWritingModifier<Value>?) {
        self._modifier = modifier
        self._env = env
        self.oldModifier = oldModifier
    }
    
    typealias Value = EnvironmentValues
    
    func updateValue() {
        // x24(sp), x21 -> x19 -> (sp + sizeof(Value)
        let (modifier, modifierChanged) = $modifier.changedValue(options: [])
        // self -> sp + 0x78
        // x21, x23 -> sp + 0xa0, sp + 0xb0
        let (env, envChanged) = $env.changedValue(options: [])
        
        fatalError("TODO")
    }
    
    var description: String {
        fatalError("TODO")
    }
}
