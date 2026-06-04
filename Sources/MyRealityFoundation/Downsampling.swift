public import Metal

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __Downsampling {
    public struct Factor : Sendable {
        public init(mipmapOffset: Int) {
            assertUnimplemented()
        }
        
        public init(value: Int) {
            assertUnimplemented()
        }
    }
    
    public enum Resolution : Sendable {
        case noDownsampling
        case downsampling(factors: [__Downsampling.Factor])
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __Downsampling {
    public struct Minimal : __DownsamplingStrategy {
        public init() {
            assertUnimplemented()
        }
        
        public func resolve(_ descriptors: [MTLTextureDescriptor]) throws -> __Downsampling.Resolution {
            assertUnimplemented()
        }
    }
    
    public struct SkipHighResolution : __DownsamplingStrategy {
        public init(_ skipHighResolutionMipmapCount: Int = 1) {
            assertUnimplemented()
        }
        
        public func resolve(_ descriptors: [MTLTextureDescriptor]) throws -> __Downsampling.Resolution {
            assertUnimplemented()
        }
    }
    
    public typealias ByteSize = UInt64
    
    public enum Error : Swift.Error, CustomDebugStringConvertible {
        case noSufficientDownsamplingStrategy(budget: __Downsampling.ByteSize, minimalSize: __Downsampling.ByteSize)
        
        public var debugDescription: String {
            get {
                assertUnimplemented()
            }
        }
    }
    
    public struct Budgeted : __DownsamplingStrategy {
        public init(availableBytes: __Downsampling.ByteSize, device: any MTLDevice) {
            assertUnimplemented()
        }
        
        public func resolve(_ descriptors: [MTLTextureDescriptor]) throws -> __Downsampling.Resolution {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __Downsampling {
    public static func getMipmapByteSizes(_ descriptor: MTLTextureDescriptor, device: any MTLDevice) -> [__Downsampling.ByteSize] {
        assertUnimplemented()
    }
}
