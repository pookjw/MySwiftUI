struct Indirect<T> {
    var box: MutableBox<T>
    
    init(_ value: T) {
        assertUnimplemented()
    }
    
    init(wrappedValue: T) {
        assertUnimplemented()
    }
    
    var value: T {
        get { assertUnimplemented() }
        set { assertUnimplemented() }
    }
    
    var wrappedValue: T {
        get { assertUnimplemented() }
        set { assertUnimplemented() }
    }
}

extension Indirect: Equatable where T: Equatable {
    static func == (lhs: Indirect, rhs: Indirect) -> Bool {
        assertUnimplemented()
    }
}
