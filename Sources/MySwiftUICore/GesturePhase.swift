
package enum GesturePhase<T> {
    case possible(T?)
    case active(T)
    case ended(T)
    case failed
}

extension GesturePhase : Equatable where T : Equatable {
}
