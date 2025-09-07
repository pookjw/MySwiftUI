#warning("TODO")
internal import AttributeGraph

package struct PreferencesInputs {
    private var keys: PreferenceKeys
    private var hostKeys: Attribute<PreferenceKeys>
}

struct PreferenceKeys: Equatable, RandomAccessCollection {
    static func == (lhs: PreferenceKeys, rhs: PreferenceKeys) -> Bool {
        fatalError("TODO")
    }
    
    private var keys: [(any PreferenceKey).Type]
    
    init() {
        keys = []
    }
    
    func remove(_ key: any PreferenceKey.Type) {
        fatalError("TODO")
    }
    
    func contains(_ key: any PreferenceKey.Type) -> Bool {
        fatalError("TODO")
    }
    
    func add(_ key: any PreferenceKey.Type) {
        fatalError("TODO")
    }
    
    subscript(_ index: Int) -> any PreferenceKey.Type {
        fatalError("TODO")
    }
    
    var isEmpty: Bool {
        fatalError("TODO")
    }
    
    private func _index(of key: any PreferenceKey.Type) -> Int {
        fatalError("TODO")
    }
    
    var startIndex: Int {
        fatalError("TODO")
    }
    
    var endIndex: Int {
        fatalError("TODO")
    }
    
    func union(_ key: any PreferenceKey.Type) -> any PreferenceKey.Type {
        fatalError("TODO")
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
