@propertyWrapper
package class MutableBox<T> {
    package var value: T
    
    @inlinable
    package var wrappedValue: T {
        get {
            value
        }
        set {
            value = newValue
        }
    }
    
    package init(_ value: T) {
        self.value = value
    }
    
    package init(wrappedValue: T) {
        self.value = wrappedValue
    }
}

extension MutableBox: Equatable where T: Equatable {
    package static func ==(lhs: MutableBox<T>, rhs: MutableBox<T>) -> Bool {
        return lhs.value == rhs.value
    }
}
