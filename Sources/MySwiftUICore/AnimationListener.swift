// 390609F81ACEBEAF00AD8179BD31E870

extension Transaction {
    var animationListener: AnimationListener? {
        return self[AnimationListenerKey.self]
    }
    
    var animationLogicalListener: AnimationListener? {
        return self[AnimationLogicalListenerKey.self]
    }
    
    fileprivate struct AnimationListenerKey : TransactionKey {
        static var defaultValue: AnimationListener? {
            return nil
        }
        
        static func _valuesEqual(_ lhs: AnimationListener?, _ rhs: AnimationListener?) -> Bool {
            assertUnimplemented()
        }
    }
    
    fileprivate struct AnimationLogicalListenerKey : TransactionKey {
        static var defaultValue: AnimationListener? {
            return nil
        }
        
        static func _valuesEqual(_ lhs: AnimationListener?, _ rhs: AnimationListener?) -> Bool {
            assertUnimplemented()
        }
    }
}

class AnimationListener {
    init() {}
    
    func animationWasAdded() {}
    func animationWasRemoved() {}
    func finalizeTransaction() {}
}
