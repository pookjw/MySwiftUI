package protocol Location : Equatable {
    associatedtype Value
    
    var wasRead: Bool {
        get set
    }
    
    func get() -> Self.Value
    mutating func set(_ newValue: Self.Value, transaction: Transaction)
    func update() -> (Self.Value, Bool)
}

extension Location {
    package func update() -> (Self.Value, Bool) {
        return (get(), true)
    }
}

@_documentation(visibility: private)
open class AnyLocationBase : @unchecked Sendable {
    deinit {
        assertUnimplemented()
    }
}

@_documentation(visibility: private)
open class AnyLocation<Value> : AnyLocationBase, @unchecked Sendable {
    deinit {
        assertUnimplemented()
    }
    
    var wasRead: Bool {
        get {
            fatalError() // abstract
        }
        set {
            fatalError() // abstract
        }
        _modify {
            fatalError() // abstract
        }
    }
    
    func get() -> Value {
        fatalError() // abstract
    }
    
    func set(_ newValue: Value, transaction: Transaction) {
        fatalError() // abstract
    }
    
    func projecting<P : Projection>(_ projection: P) -> AnyLocation<P.Projected> where Value == P.Base {
        fatalError() // abstract
    }
    
    func update() -> (Value, Bool) {
        fatalError() // abstract
    }
    
    func isEqual(to other: AnyLocation<Value>) -> Bool {
        return self === other
    }
    
    override init() {
        super.init()
    }
}

extension AnyLocation : Equatable {
    public static func == (lhs: AnyLocation<Value>, rhs: AnyLocation<Value>) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

package protocol Projection : Hashable {
    associatedtype Base
    associatedtype Projected
    
    func get(base: Self.Base) -> Self.Projected
    func set(base: inout Self.Base, newValue: Self.Projected)
}

extension Projection {
    package func composed<Other : Projection>(with other: Other) -> ComposedProjection<Self, Other> where Projected == Other.Base {
        assertUnimplemented()
    }
}

package struct ComposedProjection<First : Projection, Second : Projection> : Projection, Hashable, Equatable where First.Projected == Second.Base {
    package func get(base: First.Base) -> Second.Projected {
        assertUnimplemented()
    }
    
    package func set(base: inout First.Base, newValue: Second.Projected) {
        assertUnimplemented()
    }
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        assertUnimplemented()
    }
    
    public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
}

extension Binding {
    package func projecting<T : Projection>(_ base: T) -> Binding<T.Projected> where Value == T.Base {
        let projected = base.get(base: self._value)
        let location = self.location.projecting(base)
        
        return Binding<T.Projected>(
            value: projected,
            location: location,
            transaction: self.transaction
        )
    }
}
