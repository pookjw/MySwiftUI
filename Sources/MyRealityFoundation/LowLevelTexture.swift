public import Metal

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
@MainActor public class LowLevelTexture {
    @MainActor final public let descriptor: LowLevelTexture.Descriptor = {
        assertUnimplemented()
    }()
    
    public struct Descriptor {
        public init(textureType: MTLTextureType = .type2D, pixelFormat: MTLPixelFormat = .invalid, width: Int = 0, height: Int = 0, depth: Int = 1, mipmapLevelCount: Int = 1, arrayLength: Int = 1, textureUsage: MTLTextureUsage = .unknown, swizzle: MTLTextureSwizzleChannels = .init(red: .red, green: .green, blue: .blue, alpha: .alpha)) {
            assertUnimplemented()
        }
        
        public var textureType: MTLTextureType
        
        public var pixelFormat: MTLPixelFormat
        
        public var width: Int
        
        public var height: Int
        
        public var depth: Int
        
        public var mipmapLevelCount: Int
        
        public var arrayLength: Int
        
        public var textureUsage: MTLTextureUsage
        
        public var swizzle: MTLTextureSwizzleChannels
    }
    
    @MainActor public init(descriptor: LowLevelTexture.Descriptor) throws {
        assertUnimplemented()
    }
    
    @MainActor public func read() -> any MTLTexture {
        assertUnimplemented()
    }
    
    @MainActor public func replace(using commandBuffer: any MTLCommandBuffer) -> any MTLTexture {
        assertUnimplemented()
    }
    }

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension LowLevelTexture : Sendable {}
