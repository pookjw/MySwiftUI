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
    
    var animationFrameInterval: Double? {
        get {
            return self[AnimationFrameIntervalKey.self]
        }
        set {
            self[AnimationFrameIntervalKey.self] = newValue
        }
        _modify {
            yield &self[AnimationFrameIntervalKey.self]
        }
    }
    
    var _animationFrameInterval: Double? {
        get {
            return self.animationFrameInterval
        }
        set {
            self.animationFrameInterval = newValue
        }
        _modify {
            yield &self.animationFrameInterval
        }
    }
    
    var animationReason: UInt32? {
        get {
            return self[AnimationReasonKey.self]
        }
        set {
            self[AnimationReasonKey.self] = newValue
        }
        _modify {
            yield &self[AnimationReasonKey.self]
        }
    }
    
    var _animationReason: UInt32? {
        get {
            return self.animationReason
        }
        set {
            self.animationReason = newValue
        }
        _modify {
            yield &self.animationReason
        }
    }
}

fileprivate struct AnimationKey : TransactionKey {
    static var defaultValue: Animation? {
        return nil
    }
    
    static func _valuesEqual(_ lhs: Animation?, _ rhs: Animation?) -> Bool {
        assertUnimplemented()
    }
}

fileprivate struct AnimationFrameIntervalKey : TransactionKey {
    static var defaultValue: Double? {
        return nil
    }
    
    static func _valuesEqual(_ lhs: Double?, _ rhs: Double?) -> Bool {
        assertUnimplemented()
    }
}

fileprivate struct AnimationReasonKey : TransactionKey {
    static var defaultValue: UInt32? {
        return nil
    }
    
    static func _valuesEqual(_ lhs: UInt32?, _ rhs: UInt32?) -> Bool {
        assertUnimplemented()
    }
}
