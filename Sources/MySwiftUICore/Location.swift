package protocol Location: Equatable {
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
open class AnyLocationBase: @unchecked Sendable {}

@_documentation(visibility: private)
open class AnyLocation<Value>: AnyLocationBase, @unchecked Sendable {
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
    
    func projecting<P: Projection>(_ projection: P) -> AnyLocation<P.Projected> where Value == P.Base {
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

extension AnyLocation: Equatable {
    public static func == (lhs: AnyLocation<Value>, rhs: AnyLocation<Value>) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}

protocol Projection {
    associatedtype Base
    associatedtype Projected
    
    func get(base: Self.Base) -> Self.Projected
    func set(base: inout Self.Base, newValue: Self.Projected)
}
