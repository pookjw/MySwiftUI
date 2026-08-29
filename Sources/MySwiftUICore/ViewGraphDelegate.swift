
@_spi(Internal) public protocol ViewGraphDelegate : GraphDelegate {
    nonisolated func `as`<T>(_ type: T.Type) -> T?
    func requestUpdate(after time: Double)
    func setNeedsUpdate()
}
