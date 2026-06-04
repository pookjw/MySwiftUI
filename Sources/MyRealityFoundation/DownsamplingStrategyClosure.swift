public import Metal

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __DownsamplingStrategyClosure : __DownsamplingStrategy {
    public func resolve(_ descriptors: [MTLTextureDescriptor]) throws -> __Downsampling.Resolution {
        assertUnimplemented()
    }
}
