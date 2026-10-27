
package enum GesturePhase<T> {
    case possible(T?)
    case active(T)
    case ended(T)
    case failed
}

extension GesturePhase : Equatable where T : Equatable {
}

extension GesturePhase {
    package static var defaultValue: GesturePhase<T> {
        assertUnimplemented()
    }
    
    package var isPossible: Bool {
        assertUnimplemented()
    }
    
    package var isActive: Bool {
        assertUnimplemented()
    }
    
    package var isEnded: Bool {
        assertUnimplemented()
    }
    
    package var isFailed: Bool {
        assertUnimplemented()
    }
    
    package var isTerminal: Bool {
        assertUnimplemented()
    }
    
    package var unwrapped: T? {
        assertUnimplemented()
    }
    
    package var descriptionWithoutValue: String {
        assertUnimplemented()
    }
    
    package func map<U>(_ transform: (T) -> U) -> GesturePhase<U> {
        assertUnimplemented()
    }
    
    package func withValue<U>(_ value: @autoclosure () -> U) -> GesturePhase<U> {
        assertUnimplemented()
    }
    
    package func and<U>(_ other: GesturePhase<U>) -> GesturePhase<(T, U)> {
        assertUnimplemented()
    }
    
    package func and<U>(_ other: GesturePhase<U>) -> GesturePhase<()> {
        assertUnimplemented()
    }
    
    package func and<U, V>(_ other: GesturePhase<U>, value combine: (T, U) -> V) -> GesturePhase<V> {
        assertUnimplemented()
    }
}
