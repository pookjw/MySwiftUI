final class MutableBox<T> {
    var value: T
    
    @inline(__always) // 원래 없음
    init(value: T) {
        self.value = value
    }
}

extension MutableBox where T : Equatable {
    static func ==(lhs: MutableBox<T>, rhs: MutableBox<T>) -> Bool {
        return lhs.value == rhs.value
    }
}
