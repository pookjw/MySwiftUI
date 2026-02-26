
@_spi(Internal) public protocol GraphDelegate: AnyObject {
    func updateGraph<T>(body: (GraphHost) -> T) -> T
    func graphDidChange()
    func preferencesDidChange()
    func beginTransaction()
}
