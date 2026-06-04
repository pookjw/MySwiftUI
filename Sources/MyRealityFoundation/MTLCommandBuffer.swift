public import Metal

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension MTLCommandBuffer {
    public func present(_ drawable: TextureResource.Drawable) {
        assertUnimplemented()
    }
}
