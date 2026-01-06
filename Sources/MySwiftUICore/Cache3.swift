struct Cache3<Key: Equatable, Value> {
    private var store: ((key: Key, value: Value)?, (key: Key, value: Value)?, (key: Key, value: Value)?)
    
    init() {
        store = (nil, nil, nil)
    }
    
    mutating func get(_ key: Key, makeValue: () -> Value) -> Value {
        if let existing = find(key) {
            return existing
        }
        
        let newValue = makeValue()
        put(key, value: newValue)
        return newValue
    }
    
    func find(_ key: Key) -> Value? {
        if let first = store.0, key == first.key {
            return first.value
        }
        if let second = store.1, key == second.key {
            return second.value
        }
        if let third = store.2, key == third.key {
            return third.value
        }
        return nil
    }
    
    mutating func put(_ key: Key, value: Value) {
        store.2 = store.1
        store.1 = store.0
        store.0 = (key, value)
    }
    
    func map(_ transform: (_ incoming: (key: Key, value: Value)?) -> (key: Key, value: Value)?) -> Cache3<Key, Value> {
        var copy = self
        copy.store.0 = transform(copy.store.0)
        copy.store.1 = transform(copy.store.1)
        copy.store.2 = transform(copy.store.2)
        return copy
    }
}
