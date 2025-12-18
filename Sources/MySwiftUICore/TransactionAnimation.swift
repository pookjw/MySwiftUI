// D98E9A1069CEEADA58829ED440E36F30


extension Transaction {
    public var animation: Animation? {
        get {
            return self[AnimationKey.self]
        }
        set {
            self[AnimationKey.self] = newValue
        }
        _modify {
            yield &self[AnimationKey.self]
        }
    }
}

fileprivate struct AnimationKey: TransactionKey {
    static var defaultValue: Animation? {
        return nil
    }
    
    static func _valuesEqual(_ lhs: Animation?, _ rhs: Animation?) -> Bool {
        fatalError("TODO")
    }
}
