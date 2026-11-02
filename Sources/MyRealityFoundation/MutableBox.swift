final class MutableBox<T> {
    var value: T
    
    init(_ value: T) {
        self.value = value
    }
}

extension MutableBox : Equatable where T : Equatable {
    static func ==(lhs: MutableBox<T>, rhs: MutableBox<T>) -> Bool {
        return lhs.value == rhs.value
    }
}
