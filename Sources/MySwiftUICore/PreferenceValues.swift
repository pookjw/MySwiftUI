#warning("TODO")

package struct PreferenceValues {
    private var entries: [PreferenceValues.Entry] = []
    
    @inlinable
    init() {}
    
    var seed: VersionSeed {
        fatalError("TODO")
    }
    
    package subscript<T: PreferenceKey>(_ key: T.Type) -> Value<T.Value> {
        get {
            if let value = index(of: key).map({ index -> Value<T.Value> in entries[index][] }) {
                return value
            } else {
                return Value(value: T.defaultValue, seed: .empty)
            }
        }
        set {
            fatalError("TODO")
        }
        _modify {
            fatalError("TODO")
        }
    }
    
    package mutating func combine(with values: PreferenceValues) {
        fatalError("TODO")
    }
    
    private func index<T: PreferenceKey>(of key: T.Type) -> Int? {
        let index = _index(of: key.self)
        let count = entries.count
        if index == count {
            return nil
        }
        if entries[index].key != key {
            return nil
        }
        return index
    }
    
    private func _index(of key: (any PreferenceKey.Type)) -> Int {
        var i = 0
        for entry in entries {
            if entry.key == key {
                return i
            }
            i += 1
        }
        return i
    }
}

extension PreferenceValues {
    package struct Value<T> {
        package var value: T
        package var seed: VersionSeed
        
        package init(value: T, seed: VersionSeed) {
            self.value = value
            self.seed = seed
        }
    }
}

extension PreferenceValues {
    fileprivate struct Entry {
        var key: (any PreferenceKey.Type)
        var seed: VersionSeed
        var value: Any
        
        subscript<T>() -> PreferenceValues.Value<T> {
            return PreferenceValues.Value(value: value as! T, seed: seed)
        }
    }
}
