// C453EE81E759852CCC6400C47D93A43E

@frozen
@propertyWrapper
@dynamicMemberLookup
public struct Binding<Value> {
    public var transaction: Transaction
    package var location: AnyLocation<Value>
    package var _value: Value
    
    public var wrappedValue: Value {
        get {
            return readValue()
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
    
    fileprivate func readValue() -> Value {
        if Update.threadIsUpdating {
            // <+80>
            let location = location
            location.wasRead = true
            return _value
        } else {
            // <+148>
            return location.get()
        }
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

extension Binding: DynamicProperty {
    public static func _makeProperty<V>(in buffer: inout _DynamicPropertyBuffer, container: _GraphValue<V>, fieldOffset: Int, inputs: inout _GraphInputs) {
        let box = Binding.Box(location: nil)
        buffer.append(box, fieldOffset: fieldOffset)
    }
}

extension Binding {
    public init<V>(_ base: Binding<V>) where Value == V? {
        fatalError("TODO")
    }
    
    public init?(_ base: Binding<Value?>) {
        fatalError("TODO")
    }
    
    public init<V>(_ base: Binding<V>) where Value == AnyHashable, V : Hashable {
        fatalError("TODO")
    }
}

extension Binding where Value == Bool {
    static var `false`: Binding<Value> {
        fatalError("TODO")
    }
}

extension Binding {
    fileprivate struct Box: DynamicPropertyBox {
        private(set) var location: LocationBox<Binding<Value>.ScopedLocation>?
        
        mutating func update(property: inout Binding<Value>, phase: _GraphInputs.Phase) -> Bool {
            /*
             self -> x24
             property -> x22
             */
            // x23
            var location: LocationBox<Binding<Value>.ScopedLocation>
            if let _location = self.location {
                // <+96>
                location = _location
                // x8
                let base = location.location.base
                
                if base == location {
                    // <+308>
                } else {
                    let wasRead = location.wasRead
                    // <+152>
                    let scopedLocation = Binding<Value>.ScopedLocation(
                        base: property.location,
                        wasRead: property.location.wasRead
                    )
                    
                    location = LocationBox(
                        location: scopedLocation
                    )
                    
                    self.location = location
                    
                    if wasRead {
                        location.wasRead = wasRead
                    }
                }
            } else {
                // <+148>
                let scopedLocation = Binding<Value>.ScopedLocation(
                    base: property.location,
                    wasRead: property.location.wasRead
                )
                
                location = LocationBox(
                    location: scopedLocation
                )
                
                self.location = location
            }
            
            // <+308>
            let (value, changed) = location.update()
            
            property.location = location
            property._value = value
            
            let updated: Bool
            if changed {
                updated = location.wasRead
            } else {
                updated = false
            }
            
            return updated
        }
    }
    
    fileprivate struct ScopedLocation: Equatable, Location {
        private(set) var base: AnyLocation<Value>
        var wasRead: Bool
        
        func get() -> Value {
            return base.get()
        }
        
        func set(_ newValue: Value, transaction: Transaction) {
            fatalError("TODO")
        }
        
        func update() -> (Self.Value, Bool) {
            return base.update()
        }
    }
}
