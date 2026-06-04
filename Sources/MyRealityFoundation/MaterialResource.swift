public import Metal

@_hasMissingDesignatedInitializers @available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public class __MaterialResource {
    public var __coreAsset: __AssetRef {
        get {
            assertUnimplemented()
        }
    }
    
    public var name: String {
        get {
            assertUnimplemented()
        }
    }
    
    public var cullMode: MTLCullMode? {
        get {
            assertUnimplemented()
        }
    }
    
    @available(visionOS, deprecated: 2.0, message: "Loading JSON based material assets is no longer supported. Please use our public material APIs instead.")
    @available(macOS, deprecated: 15.0, message: "Loading JSON based material assets is no longer supported. Please use our public material APIs instead.")
    @available(macCatalyst, deprecated: 18.0, message: "Loading JSON based material assets is no longer supported. Please use our public material APIs instead.")
    @available(iOS, deprecated: 18.0, message: "Loading JSON based material assets is no longer supported. Please use our public material APIs instead.")
    @available(tvOS, unavailable)
    public static func __load(named name: String, in bundle: Bundle? = nil) throws -> any Material {
        assertUnimplemented()
    }
    
    @available(visionOS, deprecated: 2.0, message: "Loading JSON based material assets is no longer supported. Please use our public material APIs instead.")
    @available(macOS, deprecated: 15.0, message: "Loading JSON based material assets is no longer supported. Please use our public material APIs instead.")
    @available(macCatalyst, deprecated: 18.0, message: "Loading JSON based material assets is no longer supported. Please use our public material APIs instead.")
    @available(iOS, deprecated: 18.0, message: "Loading JSON based material assets is no longer supported. Please use our public material APIs instead.")
    @available(tvOS, unavailable)
    public static func loadAsync(named name: String, in bundle: Bundle? = nil) -> LoadRequest<any Material> {
        assertUnimplemented()
    }
    
    public struct BuildParameters {
        public enum Value : Hashable {
            case bool(Bool)
            case int(Int)
            case float(Float)
            case simd2Float(SIMD2<Float>)
            case simd3Float(SIMD3<Float>)
            case simd4Float(SIMD4<Float>)
            
            public var asString: String {
                get {
                    assertUnimplemented()
                }
            }
            
            public static func == (a: __MaterialResource.BuildParameters.Value, b: __MaterialResource.BuildParameters.Value) -> Bool {
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
        
        public var materialDefinition: __REAsset?
        
        public var functionConstants: [String : __MaterialResource.BuildParameters.Value]
        
        public var cullMode: MTLCullMode?
        
        public var passthroughBlur: Bool?
        
        public var vcaBlur: Bool?
        
        public var multiUVs: Bool?
        
        public var needsVisualDepthTexture: Bool?
        
        public var failIfNotPrecompiled: Bool?
        
        public var materialTextureParameterBindings: [String : String]
        
        public var materialBufferParameterBindings: [String : String]
        
        public init(materialDefinition: __REAsset? = nil, functionConstants: [String : __MaterialResource.BuildParameters.Value] = [:]) {
            assertUnimplemented()
        }
    }
    
    @available(visionOS, deprecated: 2.0, message: "Manually building material assets is no longer supported. Please use our public material APIs instead.")
    @available(macOS, deprecated: 15.0, message: "Manually building material assets is no longer supported. Please use our public material APIs instead.")
    @available(macCatalyst, deprecated: 18.0, message: "Manually building material assets is no longer supported. Please use our public material APIs instead.")
    @available(iOS, deprecated: 18.0, message: "Manually building material assets is no longer supported. Please use our public material APIs instead.")
    @available(tvOS, unavailable)
    public static func load(_ params: __MaterialResource.BuildParameters, services: __ServiceLocator = .shared) throws -> any Material {
        assertUnimplemented()
    }
    
    @available(visionOS, deprecated: 2.0, message: "Loading JSON based material assets is no longer supported. Please use our public material APIs instead.")
    @available(macOS, deprecated: 15.0, message: "Loading JSON based material assets is no longer supported. Please use our public material APIs instead.")
    @available(macCatalyst, deprecated: 18.0, message: "Loading JSON based material assets is no longer supported. Please use our public material APIs instead.")
    @available(iOS, deprecated: 18.0, message: "Loading JSON based material assets is no longer supported. Please use our public material APIs instead.")
    @available(tvOS, unavailable)
    public static func loadAsync(_ params: __MaterialResource.BuildParameters, services: __ServiceLocator = .shared) -> LoadRequest<any Material> {
        assertUnimplemented()
    }
    
    @available(visionOS, deprecated: 2.0, message: "Loading JSON based material assets is no longer supported. Please use our public material APIs instead.")
    @available(macOS, deprecated: 15.0, message: "Loading JSON based material assets is no longer supported. Please use our public material APIs instead.")
    @available(macCatalyst, deprecated: 18.0, message: "Loading JSON based material assets is no longer supported. Please use our public material APIs instead.")
    @available(iOS, deprecated: 18.0, message: "Loading JSON based material assets is no longer supported. Please use our public material APIs instead.")
    @available(tvOS, unavailable)
    public static func load(named name: String, in file: URL, services: __ServiceLocator = .shared) throws -> any Material {
        assertUnimplemented()
    }
    
    @available(visionOS, deprecated: 2.0, message: "Loading JSON based material assets is no longer supported. Please use our public material APIs instead.")
    @available(macOS, deprecated: 15.0, message: "Loading JSON based material assets is no longer supported. Please use our public material APIs instead.")
    @available(macCatalyst, deprecated: 18.0, message: "Loading JSON based material assets is no longer supported. Please use our public material APIs instead.")
    @available(iOS, deprecated: 18.0, message: "Loading JSON based material assets is no longer supported. Please use our public material APIs instead.")
    @available(tvOS, unavailable)
    public static func loadAsync(named name: String, in file: URL, services: __ServiceLocator = .shared) -> LoadRequest<any Material> {
        assertUnimplemented()
    }
    }

@available(macOS 13.0, iOS 16.0, macCatalyst 16.0, tvOS 26.0, *)
extension __MaterialResource : Resource, @unchecked Sendable {}
