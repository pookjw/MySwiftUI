// 4F21368B1C1680817451AC25B55A8D48
package import AttributeGraph
private import os.log
private import _MySwiftUIShims

package class StoredLocationBase<Value>: AnyLocation<Value> {
    @AtomicBox private var data: StoredLocationBase<Value>.Data
    private var _wasRead: Bool
    
    final func invalidate() {
        $data.access { value in
            value.cache.reset()
        }
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
    
    override final var wasRead: Bool {
        get {
            return _wasRead
        }
        set {
            _wasRead = newValue
        }
        _modify {
            yield &_wasRead
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
        guard !isUpdating else {
            unsafe os_log(.fault, log: .runtimeIssuesLog, "Modifying state during view update, this will cause undefined behavior.")
            return
        }
        
        // <+140>
        if isValid {
            // <+160>
            // sp + 0xc
            let updated = $data.access { value in
                // $s7SwiftUI18StoredLocationBaseC3set_11transactionyx_AA11TransactionVtFSbAC4Data33_4F21368B1C1680817451AC25B55A8D48LLVyx_GzXEfU0_
                /*
                 value -> x24
                 newValue -> x23 -> sp + 0x28
                 Value -> x22 -> sp + 0x20
                 */
                let isEqual = compareValues(value.currentValue, newValue, options: [.unknown0, .unknown1])
                if isEqual {
                    // <+160>
                    if isLinkedOnOrAfter(.v7) {
                        value.currentValue = newValue
                    }
                    return false
                } else {
                    // <+264>
                    // x26
                    let copy_1 = value.currentValue
                    value.savedValues.append(copy_1)
                    value.currentValue = newValue
                    return true
                }
            }
            
            guard updated else {
                // <+492>
                return
            }
            
            // x21
            let transaction = Transaction.current
            // sp + 0xc
            let transactionID = Transaction.ID(value: _threadTransactionID(false))
            let beginUpdate = StoredLocationBase.BeginUpdate(box: self)
            commit(transaction: transaction, id: transactionID, mutation: beginUpdate)
        } else {
            // <+392>
            $data.access { value in
                // $s7SwiftUI18StoredLocationBaseC3set_11transactionyx_AA11TransactionVtFyAC4Data33_4F21368B1C1680817451AC25B55A8D48LLVyx_GzXEfU_
                value.currentValue = newValue
                value.savedValues.removeAll(keepingCapacity: false)
            }
        }
        
        // +492>
    }
    
    override func update() -> (Value, Bool) {
        return (updateValue, true)
    }
    
    package final var binding: Binding<Value> {
        return Binding(value: updateValue, location: self)
    }
    
    fileprivate var isUpdating: Bool {
        fatalError("TODO")
    }
    
    fileprivate func commit(transaction: Transaction, id: Transaction.ID, mutation: StoredLocationBase<Value>.BeginUpdate) {
        fatalError() // abstract
    }
    
    fileprivate func notifyObservers() {
        fatalError() // abstract
    }
    
    fileprivate var isValid: Bool {
        fatalError() // abstract
    }
    
    fileprivate final func beginUpdate() {
        $data.access { value in
            value.savedValues.removeFirst()
        }
        
        notifyObservers()
    }
}

package final class StoredLocation<Value>: StoredLocationBase<Value> {
    private weak var host: GraphHost?
    @WeakAttribute private var signal: Void?
    
    package init(initialValue: Value, host: GraphHost?, signal: WeakAttribute<()>) {
        self.host = host
        self._signal = signal
        super.init(initialValue: initialValue)
    }
    
    override func update() -> (Value, Bool) {
        // x21
        let changed: Bool
        if let attribute = $signal {
            changed = attribute.changedValue(options: []).changed
        } else {
            self.wasRead = true
            changed = true
        }
        
        return (updateValue, changed)
    }
    
    fileprivate override var isValid: Bool {
        guard let host else {
            return false
        }
        
        return host.isValid
    }
    
    fileprivate override var isUpdating: Bool {
        guard let host else {
            return false
        }
        
        return host.isUpdating
    }
    
    fileprivate override func commit(transaction: Transaction, id: Transaction.ID, mutation: StoredLocationBase<Value>.BeginUpdate) {
        guard let host else {
            return
        }
        
        host.asyncTransaction(transaction, id: id, mutation: mutation, style: .deferred, mayDeferUpdate: true)
    }
    
    fileprivate override func notifyObservers() {
        guard let attribute = $signal?.identifier else {
            return
        }
        
        attribute.invalidate()
    }
}

extension StoredLocationBase {
    fileprivate struct BeginUpdate: GraphMutation {
        private(set) weak var box: StoredLocationBase<Value>?
        
        func apply() {
            guard let box else {
                return
            }
            
            box.beginUpdate()
        }
        
        func combine<T>(with other: T) -> Bool where T : GraphMutation {
            fatalError("TODO")
        }
    }
    
    fileprivate struct Data {
        var currentValue: Value
        var savedValues: [Value] // 0x1c
        var cache: LocationProjectionCache
    }
}
