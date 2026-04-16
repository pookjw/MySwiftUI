// 48526BA25CDCBF890FA91D018A5421B4

struct ViewTraitCollection {
    private var storage: [any AnyViewTrait]
    
    init() {
        storage = []
    }
    
    subscript<Key : _ViewTraitKey>(_ key: Key.Type) -> Key.Value {
        get {
            return value(for: key)
        }
        set {
            for (index, trait) in storage.enumerated() {
                if trait.keyType == key {
                    storage[index][] = newValue
                    return
                }
            }
            
            storage.append(Self.AnyTrait<Key>(value: newValue))
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    func value<Key : _ViewTraitKey>(for key: Key.Type, defaultValue: Key.Value) -> Key.Value {
        for trait in storage {
            if trait.keyType == key {
                return trait[]
            }
        }
        return defaultValue
    }
    
    func value<Key : _ViewTraitKey>(for key: Key.Type) -> Key.Value {
        return value(for: key, defaultValue: Key.defaultValue)
    }
    
    mutating func setValueIfUnset<Key : _ViewTraitKey>(_ value: Key.Value, for key: Key.Type) {
        for _value in self.storage {
            if _value.keyType == Key.self {
                return
            }
        }
        
        self.storage.append(Self.AnyTrait<Key>(value: value))
    }
    
    mutating func setTagIfUnset<Value : Hashable>(for type: Value.Type, value: Value) {
        self.setValueIfUnset(.tagged(value), for: TagValueTraitKey<Value>.self)
    }
}

extension ViewTraitCollection {
    var canTransition: Bool {
        get {
            return value(for: CanTransitionTraitKey.self, defaultValue: false)
        }
        set {
            self[CanTransitionTraitKey.self] = newValue
        }
        _modify {
            assertUnimplemented()
        }
    }
}

struct ViewTraitKeys {
    private var types: Set<ObjectIdentifier>
    private var isDataDependent: Bool
    
    init() {
        types = []
        isDataDependent = false
    }
}

public protocol _ViewTraitKey {
    associatedtype Value
    static var defaultValue: Self.Value { get }
}

fileprivate protocol AnyViewTrait {
    // 이름 정확하지 않음
    var keyType: any _ViewTraitKey.Type { get }
    subscript<Value>() -> Value { get set }
}

extension ViewTraitCollection {
    fileprivate struct AnyTrait<T : _ViewTraitKey>: AnyViewTrait {
        private var value: T.Value
        
        @inline(always)
        init(value: T.Value) {
            self.value = value
        }
        
        var keyType: any _ViewTraitKey.Type {
            return T.self
        }
        
        subscript<Value>() -> Value {
            get {
                return value as! Value
            }
            set {
                value = newValue as! T.Value
            }
        }
    }
}

@usableFromInline
package struct TagValueTraitKey<V> : _ViewTraitKey where V : Hashable {
    @usableFromInline
    @frozen package enum Value {
        case untagged
        case tagged(V)
    }
    
    @inlinable package static var defaultValue: TagValueTraitKey<V>.Value {
        get { .untagged }
    }
}

@available(*, unavailable)
extension TagValueTraitKey.Value : Sendable {
}
@available(*, unavailable)
extension TagValueTraitKey : Sendable {
}
