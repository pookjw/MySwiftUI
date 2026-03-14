package struct WeakUncheckedSendable<T: AnyObject>: @unchecked Sendable {
    package weak var value: T?
    
    package init(_ value: T) {
        self.value = value
    }
}
