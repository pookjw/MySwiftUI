// 530459AF10BEFD7ED901D8CE93C1E289
private import AttributeGraph

extension View {
    @inlinable nonisolated public func animation<V>(_ animation: Animation?, value: V) -> some View where V : Equatable {
        return modifier(_AnimationModifier(animation: animation, value: value))
    }
}

@frozen public struct _AnimationModifier<Value> : ViewModifier where Value : Equatable {
    @safe public nonisolated(unsafe) var animation: Animation?
    @safe public nonisolated(unsafe) var value: Value
    
    @inlinable public nonisolated /* nonisolated는 원래 없음 */ init(animation: Animation?, value: Value) {
        self.animation = animation
        self.value = value
    }
    
    nonisolated public static func _makeView(modifier: _GraphValue<_AnimationModifier<Value>>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs{
        /*
         modifier -> x0 -> w27
         inputs -> x1 -> x24
         body -> x2/x3 -> x19/x20
         */
        // x26 + 0x60 (sp + 0xc0)
        let copy_1 = inputs
        let archivedViewInput = copy_1[ArchivedViewInput.self]
        
        if archivedViewInput.isArchived {
            // <+268>
            return _AnimationModifier<Value>.makeArchivedView(modifier: modifier, inputs: inputs, body: body)
        } else {
            // <+144>
            // sp + 0x60
            var copy_2 = inputs
            // modifier -> w27 -> sp + 0x5c
            // sp + 0x8
            let _ = copy_2
            
            _AnimationModifier<Value>._makeInputs(modifier: modifier, inputs: &copy_2.base)
            
            // x23
            let outputs = body(_Graph(), copy_2)
            // <+336>
            return outputs
        }
    }
    
    nonisolated public static func _makeViewList(modifier: _GraphValue<_AnimationModifier<Value>>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        if inputs.base[ArchivedViewInput.self].isArchived {
            // <+196>
            return _AnimationModifier<Value>.makeArchivedViewList(modifier: modifier, inputs: inputs, body: body)
        } else {
            var copy = inputs
            _AnimationModifier<Value>._makeInputs(modifier: modifier, inputs: &copy.base)
            return body(_Graph(), copy)
        }
    }
    
    
    public typealias Body = Swift.Never
}

@available(*, unavailable)
extension _AnimationModifier : Sendable {
}

extension _AnimationModifier : PrimitiveViewModifier {}

extension _AnimationModifier : Equatable {
    public static func == (a: _AnimationModifier<Value>, b: _AnimationModifier<Value>) -> Bool {
        assertUnimplemented()
    }
}

extension _AnimationModifier {
    static nonisolated func _makeInputs(modifier: _GraphValue<_AnimationModifier<Value>>, inputs: inout _GraphInputs) {
        /*
         modifier -> x0 -> x25
         inputs -> x1 -> x19
         */
        // <+180>
        let childTransaction = ChildTransaction<Value>(
            value: modifier[{ .of(&$0.value)}].value,
            animation: modifier[{ .of(&$0.animation)}].value,
            transaction: inputs.transaction,
            updateSeed: GraphHost.currentHost.data.$updateSeed,
            oldValue: nil,
            oldSeed: nil
        )
        
        let attribute = Attribute(childTransaction)
        inputs.transaction = attribute
        attribute.flags = .unknown0
    }
    
    static fileprivate nonisolated func makeArchivedView(modifier: _GraphValue<_AnimationModifier<Value>>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    static fileprivate nonisolated func makeArchivedViewList(modifier: _GraphValue<_AnimationModifier<Value>>, inputs: _ViewListInputs, body: (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
}

fileprivate struct ChildTransaction<Value : Equatable> : StatefulRule {
    @Attribute private var value: Value
    @Attribute private var animation: Animation?
    @Attribute private var transaction: Transaction
    @Attribute private var updateSeed: UInt32
    private var oldValue: Value?
    private var oldSeed: UInt32?
    
    init(
        value: Attribute<Value>,
        animation: Attribute<Animation?>,
        transaction: Attribute<Transaction>,
        updateSeed: Attribute<UInt32>,
        oldValue: Value?,
        oldSeed: UInt32?
    ) {
        self._value = value
        self._animation = animation
        self._transaction = transaction
        self._updateSeed = updateSeed
        self.oldValue = oldValue
        self.oldSeed = oldSeed
    }
    
    typealias Value = Transaction
    
    mutating func updateValue() {
        // self -> x20 -> x19
        // <+196>
        // x22, w21
        let (value, valueChanged) = self.$value.changedValue(options: [])
        // x24 -> x29 - 0x60
        var transaction = self.transaction
        
        let flag: Bool // true -> <+328> / false -> <+824>
        if valueChanged {
            // <+304>
            flag = true
        } else {
            // <+272>
            if let oldSeed {
                // <+516>
                let block: (UInt32) -> Bool = { [self] seed in
                    // $s7SwiftUI16ChildTransaction33_530459AF10BEFD7ED901D8CE93C1E289LLV11updateValueyyFSbyKXEfu_Sbs6UInt32VXEfU_
                    return seed != self.updateSeed
                }
                
                if block(oldSeed) {
                    // <+572>
                    // <+328>
                    flag = true
                } else {
                    // <+824>
                    flag = false
                }
            } else {
                // <+824>
                flag = false
            }
        }
        
        if flag {
            // value -> x22 -> x29 - 0x90
            self.oldSeed = nil
            // x27
            let oldValue = self.oldValue
            
            if let oldValue {
                // <+428>
                // oldValue -> x27 -> x22
                if transaction.disablesAnimations || (oldValue == value) {
                    // <+496>
                    // <+756>
                    // <+760>
                } else {
                    // <+588>
                    // x26
                    let animation = self.animation
                    transaction.animation = animation
                    self.oldSeed = self.updateSeed
                    // <+760>
                }
            } else {
                // <+760>
            }
            
            // <+760>
            self.oldValue = value
            // <+824>
        } else {
            // <+824>
        }
        
        // <+824>
        self.value = transaction
    }
}
