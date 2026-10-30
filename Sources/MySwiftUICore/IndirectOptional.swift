@propertyWrapper
enum IndirectOptional<T> : ExpressibleByNilLiteral {
    indirect case some(T)
    case none
    
    var wrappedValue: T? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    init(_: T) {
        assertUnimplemented()
    }
    
    init(nilLiteral: Void) {
        self = .none
    }
    
    init(wrappedValue: T?) {
        assertUnimplemented()
    }
}

extension IndirectOptional : Equatable where T : Equatable {
    static func == (lhs: IndirectOptional<T>, rhs: IndirectOptional<T>) -> Bool {
        assertUnimplemented()
    }
}

extension IndirectOptional : Hashable where T : Hashable {
    func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
}
