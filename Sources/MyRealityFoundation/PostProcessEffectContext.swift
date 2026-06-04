public import Foundation
public import Metal
public import simd

@available(iOS 26.0, macOS 26.0, macCatalyst 26.0, tvOS 26.0, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
public struct PostProcessEffectContext<CommandBuffer> : ~Copyable {
    public var device: any MTLDevice
    
    public var commandBuffer: CommandBuffer
    
    public var sourceColorTexture: any MTLTexture
    
    public var sourceDepthTexture: any MTLTexture
    
    public var targetColorTexture: any MTLTexture
    
    public var projection: float4x4
    
    public var time: TimeInterval
}
