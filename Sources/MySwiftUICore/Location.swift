// 4F21368B1C1680817451AC25B55A8D48
internal import AttributeGraph

package protocol Location {
    associatedtype Value
}

@_documentation(visibility: private)
open class AnyLocationBase: @unchecked Sendable {}

@_documentation(visibility: private)
open class AnyLocation<Value>: AnyLocationBase, @unchecked Sendable {
    var wasReed: Bool {
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
        fatalError() // abstract
    }
    
    override init() {
        super.init()
    }
}

extension AnyLocation: Equatable {
    public static func == (lhs: AnyLocation<Value>, rhs: AnyLocation<Value>) -> Bool {
        fatalError("TODO")
    }
}

class StoredLocationBase<Value>: AnyLocation<Value> {
    @AtomicBox private var data: StoredLocationBase<Value>.Data
    private var _wasRead: Bool
    
    final func invalidate() {
        fatalError("TODO")
    }
    
    final var updateValue: Value {
        fatalError("TODO")
    }
    
    final override var wasReed: Bool {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
        _modify {
            fatalError("TODO")
        }
    }
    
    init(initialValue: Value) {
        fatalError("TODO")
    }
    
    override final func get() -> Value {
        fatalError("TODO")
    }
    
    override final func projecting<P>(_ projection: P) -> AnyLocation<P.Projected> where Value == P.Base, P : Projection {
        fatalError("TODO")
    }
    
    override final func set(_ newValue: Value, transaction: Transaction) {
        fatalError("TODO")
    }
    
    override func update() -> (Value, Bool) {
        fatalError("TODO")
    }
    
    final var binding: Binding<Value> {
        fatalError("TODO")
    }
    
    fileprivate var isUpdating: Bool {
        fatalError("TODO")
    }
    
    fileprivate func commit(transaction: Transaction, id: Transaction.ID, mutation: StoredLocationBase<Value>.BeginUpdate) {
        fatalError("TODO")
    }
    
    fileprivate func notifyObservers() {
        fatalError("TODO")
    }
}

final class StoredLocation<Value>: StoredLocationBase<Value> {
    private weak var host: GraphHost?
    @WeakAttribute private var signal: Void?
    
    init(initialValue: Value, host: GraphHost?, signal: WeakAttribute<()>) {
        fatalError("TODO")
    }
    
    override func update() -> (Value, Bool) {
        fatalError("TODO")
    }
    
    fileprivate var isValid: Bool {
        fatalError("TODO")
    }
    
    fileprivate override var isUpdating: Bool {
        fatalError("TODO")
    }
    
    fileprivate override func commit(transaction: Transaction, id: Transaction.ID, mutation: StoredLocationBase<Value>.BeginUpdate) {
        fatalError("TODO")
    }
    
    fileprivate override func notifyObservers() {
        fatalError("TODO")
    }
}

extension StoredLocationBase {
    fileprivate struct BeginUpdate {
        private weak var box: StoredLocationBase<Value>?
    }
    
    fileprivate struct Data {
        private var currentValue: Value
        private var savedValues: [Value]
        private var cache: LocationProjectionCache
    }
}

protocol Projection {
    associatedtype Base
    associatedtype Projected
    
    func get(base: Self.Base) -> Self.Projected
    func set(base: inout Self.Base, newValue: Self.Projected)
}
