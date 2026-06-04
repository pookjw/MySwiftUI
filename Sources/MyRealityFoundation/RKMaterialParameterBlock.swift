public import CoreGraphics
public import simd

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __RKMaterialParameterBlock {
    @available(*, deprecated, message: "The parameters dictionary is deprecated. Please use our public material APIs directly, or __RKMaterialParameterBlock.get and __RKMaterialParameterBlock.set instead.")
    public var parameters: [String : __RKMaterialParameterBlock.Parameter] {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __RKMaterialParameterBlock : Sendable {
    public enum Parameter : ExpressibleByNilLiteral, ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral {
        case texture(TextureResource)
        @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
        case textureAndSampler(MaterialParameters.Texture)
        case float(Float)
        case float2(SIMD2<Float>)
        case float3(SIMD3<Float>)
        case float4(SIMD4<Float>)
        @available(macOS 13.0, iOS 16.0, macCatalyst 16.0, tvOS 26.0, *)
        case color(CGColor)
        case float2x2(float2x2)
        case float3x3(float3x3)
        case float4x4(float4x4)
        case bool(Bool)
        case int(Int32)
        case `default`
        
        public init(nilLiteral: ()) {
            assertUnimplemented()
        }
        
        public init(floatLiteral value: Float) {
            assertUnimplemented()
        }
        
        public init(integerLiteral value: Int) {
            assertUnimplemented()
        }
        
        @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
        public typealias FloatLiteralType = Float
        
        @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
        public typealias IntegerLiteralType = Int
    }
    
    @available(*, deprecated, message: "Pass mappings in __RKMaterialParameterBlock are no longer supported. Please use CustomMaterial instead.")
    public enum TransparentPass : String, CaseIterable {
        case Transparent, TransparentAR, TransparentDynamicLighting, TransparentARDynamicLighting
        
        public init?(rawValue: String) {
            assertUnimplemented()
        }
        
        @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
        @available(*, deprecated, message: "Pass mappings in __RKMaterialParameterBlock are no longer supported. Please use CustomMaterial instead.")
        public typealias AllCases = [__RKMaterialParameterBlock.TransparentPass]
        
        @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
        @available(*, deprecated, message: "Pass mappings in __RKMaterialParameterBlock are no longer supported. Please use CustomMaterial instead.")
        public typealias RawValue = String
        
        nonisolated public static var allCases: [__RKMaterialParameterBlock.TransparentPass] {
            get {
                assertUnimplemented()
            }
        }
        
        public var rawValue: String {
            get {
                assertUnimplemented()
            }
        }
    }
    
    @available(*, deprecated, message: "Pass mappings in __RKMaterialParameterBlock are no longer supported. Please use CustomMaterial instead.")
    public enum OpaquePass : String, CaseIterable {
        case Opaque, OpaqueAR, OpaqueDynamicLighting, OpaqueARDynamicLighting, Shadow
        
        public init?(rawValue: String) {
            assertUnimplemented()
        }
        
        @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
        @available(*, deprecated, message: "Pass mappings in __RKMaterialParameterBlock are no longer supported. Please use CustomMaterial instead.")
        public typealias AllCases = [__RKMaterialParameterBlock.OpaquePass]
        
        @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
        @available(*, deprecated, message: "Pass mappings in __RKMaterialParameterBlock are no longer supported. Please use CustomMaterial instead.")
        public typealias RawValue = String
        
        nonisolated public static var allCases: [__RKMaterialParameterBlock.OpaquePass] {
            get {
                assertUnimplemented()
            }
        }
        
        public var rawValue: String {
            get {
                assertUnimplemented()
            }
        }
    }
    
    @available(*, deprecated, message: "Pass mappings in __RKMaterialParameterBlock are no longer supported. Please use CustomMaterial instead.")
    public mutating func setTransparentPassTechniqueMappingEnabled(_ enabled: Bool) {
        assertUnimplemented()
    }
    
    public mutating func clear(parameter name: String) {
        assertUnimplemented()
    }
    
    public mutating func reset() {
        assertUnimplemented()
    }
    
    public func numberOfTexturesWithNonZeroUVIndex() -> Int {
        assertUnimplemented()
    }
    
    public mutating func set(parameter name: String, value: __RKMaterialParameterBlock.Parameter) {
        assertUnimplemented()
    }
    
    public func get(parameter name: String) -> __RKMaterialParameterBlock.Parameter? {
        assertUnimplemented()
    }
    
    public init() {
        assertUnimplemented()
    }
    
    public init(transparentPassTechniqueMappping mapping: [(__RKMaterialParameterBlock.TransparentPass, String)]) {
        assertUnimplemented()
    }
    
    public init(hashedTransparentPassTechniqueMapping mapping: [(__RKMaterialParameterBlock.TransparentPass, Int)]) {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension __RKMaterialParameterBlock.Parameter : Equatable {
    public static func == (a: __RKMaterialParameterBlock.Parameter, b: __RKMaterialParameterBlock.Parameter) -> Bool {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@available(*, deprecated, message: "Pass mappings in __RKMaterialParameterBlock are no longer supported. Please use CustomMaterial instead.")
extension __RKMaterialParameterBlock.TransparentPass : Equatable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@available(*, deprecated, message: "Pass mappings in __RKMaterialParameterBlock are no longer supported. Please use CustomMaterial instead.")
extension __RKMaterialParameterBlock.TransparentPass : Hashable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@available(*, deprecated, message: "Pass mappings in __RKMaterialParameterBlock are no longer supported. Please use CustomMaterial instead.")
extension __RKMaterialParameterBlock.TransparentPass : RawRepresentable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@available(*, deprecated, message: "Pass mappings in __RKMaterialParameterBlock are no longer supported. Please use CustomMaterial instead.")
extension __RKMaterialParameterBlock.OpaquePass : Equatable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@available(*, deprecated, message: "Pass mappings in __RKMaterialParameterBlock are no longer supported. Please use CustomMaterial instead.")
extension __RKMaterialParameterBlock.OpaquePass : Hashable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@available(*, deprecated, message: "Pass mappings in __RKMaterialParameterBlock are no longer supported. Please use CustomMaterial instead.")
extension __RKMaterialParameterBlock.OpaquePass : RawRepresentable {}
