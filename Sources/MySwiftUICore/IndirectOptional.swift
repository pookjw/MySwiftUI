@propertyWrapper
enum IndirectOptional<T> : ExpressibleByNilLiteral {
    indirect case some(T)
    case none
    
    var wrappedValue: T? {
        get {
            switch self {
            case .some(let value):
                return value
            case .none:
                return nil
            }
        }
        set {
            if let newValue {
                self = .some(newValue)
            } else {
                self = .none
            }
        }
    }
    
    init(_ value: T) {
        self = .some(value)
    }
    
    init(nilLiteral: Void) {
        self = .none
    }
    
    init(wrappedValue: T?) {
        if let wrappedValue {
            self = .some(wrappedValue)
        } else {
            self = .none
        }
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
