#warning("TODO")

@frozen
@propertyWrapper
@dynamicMemberLookup
public struct Binding<Value> {
    public var transaction: Transaction
    package var location: AnyLocation<Value>
    package var _value: Value
    
    public var wrappedValue: Value {
        get {
            fatalError("TODO")
        }
        nonmutating set {
            fatalError("TODO")
        }
    }
    
    public var projectedValue: Binding<Value> {
        fatalError("TODO")
    }
    
    public static func constant(_ value: Value) -> Binding<Value> {
        fatalError("TODO")
    }
    
    @preconcurrency public init(
        @_inheritActorContext get: @escaping @isolated(any) @Sendable () -> Value,
        @_inheritActorContext set: @escaping @isolated(any) @Sendable (Value) -> Void
    ) {
        fatalError("TODO")
    }
    
    @preconcurrency public init(
        @_inheritActorContext get: @escaping @isolated(any) @Sendable () -> Value,
        @_inheritActorContext set: @escaping @isolated(any) @Sendable (Value, Transaction) -> Void
    ) {
        fatalError("TODO")
    }
    
    @_alwaysEmitIntoClient public init(projectedValue: Binding<Value>) {
        self = projectedValue
    }
    
    package init(value: Value, location: AnyLocation<Value>) {
        self.transaction = Transaction()
        self.location = location
        self._value = value
    }
    
    public subscript<Subject>(dynamicMember keyPath: WritableKeyPath<Value, Subject>) -> Binding<Subject> {
        fatalError("TODO")
    }
}

extension Binding: @unchecked Sendable where Value : Sendable {}

extension Binding: Identifiable where Value : Identifiable {
    public var id: Value.ID {
        fatalError("TODO")
    }
}

extension Binding: Sequence where Value : MutableCollection {
    public typealias Element = Binding<Value.Element>
    public typealias Iterator = IndexingIterator<Binding<Value>>
    public typealias SubSequence = Slice<Binding<Value>>
}

extension Binding: Collection where Value : MutableCollection {
    public typealias Index = Value.Index
    public typealias Indices = Value.Indices
    
    public var startIndex: Binding<Value>.Index {
        fatalError("TODO")
    }
    
    public var endIndex: Binding<Value>.Index {
        fatalError("TODO")
    }
    
    public var indices: Value.Indices {
        fatalError("TODO")
    }
    
    public func index(after i: Binding<Value>.Index) -> Binding<Value>.Index {
        fatalError("TODO")
    }
    
    public func formIndex(after i: inout Binding<Value>.Index) {
        fatalError("TODO")
    }
    
    public subscript(position: Binding<Value>.Index) -> Binding<Value>.Element {
        fatalError("TODO")
    }
}

extension Binding: BidirectionalCollection where Value : BidirectionalCollection, Value : MutableCollection {
    public func index(before i: Binding<Value>.Index) -> Binding<Value>.Index {
        fatalError("TODO")
    }
    
    public func formIndex(before i: inout Binding<Value>.Index) {
        fatalError("TODO")
    }
}

extension Binding: RandomAccessCollection where Value : MutableCollection, Value : RandomAccessCollection {
}

extension Binding {
    public func transaction(_ transaction: Transaction) -> Binding<Value> {
        fatalError("TODO")
    }
    
    public func animation(_ animation: Animation? = .default) -> Binding<Value> {
        fatalError("TODO")
    }
}

extension Binding : DynamicProperty {
    public static func _makeProperty<V>(in buffer: inout _DynamicPropertyBuffer, container: _GraphValue<V>, fieldOffset: Int, inputs: inout _GraphInputs) {
        fatalError("TODO")
    }
}
