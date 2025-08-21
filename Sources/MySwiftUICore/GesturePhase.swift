#warning("TODO")

enum GesturePhase<T> {
    case possible(T?)
    case active(T)
    case ended(T)
    case failed
}
