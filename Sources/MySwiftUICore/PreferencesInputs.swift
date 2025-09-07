#warning("TODO")
internal import AttributeGraph

package struct PreferencesInputs {
    private var keys: PreferenceKeys
    private var hostKeys: Attribute<PreferenceKeys>
}

struct PreferenceKeys: Equatable, RandomAccessCollection {
    static func == (lhs: PreferenceKeys, rhs: PreferenceKeys) -> Bool {
        let lhsKeys = lhs.keys
        let rhsKeys = rhs.keys
        let lhsCount = lhsKeys.count
        let rhsCount = rhsKeys.count
        
        guard lhsCount == rhsCount else {
            return false
        }
        
        for i in 0..<lhsCount {
            if lhsKeys[i] != rhsKeys[i] {
                return false
            }
        }
        
        return true
    }
    
    private var keys: [any (PreferenceKey).Type]
    
    init() {
        keys = []
    }
    
    private init (keys: [any (PreferenceKey).Type]) {
        self.keys = keys
    }
    
    mutating func remove(_ key: any (PreferenceKey).Type) {
        let index = _index(of: key)
        guard index != count else {
            return
        }
        
        keys.remove(at: index)
    }
    
    func contains(_ key: any (PreferenceKey).Type) -> Bool {
        let index = _index(of: key)
        let count = count
        if index == count {
            return false
        } else if (index < count) {
            return true
        } else {
            abort()
        }
    }
    
    mutating func add(_ key: any (PreferenceKey).Type) {
        guard !contains(key) else {
            return
        }
        keys.append(key)
    }
    
    subscript(_ index: Int) -> any (PreferenceKey).Type {
        return keys[index]
    }
    
    var isEmpty: Bool {
        return keys.isEmpty
    }
    
    private func _index(of key: any (PreferenceKey).Type) -> Int {
        let keys = keys
        let count = keys.count
        guard count > 0 else {
            return 0
        }
        
        var result = 0
        for _ in 0..<count {
            if keys[result] == key {
                return result
            }
            result += 1
        }
        
        return result
    }
    
    var startIndex: Int {
        return 0
    }
    
    var endIndex: Int {
        return keys.count
    }
    
    func union(_ other: PreferenceKeys) -> PreferenceKeys {
        // x21
        let otherKeys = other.keys
        // x26
        let selfKeys = self.keys
        
        // x24
        let selfCount = selfKeys.count
        // x23
        let otherCount = otherKeys.count
        
        var results: [any (PreferenceKey).Type] = []
        results.reserveCapacity(Swift.max(selfCount, otherCount))
        
        if selfCount == 0 {
            results.append(contentsOf: otherKeys)
        } else {
            results.append(contentsOf: selfKeys)
            
            for otherKey in otherKeys {
                if !results.contains(where: { $0 == otherKey }) {
                    results.append(otherKey)
                }
            }
        }
        
        return PreferenceKeys(keys: results)
    }
}

package protocol PreferenceKey {
    associatedtype Value
    
    static var defaultValue: Value {
        get
    }
}

extension PreferenceKey {
    // TODO
    
    static var _isReadableByHost: Bool {
        return false
    }
}

extension PreferenceKey where Value: ExpressibleByNilLiteral {
    package static var defaultValue: Value {
        return nil
    }
}
