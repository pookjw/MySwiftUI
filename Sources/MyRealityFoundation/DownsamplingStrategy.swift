public import Metal

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public protocol __DownsamplingStrategy {
    func resolve(_ descriptors: [MTLTextureDescriptor]) throws -> __Downsampling.Resolution
}
