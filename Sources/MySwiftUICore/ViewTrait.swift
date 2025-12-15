// 48526BA25CDCBF890FA91D018A5421B4

struct ViewTraitCollection {
    private var storage: [any AnyViewTrait]
    
    init() {
        storage = []
    }
    
    subscript<Key: _ViewTraitKey>(_ key: Key.Type) -> Key.Value {
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
    subscript<Value>() -> Value { get set }
}

extension ViewTraitCollection {
    fileprivate struct AnyTrait<T: _ViewTraitKey>: AnyViewTrait {
        private var value: T.Value
        
        subscript<Value>() -> Value {
            get {
                fatalError("TODO")
            }
            set {
                fatalError("TODO")
            }
        }
    }
}
