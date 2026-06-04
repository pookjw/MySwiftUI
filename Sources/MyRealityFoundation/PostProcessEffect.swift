public import Metal

@available(iOS 26.0, macOS 26.0, macCatalyst 26.0, tvOS 26.0, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
public protocol PostProcessEffect : Sendable {
    nonisolated mutating func prepare(for device: any MTLDevice)
    
    nonisolated mutating func postProcess(context: borrowing PostProcessEffectContext<any MTLCommandBuffer>)
}

@available(iOS 26.0, macOS 26.0, macCatalyst 26.0, tvOS 26.0, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
extension PostProcessEffect {
    public func prepare(for device: any MTLDevice) {
        assertUnimplemented()
    }
}
