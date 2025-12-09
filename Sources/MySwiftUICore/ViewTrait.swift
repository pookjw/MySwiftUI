// 48526BA25CDCBF890FA91D018A5421B4

struct ViewTraitCollection {
    private var storage: [any AnyViewTrait]
    
    init() {
        storage = []
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
}

extension ViewTraitCollection {
    fileprivate struct AnyTrait<T: _ViewTraitKey>: AnyViewTrait {
        private var value: T.Value
    }
}
