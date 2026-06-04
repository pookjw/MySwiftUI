public import Metal
public import CoreGraphics
public import simd

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public struct MaterialParameters {
    public struct Texture {
        public struct Sampler {
            public init() {
                assertUnimplemented()
            }
            
            public init(_ v: MTLSamplerDescriptor) {
                assertUnimplemented()
            }
            
            public mutating func modify<R>(_ closure: (MTLSamplerDescriptor) throws -> R) rethrows -> R {
                assertUnimplemented()
            }
            
            public func access<R>(_ closure: (MTLSamplerDescriptor) throws -> R) rethrows -> R {
                assertUnimplemented()
            }
        }
        
        public var resource: TextureResource
        
        public var sampler: MaterialParameters.Texture.Sampler {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var uvIndex: Int
        
        @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, *)
        public var swizzle: MTLTextureSwizzleChannels
        
        public init(_ resource: TextureResource, sampler: MaterialParameters.Texture.Sampler) {
            assertUnimplemented()
        }
        
        public init(_ resource: TextureResource) {
            assertUnimplemented()
        }
    }
    
    @available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
    public struct Handle {
    }
    
    @available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
    public enum Value {
        @available(visionOS 2.0, *)
        case texture(MaterialParameters.Texture)
        case textureResource(TextureResource)
        case float(Float)
        case simd2Float(SIMD2<Float>)
        case simd3Float(SIMD3<Float>)
        case simd4Float(SIMD4<Float>)
        case color(CGColor)
        case float2x2(float2x2)
        case float3x3(float3x3)
        case float4x4(float4x4)
        case bool(Bool)
        case int(Int32)
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension MaterialParameters.Value : Equatable {
    public static func == (a: MaterialParameters.Value, b: MaterialParameters.Value) -> Bool {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension MaterialParameters.Texture : Equatable {
    public static func == (lhs: MaterialParameters.Texture, rhs: MaterialParameters.Texture) -> Bool {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension MaterialParameters.Texture.Sampler : Equatable {
    public static func == (a: MaterialParameters.Texture.Sampler, b: MaterialParameters.Texture.Sampler) -> Bool {
        assertUnimplemented()
    }
}

@available(visionOS 26.0, macOS 26.0, iOS 26.0, macCatalyst 26.0, tvOS 26.0, *)
extension MaterialParameters.Handle : Hashable, Equatable {
    public static func == (lhs: MaterialParameters.Handle, rhs: MaterialParameters.Handle) -> Bool {
        assertUnimplemented()
    }
    
    public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    public var hashValue: Int {
        get {
            assertUnimplemented()
        }
    }
}
