public import CoreGraphics
public import simd
private import CoreRE

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
    public enum TransparentPass : String, CaseIterable, Sendable {
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
    
    private let transparentPassTechniqueMapping: [(pass: __RKMaterialParameterBlock.TransparentPass, techniqueHash: Int)] // 0x0
    private let transparentPassesProvidedOnInit: Bool // 0x8
    private var savedTransparentPassesFromCore: [(pass: __RKMaterialParameterBlock.TransparentPass, techniqueHash: Int)]? // 0x10
    @safe private nonisolated(unsafe) var coreParameterBlockValue: CoreRE::MaterialParameterBlockValue // 0x18
    
    @available(*, deprecated, message: "Pass mappings in __RKMaterialParameterBlock are no longer supported. Please use CustomMaterial instead.")
    public mutating func setTransparentPassTechniqueMappingEnabled(_ enabled: Bool) {
        assertUnimplemented()
    }
    
    public mutating func clear(parameter name: String) {
        if !isKnownUniquelyReferenced(&self.coreParameterBlockValue) {
            self.coreParameterBlockValue = unsafe self.coreParameterBlockValue
                .copy()
                .takeUnretainedValue()
        }
        
        // <+68>
        name.withCString { pointer in
            unsafe self.coreParameterBlockValue.clearParameter(pointer)
        }
    }
    
    public mutating func reset() {
        assertUnimplemented()
    }
    
    mutating func unsafeSet(parameter: UnsafePointer<Int8>, value: __RKMaterialParameterBlock.Parameter) {
        /*
         self -> x20
         parameter -> x0
         value -> x1
         */
        if !isKnownUniquelyReferenced(&self.coreParameterBlockValue) {
            self.coreParameterBlockValue = unsafe self.coreParameterBlockValue
                .copy()
                .takeUnretainedValue()
        }
        
        // <+136>
        switch value {
        case .texture(_):
            assertUnimplemented()
        case .textureAndSampler(_):
            assertUnimplemented()
        case .float(_):
            assertUnimplemented()
        case .float2(_):
            assertUnimplemented()
        case .float3(_):
            assertUnimplemented()
        case .float4(_):
            assertUnimplemented()
        case .color(let color):
            // <+1216>
            let coreParameterBlockValue = self.coreParameterBlockValue
            let parameterType = unsafe coreParameterBlockValue.parameterType(parameter)
            
            if parameterType == .unknown19 {
                // <+1240>
                var gamut: UInt8 = 0
                
                withUnsafeTemporaryAllocation(of: Float.self, capacity: 4) { values in
                    unsafe RECGColorToColorGamut(color, values.baseAddress.unsafelyUnwrapped, &gamut)
                    
                    unsafe coreParameterBlockValue.setColor3(
                        parameter,
                        simd_float3(values[0], values[1], values[2]),
                        gamut
                    )
                }
            } else {
                // <+1584>
                var gamut: UInt8 = 0
                
                withUnsafeTemporaryAllocation(of: Float.self, capacity: 4) { values in
                    unsafe RECGColorToColorGamut(color, values.baseAddress.unsafelyUnwrapped, &gamut)
                    
                    unsafe coreParameterBlockValue.setColor4(
                        parameter,
                        simd_float4(values[0], values[1], values[2], values[3]),
                        gamut
                    )
                }
            }
        case .float2x2(_):
            assertUnimplemented()
        case .float3x3(_):
            assertUnimplemented()
        case .float4x4(_):
            assertUnimplemented()
        case .bool(_):
            assertUnimplemented()
        case .int(_):
            assertUnimplemented()
        case .default:
            assertUnimplemented()
        }
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
        self.savedTransparentPassesFromCore = nil
        self.transparentPassesProvidedOnInit = false
        self.transparentPassTechniqueMapping = []
        self.coreParameterBlockValue = unsafe CoreRE::MaterialParameterBlockValue
            .create()
            .takeUnretainedValue()
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
