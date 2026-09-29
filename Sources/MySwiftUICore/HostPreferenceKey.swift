@_spi(Internal) public protocol HostPreferenceKey : PreferenceKey {
    
}

extension HostPreferenceKey {
    @_spi(Internal) public static var _isReadableByHost: Bool {
        return true
    }
}
