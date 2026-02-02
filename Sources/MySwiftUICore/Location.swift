// 4F21368B1C1680817451AC25B55A8D48
internal import AttributeGraph
private import os.log

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
        return $data.access { value in
            // $s7SwiftUI18StoredLocationBaseC11updateValuexvgxAC4Data33_4F21368B1C1680817451AC25B55A8D48LLVyx_GzXEfU_
            /*
             value -> x26
             */
            // sp + 0x18
            let savedValues = value.savedValues
            // x24
            if let first = savedValues.first {
                return first
            }
            
            // <+204>
            return value.currentValue
        }
    }
    
    final override var wasReed: Bool {
        get {
            fatalError("TODO")
        }
        set {
            _wasRead = newValue
        }
        _modify {
            fatalError("TODO")
        }
    }
    
    init(initialValue: Value) {
        data = StoredLocationBase<Value>.Data(currentValue: initialValue, savedValues: [], cache: LocationProjectionCache())
        _wasRead = false
        super.init()
    }
    
    override final func get() -> Value {
        return data.currentValue
    }
    
    override final func projecting<P>(_ projection: P) -> AnyLocation<P.Projected> where Value == P.Base, P : Projection {
        fatalError("TODO")
    }
    
    override final func set(_ newValue: Value, transaction: Transaction) {
        if isUpdating {
            unsafe os_log(.fault, log: .runtimeIssuesLog, "Modifying state during view update, this will cause undefined behavior.")
        }
        
        // <+140>
        fatalError("TODO")
    }
    
    override func update() -> (Value, Bool) {
        return (updateValue, true)
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
        self.host = host
        self._signal = signal
        super.init(initialValue: initialValue)
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
        var currentValue: Value
        var savedValues: [Value] // 0x1c
        var cache: LocationProjectionCache
    }
}

protocol Projection {
    associatedtype Base
    associatedtype Projected
    
    func get(base: Self.Base) -> Self.Projected
    func set(base: inout Self.Base, newValue: Self.Projected)
}
