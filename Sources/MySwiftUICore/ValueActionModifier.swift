internal import AttributeGraph
private import os.log

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
        let valueActionModifier = modifier(
            _ValueActionModifier2(value: value, action: { _, _ in
                action()
            })
        )
        
        var appear: (() -> Void)?
        if initial {
            appear = {
                action()
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
        let dispatcher = ValueActionDispatcher(modifier: modifier.value, phase: inputs.base.phase)
        let attribute = Attribute(dispatcher)
        attribute.flags = .unknown0
        return body(_Graph(), inputs)
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
    func sendAction(old: _ValueActionModifier?) {
        (old?.action ?? self.action)(self.value)
    }
}

protocol ValueActionModifierProtocol {
    associatedtype Value : Equatable
    nonisolated func sendAction(old: Self?)
    nonisolated var value: Value { get }
}

struct _ValueActionModifier2<Value : Equatable> : ViewModifier, PrimitiveViewModifier, ValueActionModifierProtocol {
    @safe nonisolated(unsafe) var value: Value
    @safe fileprivate private(set) nonisolated(unsafe) var action: (Value, Value) -> ()
    
    @inline(always) // 원래 없음
    nonisolated init(value: Value, action: @escaping (Value, Value) -> Void) {
        self.value = value
        self.action = action
    }
    
    func sendAction(old: _ValueActionModifier2<Value>?) {
        self.action(old?.value ?? self.value, self.value)
    }
    
    nonisolated static func _makeView(modifier: _GraphValue<_ValueActionModifier2<Value>>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        let dispatcher = ValueActionDispatcher(modifier: modifier.value, phase: inputs.base.phase)
        let attribute = Attribute(dispatcher)
        attribute.flags = .unknown0
        
        return body(_Graph(), inputs)
    }
    
    nonisolated static func _makeViewList(modifier: _GraphValue<_ValueActionModifier2<Value>>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
}

struct _ValueActionModifier3<Value : Equatable> : ViewModifier, PrimitiveViewModifier {
    private var value: Value
    private var action: (Value, Value, Transaction) -> ()
    
    nonisolated static func _makeView(modifier: _GraphValue<_ValueActionModifier2<Value>>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    nonisolated static func _makeViewList(modifier: _GraphValue<_ValueActionModifier2<Value>>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
}

struct ValueActionDispatcher<Modifier : ValueActionModifierProtocol> : StatefulRule, AsyncAttribute {
    @Attribute private var modifier: Modifier // 0x0
    @Attribute private var phase: _GraphInputs.Phase // 0x4
    private var oldValue: Modifier? = nil // 0x8
    private var lastResetSeed: UInt32 = 0 // 0x20
    private var cycleDetector = UpdateCycleDetector() // 0x24
    
    nonisolated init(modifier: Attribute<Modifier>, phase: Attribute<_GraphInputs.Phase>) {
        self._modifier = modifier
        self._phase = phase
    }
    
    typealias Value = Void
    
    mutating func updateValue() {
        // self -> x20 -> x22
        // <+184>
        if self.phase.resetSeed != self.lastResetSeed {
            // <+224>
            self.lastResetSeed = self.phase.resetSeed
            self.oldValue = nil
        }
        
        // <+320>
        // x24
        let modifier = self.modifier
        
        let result: Bool? = self.oldValue.map { value in
            // $s7SwiftUI21ValueActionDispatcherV06updateC0yyFSbxXEfU_TA
            return !(value.value == modifier.value)
        }
        
        let flag_1: Bool // true -> <+820> / false -> <+1000>
        
        if result == true {
            // <+492>
            // w21
            let updateSeed = Graph.withoutUpdate { 
                return self.cycleDetector.updateSeed.value
            }
            
            if self.cycleDetector.lastSeed == updateSeed {
                // <+552>
                let flag_2: Bool // true -> <+572> / false -> <+820>
                let oldTtl = self.cycleDetector.ttl
                if oldTtl == 0 {
                    // <+572>
                    flag_2 = true
                } else {
                    self.cycleDetector.ttl = oldTtl &- 1
                    
                    if oldTtl == 1 {
                        // <+572>
                        flag_2 = true
                    } else {
                        // <+820>
                        flag_2 = false
                    }
                }
                
                if flag_2 {
                    // <+572>
                    if !self.cycleDetector.hasLogged {
                        Log.externalWarning("onChange(of: \(_typeName(Modifier.Value.self, qualified: false))) action tried to update multiple times per frame.")
                        self.cycleDetector.hasLogged = true
                    }
                    
                    flag_1 = false
                } else {
                    // <+820>
                    flag_1 = true
                }
            } else {
                // <+812>
                self.cycleDetector.lastSeed = updateSeed
                self.cycleDetector.ttl = 2
                // <+820>
                flag_1 = true
            }
        } else {
            // <+1000>
            flag_1 = false
        }
        
        if flag_1 {
            // <+820>
            // x29 - 0x90
            let copy_1 = modifier
            // x29 - 0x88
            let copy_2 = self.oldValue
            
            Update.enqueueAction(reason: .onChange) { 
                // $s7SwiftUI21ValueActionDispatcherV06updateC0yyFyycfU0_TA
                copy_1.sendAction(old: copy_2)
            }
        }
        
        // <+1000>
        self.oldValue = modifier
    }
}

fileprivate struct ValueActionDispatcher3<Value : Equatable> {
    @Attribute private var modifier: _ValueActionModifier3<Value>
    @Attribute private var phase: _GraphInputs.Phase
    @Attribute private var transaction: Transaction
    private var oldValue: Value?
    private var lastResetSeed: UInt32
    private var cycleDetector: UpdateCycleDetector
}
