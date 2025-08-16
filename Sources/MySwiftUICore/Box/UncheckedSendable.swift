package struct UncheckedSendable<T>: @unchecked Sendable {
    package var value: T
    
    package init(_ value: T) {
        self.value = value
    }
}

extension UncheckedSendable: Equatable where T: Equatable {}
extension UncheckedSendable: Hashable where T: Hashable {}
