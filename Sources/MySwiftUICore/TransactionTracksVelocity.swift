// FD9125BC1E04E33D1D7BE4A31225AA98
internal import Foundation

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

fileprivate struct TracksVelocityKey : TransactionKey {
    static var defaultValue: Bool {
        return false
    }
}

fileprivate struct VelocityTrackingAnimation : CustomAnimation, Hashable {
    nonisolated func animate<V>(value: V, time: TimeInterval, context: inout AnimationContext<V>) -> V? where V : VectorArithmetic {
        assertUnimplemented()
    }
    
    nonisolated func velocity<V>(value: V, time: TimeInterval, context: AnimationContext<V>) -> V? where V : VectorArithmetic {
        assertUnimplemented()
    }
}

fileprivate struct VelocityState<Value> : AnimationStateKey {
    static var defaultValue: VelocityState<Value> {
        assertUnimplemented()
    }
}
