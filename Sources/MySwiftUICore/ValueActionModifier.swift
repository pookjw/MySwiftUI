@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {
    @available(iOS, deprecated: 17.0, message: "Use `onChange` with a two or zero parameter action closure instead.")
    @available(macOS, deprecated: 14.0, message: "Use `onChange` with a two or zero parameter action closure instead.")
    @available(tvOS, deprecated: 17.0, message: "Use `onChange` with a two or zero parameter action closure instead.")
    @available(watchOS, deprecated: 10.0, message: "Use `onChange` with a two or zero parameter action closure instead.")
    @available(visionOS, deprecated: 1.0, message: "Use `onChange` with a two or zero parameter action closure instead.")
    @inlinable nonisolated public func onChange<V>(of value: V, perform action: @escaping (_ newValue: V) -> Void) -> some View where V : Equatable {
        modifier(_ValueActionModifier(value: value, action: action))
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension View {
    nonisolated public func onChange<V>(of value: V, initial: Bool = false, _ action: @escaping (_ oldValue: V, _ newValue: V) -> Void) -> some View where V : Equatable {
        let valueActionModifier = modifier(
            _ValueActionModifier2(value: value, action: action)
        )
        
        var appear: (() -> Void)?
        if initial {
            appear = {
                action(value, value)
            }
        }
        
        return valueActionModifier
            .modifier(
                _AppearanceActionModifier(
                    appear: appear,
                    disappear: nil
                )
            )
    }
    
    nonisolated public func onChange<V>(of value: V, initial: Bool = false, _ action: @escaping () -> Void) -> some View where V : Equatable {
        assertUnimplemented()
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@frozen public struct _ValueActionModifier<Value> : ViewModifier where Value : Equatable {
    public typealias Body = Never
    
    // safe + nonisolated는 원래 없음
    @safe public nonisolated(unsafe) var value: Value
    // safe + nonisolated는 원래 없음
    @safe public nonisolated(unsafe) var action: (Value) -> Void
    
    @inlinable public nonisolated /* nonisolated는 원래 없음 */ init(value: Value, action: @escaping (Value) -> Void) {
        (self.value, self.action) = (value, action)
    }
    
    nonisolated public static func _makeView(modifier: _GraphValue<_ValueActionModifier<Value>>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    nonisolated public static func _makeViewList(modifier: _GraphValue<_ValueActionModifier<Value>>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension _ValueActionModifier : Sendable {
}

extension _ValueActionModifier : PrimitiveViewModifier {}

extension _ValueActionModifier : ValueActionModifierProtocol {
    func sendAction(old: Value?) {
        assertUnimplemented()
    }
}

protocol ValueActionModifierProtocol {
    associatedtype Value
    func sendAction(old: Value?)
    var value: Value { get }
}

struct _ValueActionModifier2<Value> : ViewModifier, PrimitiveViewModifier, ValueActionModifierProtocol {
    @safe nonisolated(unsafe) var value: Value
    @safe fileprivate private(set) nonisolated(unsafe) var action: (Value, Value) -> ()
    
    @inline(always) // 원래 없음
    nonisolated init(value: Value, action: @escaping (Value, Value) -> Void) {
        self.value = value
        self.action = action
    }
    
    func sendAction(old: Value?) {
        assertUnimplemented()
    }
    
    nonisolated static func _makeView(modifier: _GraphValue<_ValueActionModifier2<Value>>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    nonisolated static func _makeViewList(modifier: _GraphValue<_ValueActionModifier2<Value>>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
}

struct _ValueActionModifier3<Value> : ViewModifier, PrimitiveViewModifier {
    private var value: Value
    private var action: (Value, Value, Transaction) -> ()
    
    nonisolated static func _makeView(modifier: _GraphValue<_ValueActionModifier2<Value>>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    nonisolated static func _makeViewList(modifier: _GraphValue<_ValueActionModifier2<Value>>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
}
