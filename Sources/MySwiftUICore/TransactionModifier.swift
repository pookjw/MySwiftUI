// A1B10B5AB036C34AB7DD2EE8825FCA93
internal import AttributeGraph

extension View {
    @inlinable nonisolated public func transaction(_ transform: @escaping (inout Transaction) -> Void) -> some View {
        modifier(_TransactionModifier(transform: transform))
    }
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    @_alwaysEmitIntoClient nonisolated public func transaction(value: some Equatable, _ transform: @escaping (inout Transaction) -> Void) -> some View {
        modifier(_ValueTransactionModifier(value: value, transform: transform))
    }
    
    @available(iOS, introduced: 13.0, deprecated: 15.0, message: "Use withAnimation or animation(_:value:) instead.")
    @available(macOS, introduced: 10.15, deprecated: 12.0, message: "Use withAnimation or animation(_:value:) instead.")
    @available(tvOS, introduced: 13.0, deprecated: 15.0, message: "Use withAnimation or animation(_:value:) instead.")
    @available(watchOS, introduced: 6.0, deprecated: 8.0, message: "Use withAnimation or animation(_:value:) instead.")
    @available(visionOS, introduced: 1.0, deprecated: 1.0, message: "Use withAnimation or animation(_:value:) instead.")
    @_disfavoredOverload @inlinable nonisolated public func animation(_ animation: Animation?) -> some View {
        return transaction { t in
            if !t.disablesAnimations {
                t.animation = animation
            }
        }
    }
}

extension ViewModifier {
    @inlinable nonisolated public func transaction(_ transform: @escaping (inout Transaction) -> Void) -> some ViewModifier {
        return _PushPopTransactionModifier(content: self, transform: transform)
    }
    
    @inlinable @MainActor @preconcurrency public func animation(_ animation: Animation?) -> some ViewModifier {
        return transaction { t in
            if !t.disablesAnimations {
                t.animation = animation
            }
        }
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension View {
    nonisolated public func transaction<V>(_ transform: @escaping (inout Transaction) -> Void, @ViewBuilder body: (PlaceholderContentView<Self>) -> V) -> some View where V : View {
        assertUnimplemented()
    }
    
    nonisolated public func animation<V>(_ animation: Animation?, @ViewBuilder body: (PlaceholderContentView<Self>) -> V) -> some View where V : View {
        assertUnimplemented()
    }
}

@frozen public struct _TransactionModifier : ViewModifier, _GraphInputsModifier {
    @safe public nonisolated(unsafe) var transform: (inout Transaction) -> Void
    
    @inlinable public nonisolated init(transform: @escaping (inout Transaction) -> Void) { // nonisolated는 원래 없음
        self.transform = transform
    }
    
    public static func _makeInputs(modifier: _GraphValue<_TransactionModifier>, inputs: inout _GraphInputs) {
        let childTransaction = ChildTransaction(modifier: modifier.value, transaction: inputs.transaction)
        inputs.transaction = Attribute(childTransaction)
    }
    
    public typealias Body = Never
}

@available(*, unavailable)
extension _TransactionModifier : Sendable {
}

extension _TransactionModifier : PrimitiveViewModifier {}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@frozen public struct _ValueTransactionModifier<Value> : ViewModifier, _GraphInputsModifier where Value : Equatable {
    @safe public nonisolated(unsafe) var value: Value
    @safe public nonisolated(unsafe) var transform: (inout Transaction) -> Void
    
    @inlinable public nonisolated init(value: Value, transform: @escaping (inout Transaction) -> Void) { // nonisolated는 원래 없음
        self.value = value
        self.transform = transform
    }
    
    public static func _makeInputs(modifier: _GraphValue<_ValueTransactionModifier<Value>>, inputs: inout _GraphInputs) {
        assertUnimplemented()
    }
    
    public typealias Body = Never
}

@available(*, unavailable)
extension _ValueTransactionModifier : Sendable {
}

extension _ValueTransactionModifier : PrimitiveViewModifier {}

@frozen public struct _PushPopTransactionModifier<Content> : ViewModifier where Content : ViewModifier {
    @safe public nonisolated(unsafe) var content: Content
    @safe public nonisolated(unsafe) var base: _TransactionModifier
    
    @inlinable public nonisolated init(content: Content, transform: @escaping (inout Transaction) -> Void) { // nonisolated는 원래 없음
        self.content = content
        base = .init(transform: transform)
    }
    
    nonisolated public static func _makeView(modifier: _GraphValue<_PushPopTransactionModifier<Content>>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    public typealias Body = Never
}

@available(*, unavailable)
extension _PushPopTransactionModifier : Sendable {
}

extension _PushPopTransactionModifier : MultiViewModifier, PrimitiveViewModifier {}

extension _ViewInputs {
    var savedTransactions: [Attribute<Transaction>] {
        get {
            return base.savedTransactions
        }
        set {
            base.savedTransactions = newValue
        }
        _modify {
            yield &base.savedTransactions
        }
    }
}

extension _GraphInputs {
    var savedTransactions: [Attribute<Transaction>] {
        get {
            return self[SavedTransactionKey.self]
        }
        set {
            self[SavedTransactionKey.self] = newValue
        }
        _modify {
            yield &self[SavedTransactionKey.self]
        }
    }
    
    fileprivate struct SavedTransactionKey : ViewInput {
        static let defaultValue: [Attribute<Transaction>] = [] 
    }
}

fileprivate struct ChildTransaction : Rule, AsyncAttribute {
    @Attribute private(set) var modifier: _TransactionModifier
    @Attribute private(set) var transaction: Transaction
    
    var value: Transaction {
        // <+480>
        // x29 - 0x68
        var transaction = self.transaction
        /*
         modifier attribute -> w20
         transaction attribute -> w25
         */
        // modifier -> x29 - 0x110, x29 - 0x100
        let (modifier, flags) = self.$modifier.valueAndFlags(options: .unknown1)
        
        if !flags.contains(.requiresMainThread) {
            // <+568>
            ObservationCenter.current._withObservation(attribute: Attribute<Transaction>(identifier: .current!)) {
                modifier.transform(&transaction)
            }
            
            return transaction
        } else {
            // <+1016>
            // inlined
            // UncheckedSendable은 원래 없음
            var unchecked = UncheckedSendable(transaction)
            Update.syncMain {
                ObservationCenter.current._withObservation(attribute: Attribute<Transaction>(identifier: .current!)) {
                    modifier.transform(&unchecked.value)
                }
            }
            
            // <+2632>
            return unchecked.value
        }
    }
}
