// 48526BA25CDCBF890FA91D018A5421B4

struct ViewTraitCollection {
    private var storage: [any AnyViewTrait]
    
    init() {
        storage = []
    }
    
    subscript<Key: _ViewTraitKey>(_ key: Key.Type) -> Key.Value {
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
            fatalError("TODO")
        }
    }
    
    func value<Key: _ViewTraitKey>(for key: Key.Type, defaultValue: Key.Value) -> Key.Value {
        fatalError("TODO")
    }
    
    func value<Key: _ViewTraitKey>(for key: Key.Type) -> Key.Value {
        fatalError("TODO")
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
            fatalError("TODO")
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
    fileprivate struct AnyTrait<T: _ViewTraitKey>: AnyViewTrait {
        private var value: T.Value
        
        @inline(__always)
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
