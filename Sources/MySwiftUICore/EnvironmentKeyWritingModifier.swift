// 3B04936F6043A290A3E53AE94FE09355, E370275CDB55AC7AD9ACF0420859A9E8
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
    
    mutating func updateValue() {
        // x24(sp), x21 -> x19 -> (sp + sizeof(Value)
        let (modifier, modifierChanged) = $modifier.changedValue(options: [])
        // self -> sp + 0x78
        // x21, x23 -> sp + 0xa0, sp + 0xb0
        var (env, envChanged) = $env.changedValue(options: [])
        
        if !envChanged {
            if modifierChanged {
                // <+844>
                let result: Bool? = oldModifier.map { oldModifier in
                    // $s7SwiftUI16ChildEnvironment33_3B04936F6043A290A3E53AE94FE09355LLV11updateValueyyFSbyKXEfu_SbyKXEfu0_SbAA01_D18KeyWritingModifierVyxGXEfU_
                    /*
                     oldModifier -> x0 -> x19
                     modifier -> x1 -> x20
                     Value -> x2 -> x23
                     */
                    // x25 -> sp + 0x68
                    let oldKeyPath = oldModifier.keyPath
                    // x28(sp)
                    let copy_1 = modifier
                    // x19
                    let newKeyPath = copy_1.keyPath
                    _ = consume copy_1
                    // newKeyPath -> sp + 0x58
                    // x20
                    let result = oldKeyPath == newKeyPath
                    
                    guard result else {
                        return true
                    }
                    
                    // <+340>
                    // x28
                    let copy_2 = modifier
                    // x25
                    let newValue = copy_2.value
                    _ = consume copy_2
                    
                    return !compareValues(oldModifier.value, newValue, options: [.unknown1])
                }
                
                if let result {
                    if result {
                        // <+448>
                    } else {
                        // <+392>
                        if hasValue {
                            // <+408>
                            // <+772>
                            return
                        } else {
                            // <+448>
                        }
                    }
                } else {
                    // <+448>
                }
            } else {
                // <+376>
                if hasValue {
                    // <+408>
                    // <+772>
                    return
                } else {
                    // <+448>
                }
            }
        } else {
            // <+432>
            // <+448>
        }
        
        // <+448>
        // x25
        let copy_1 = modifier
        // modifier -> sp + 0x80
        // x21
        let newKeyPath = copy_1.keyPath
        _ = consume copy_1
        
        // <+508>
        // x26
        let copy_2 = modifier
        // x27
        let newValue = copy_2.value
        _ = consume copy_2
        
        // <+564>
        env[keyPath: newKeyPath] = newValue
        self.value = env
        
        // self -> x23
        // x25
        let copy_3 = modifier
        self.oldModifier = modifier
    }
    
    var description: String {
        fatalError("TODO")
    }
}
