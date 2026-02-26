
@_spi(Internal) public protocol ViewGraphDelegate: GraphDelegate {
    func `as`<T>(_ type: T.Type) -> T?
    func requestUpdate(after time: Double)
    func setNeedsUpdate()
}
