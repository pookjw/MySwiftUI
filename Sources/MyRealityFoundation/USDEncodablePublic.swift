@available(macOS 10.15.4, iOS 13.4, macCatalyst 13.4, tvOS 26.0, *)
public protocol __USDEncodablePublic {
    func encode(to encoder: __USDEncoder, at parentPath: __USKObjectPathWrapper) throws -> __USKNodeWrapper
    @available(*, deprecated)
    func encode(to encoder: __USDEncoder, at parentPath: __USKObjectPathWrapper, sceneSpecifier: __USKNodeSpecifierTypeWrapper) throws -> __USKNodeWrapper
}
