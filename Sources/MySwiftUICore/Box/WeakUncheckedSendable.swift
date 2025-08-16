package struct WeakUncheckedSendable<T>: @unchecked Sendable {
    package var value: T?
    
    package init(_ value: T) {
        self.value = value
    }
}
