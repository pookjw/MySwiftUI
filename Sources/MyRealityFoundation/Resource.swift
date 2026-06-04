@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@preconcurrency public protocol Resource : Sendable {
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Resource {
    public static func __fromCore(_ coreAsset: __AssetRef) -> Self {
        assertUnimplemented()
    }
}
