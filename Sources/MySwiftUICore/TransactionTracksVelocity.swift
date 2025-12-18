// FD9125BC1E04E33D1D7BE4A31225AA98


extension Transaction {
    public var tracksVelocity: Bool {
        get {
            return self[TracksVelocityKey.self]
        }
        set {
            self[TracksVelocityKey.self] = newValue
        }
        _modify {
            yield &self[TracksVelocityKey.self]
        }
    }
}

fileprivate struct TracksVelocityKey: TransactionKey {
    static var defaultValue: Bool {
        return false
    }
    
    static func _valuesEqual(_ lhs: Bool, _ rhs: Bool) -> Bool {
        fatalError("TODO")
    }
}
