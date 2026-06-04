public import CoreGraphics
public import Metal

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
@available(visionOS, unavailable)
extension CustomMaterial {
    @_hasMissingDesignatedInitializers final public class Program : Equatable, Hashable, Sendable {
        @safe final public nonisolated(unsafe) let surfaceShader: CustomMaterial.SurfaceShader = {
            assertUnimplemented()
        }()
        
        @safe final public nonisolated(unsafe) let geometryModifier: CustomMaterial.GeometryModifier? = {
            assertUnimplemented()
        }()
        
        @safe final public nonisolated(unsafe) let descriptor: CustomMaterial.Program.Descriptor = {
            assertUnimplemented()
        }()
        
        public struct Descriptor : Equatable, Hashable, Sendable {
            public var lightingModel: CustomMaterial.LightingModel
            
            public var blendMode: MaterialParameterTypes.BlendMode?
            
            public init() {
                assertUnimplemented()
            }
            
            public static func == (a: CustomMaterial.Program.Descriptor, b: CustomMaterial.Program.Descriptor) -> Bool {
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
        
        public init(surfaceShader: CustomMaterial.SurfaceShader, geometryModifier: CustomMaterial.GeometryModifier? = nil, descriptor: CustomMaterial.Program.Descriptor) async throws {
            assertUnimplemented()
        }
        
        public static func == (lhs: CustomMaterial.Program, rhs: CustomMaterial.Program) -> Bool {
            assertUnimplemented()
        }
        
        final public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        final public var hashValue: Int {
            get {
                assertUnimplemented()
            }
        }
    }
    
    public init(program: CustomMaterial.Program) {
        assertUnimplemented()
    }
    
    public var program: CustomMaterial.Program {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 26.0, *)
@available(visionOS, unavailable)
extension CustomMaterial.GeometryModifier {
    public var constantValues: MTLFunctionConstantValues {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public init(named name: String, in library: any MTLLibrary, constantValues: MTLFunctionConstantValues) {
        assertUnimplemented()
    }
}

@available(iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 26.0, *)
@available(visionOS, unavailable)
extension CustomMaterial.SurfaceShader {
    public var constantValues: MTLFunctionConstantValues {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public init(named name: String, in library: any MTLLibrary, constantValues: MTLFunctionConstantValues) {
        assertUnimplemented()
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
@available(visionOS, unavailable)
extension CustomMaterial {
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public typealias Texture = CustomMaterial.CustomMaterialTexture
    
    public typealias FaceCulling = MaterialParameterTypes.FaceCulling
    
    public typealias TextureCoordinateTransform = MaterialParameterTypes.TextureCoordinateTransform
    
    @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    @available(visionOS, unavailable)
    public typealias TriangleFillMode = MaterialParameterTypes.TriangleFillMode
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public struct CustomMaterialTexture {
        public var resource: TextureResource
        
        @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
        @available(visionOS, unavailable)
        public var swizzle: MTLTextureSwizzleChannels
        
        public init(_ resource: TextureResource) {
            assertUnimplemented()
        }
        
        @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
        @available(visionOS, unavailable)
        public init(_ resource: TextureResource, _ swizzle: MTLTextureSwizzleChannels) {
            assertUnimplemented()
        }
        
        public init(_ texture: MaterialParameters.Texture) {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public struct BaseColor {
        public static let __tintKey: String = {
            assertUnimplemented()
        }()
        
        public var __tint: CGColor
        
        public static let __textureKey: String = {
            assertUnimplemented()
        }()
        
        public var texture: CustomMaterial.Texture?
        
        @available(*, deprecated, message: "Default textures are no longer needed")
        public static var __defaultTexture: (any __REAssetService) -> TextureResource {
            get {
                assertUnimplemented()
            }
        }
        
        public init(_ value: PhysicallyBasedMaterial.BaseColor) {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public struct Metallic : ExpressibleByFloatLiteral {
        public static let __scaleKey: String = {
            assertUnimplemented()
        }()
        
        public var scale: Float
        
        public static let __textureKey: String = {
            assertUnimplemented()
        }()
        
        public var texture: CustomMaterial.Texture?
        
        @available(*, deprecated, message: "Default textures are no longer needed")
        public static var __defaultTexture: (any __REAssetService) -> TextureResource {
            get {
                assertUnimplemented()
            }
        }
        
        public init(scale: Float = 1.0, texture: CustomMaterial.Texture? = nil) {
            assertUnimplemented()
        }
        
        public init(floatLiteral value: Float) {
            assertUnimplemented()
        }
        
        public init(_ value: PhysicallyBasedMaterial.Metallic) {
            assertUnimplemented()
        }
        
        @available(iOS 15.0, tvOS 26.0, macOS 12.0, macCatalyst 15.0, *)
        public typealias FloatLiteralType = Float
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public struct Roughness : ExpressibleByFloatLiteral {
        public static let __scaleKey: String = {
            assertUnimplemented()
        }()
        
        public var scale: Float
        
        public static let __textureKey: String = {
            assertUnimplemented()
        }()
        
        public var texture: CustomMaterial.Texture?
        
        @available(*, deprecated, message: "Default textures are no longer needed")
        public static var __defaultTexture: (any __REAssetService) -> TextureResource {
            get {
                assertUnimplemented()
            }
        }
        
        public init(scale: Float = 1.0, texture: CustomMaterial.Texture? = nil) {
            assertUnimplemented()
        }
        
        public init(floatLiteral value: Float) {
            assertUnimplemented()
        }
        
        public init(_ value: PhysicallyBasedMaterial.Roughness) {
            assertUnimplemented()
        }
        
        @available(iOS 15.0, tvOS 26.0, macOS 12.0, macCatalyst 15.0, *)
        public typealias FloatLiteralType = Float
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public struct EmissiveColor {
        public static let __colorKey: String = {
            assertUnimplemented()
        }()
        
        public var __color: CGColor
        
        public static let __textureKey: String = {
            assertUnimplemented()
        }()
        
        public var texture: CustomMaterial.Texture?
        
        @available(*, deprecated, message: "Default textures are no longer needed")
        public static var __defaultTexture: (any __REAssetService) -> TextureResource {
            get {
                assertUnimplemented()
            }
        }
        
        public init(_ value: PhysicallyBasedMaterial.EmissiveColor) {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public struct Specular : ExpressibleByFloatLiteral {
        public static let __scaleKey: String = {
            assertUnimplemented()
        }()
        
        public var scale: Float
        
        public static let __textureKey: String = {
            assertUnimplemented()
        }()
        
        public var texture: CustomMaterial.Texture?
        
        @available(*, deprecated, message: "Default textures are no longer needed")
        public static var __defaultTexture: (any __REAssetService) -> TextureResource {
            get {
                assertUnimplemented()
            }
        }
        
        public init(scale: Float = 1.0, texture: CustomMaterial.Texture? = nil) {
            assertUnimplemented()
        }
        
        public init(floatLiteral value: Float) {
            assertUnimplemented()
        }
        
        public init(_ value: PhysicallyBasedMaterial.Specular) {
            assertUnimplemented()
        }
        
        @available(iOS 15.0, tvOS 26.0, macOS 12.0, macCatalyst 15.0, *)
        public typealias FloatLiteralType = Float
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public enum Blending {
        case opaque
        case transparent(opacity: CustomMaterial.Opacity)
        
        public init(blending value: PhysicallyBasedMaterial.Blending) {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public struct Opacity : ExpressibleByFloatLiteral {
        public static let __scaleKey: String = {
            assertUnimplemented()
        }()
        
        public var scale: Float
        
        public static let __textureKey: String = {
            assertUnimplemented()
        }()
        
        public var texture: CustomMaterial.Texture?
        
        @available(*, deprecated, message: "Default textures are no longer needed")
        public static var __defaultTexture: (any __REAssetService) -> TextureResource {
            get {
                assertUnimplemented()
            }
        }
        
        public init(scale: Float = 1.0, texture: CustomMaterial.Texture? = nil) {
            assertUnimplemented()
        }
        
        public init(floatLiteral value: Float) {
            assertUnimplemented()
        }
        
        public init(_ value: PhysicallyBasedMaterial.Opacity) {
            assertUnimplemented()
        }
        
        @available(iOS 15.0, tvOS 26.0, macOS 12.0, macCatalyst 15.0, *)
        public typealias FloatLiteralType = Float
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public struct Clearcoat : ExpressibleByFloatLiteral {
        public static let __scaleKey: String = {
            assertUnimplemented()
        }()
        
        public var scale: Float
        
        public static let __textureKey: String = {
            assertUnimplemented()
        }()
        
        public var texture: CustomMaterial.Texture?
        
        @available(*, deprecated, message: "Default textures are no longer needed")
        public static var __defaultTexture: (any __REAssetService) -> TextureResource {
            get {
                assertUnimplemented()
            }
        }
        
        public init(scale: Float = 1.0, texture: CustomMaterial.Texture? = nil) {
            assertUnimplemented()
        }
        
        public init(floatLiteral value: Float) {
            assertUnimplemented()
        }
        
        public init(_ value: PhysicallyBasedMaterial.Clearcoat) {
            assertUnimplemented()
        }
        
        @available(iOS 15.0, tvOS 26.0, macOS 12.0, macCatalyst 15.0, *)
        public typealias FloatLiteralType = Float
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public struct ClearcoatRoughness : ExpressibleByFloatLiteral {
        public static let __scaleKey: String = {
            assertUnimplemented()
        }()
        
        public var scale: Float
        
        public static let __textureKey: String = {
            assertUnimplemented()
        }()
        
        public var texture: CustomMaterial.Texture?
        
        @available(*, deprecated, message: "Default textures are no longer needed")
        public static var __defaultTexture: (any __REAssetService) -> TextureResource {
            get {
                assertUnimplemented()
            }
        }
        
        public init(scale: Float = 1.0, texture: CustomMaterial.Texture? = nil) {
            assertUnimplemented()
        }
        
        public init(floatLiteral value: Float) {
            assertUnimplemented()
        }
        
        public init(_ value: PhysicallyBasedMaterial.ClearcoatRoughness) {
            assertUnimplemented()
        }
        
        @available(iOS 15.0, tvOS 26.0, macOS 12.0, macCatalyst 15.0, *)
        public typealias FloatLiteralType = Float
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public struct Normal {
        public static let __textureKey: String = {
            assertUnimplemented()
        }()
        
        public var texture: CustomMaterial.Texture?
        
        @available(*, deprecated, message: "Default textures are no longer needed")
        public static var __defaultTexture: (any __REAssetService) -> TextureResource {
            get {
                assertUnimplemented()
            }
        }
        
        public init(texture: CustomMaterial.Texture? = nil) {
            assertUnimplemented()
        }
        
        public init(_ value: PhysicallyBasedMaterial.Normal) {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public struct AmbientOcclusion {
        public static let __textureKey: String = {
            assertUnimplemented()
        }()
        
        public var texture: CustomMaterial.Texture?
        
        @available(*, deprecated, message: "Default textures are no longer needed")
        public static var __defaultTexture: (any __REAssetService) -> TextureResource {
            get {
                assertUnimplemented()
            }
        }
        
        public init(texture: CustomMaterial.Texture? = nil) {
            assertUnimplemented()
        }
        
        public init(_ value: PhysicallyBasedMaterial.AmbientOcclusion) {
            assertUnimplemented()
        }
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
@available(visionOS, unavailable)
extension CustomMaterial {
    public struct ClearcoatNormal {
        public static let __textureKey: String = {
            assertUnimplemented()
        }()
        
        public var texture: CustomMaterial.Texture?
        
        public init(texture: CustomMaterial.Texture? = nil) {
            assertUnimplemented()
        }
        
        public init(_ value: PhysicallyBasedMaterial.ClearcoatNormal) {
            assertUnimplemented()
        }
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
@available(visionOS, unavailable)
extension CustomMaterial {
    public struct ResourceStorage<UniformsType> : ~Copyable {
        public subscript(textureResource path: KeyPath<UniformsType, UInt64>) -> TextureResource {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
    }
}

@available(macOS 26.0, iOS 26.0, macCatalyst 26.0, tvOS 26.0, *)
@available(visionOS, unavailable)
extension CustomMaterial.ResourceStorage {
    public subscript<BufferType>(buffer path: KeyPath<UniformsType, UnsafeMutablePointer<BufferType>?>) -> LowLevelBuffer? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
@available(visionOS, unavailable)
extension CustomMaterial {
    public mutating func withMutableUniforms<UniformsType>(ofType: UniformsType.Type, stage: CustomShaderStage, _ callback: (inout UniformsType, inout CustomMaterial.ResourceStorage<UniformsType>) -> Void) {
        assertUnimplemented()
    }
    
    public mutating func withMutableUniforms<UniformsType>(ofType: UniformsType.Type, _ callback: (inout UniformsType, inout CustomMaterial.ResourceStorage<UniformsType>) -> Void) {
        assertUnimplemented()
    }
}

@available(macOS 26.0, iOS 26.0, macCatalyst 26.0, tvOS 26.0, *)
@available(visionOS, unavailable)
extension CustomMaterial {
    public static var supportsMutableUniformsResources: Bool {
        assertUnimplemented()
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
@available(visionOS, unavailable)
public struct CustomMaterial : Material {
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public struct GeometryModifier : MaterialFunction {
        public var name: String
        
        public var library: any MTLLibrary {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        @_spi(Internal) public var __linkSPI: Bool
        
        public init(named name: String, in library: any MTLLibrary) {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public struct SurfaceShader : MaterialFunction {
        public var name: String
        
        public var library: any MTLLibrary {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        @_spi(Internal) public var __linkSPI: Bool
        
        public init(named name: String, in library: any MTLLibrary) {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public enum LightingModel : Hashable, Sendable {
        case lit
        case unlit
        case clearcoat
        
        public static func == (a: CustomMaterial.LightingModel, b: CustomMaterial.LightingModel) -> Bool {
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
    
    public var __resource: __MaterialResource
    
    public var __parameterBlock: __RKMaterialParameterBlock
    
    public var __requiresUnmanagedVideoComponent: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public init(surfaceShader: CustomMaterial.SurfaceShader, geometryModifier: CustomMaterial.GeometryModifier? = nil, lightingModel: CustomMaterial.LightingModel) throws {
        assertUnimplemented()
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public init(from material: any Material, surfaceShader: CustomMaterial.SurfaceShader, geometryModifier: CustomMaterial.GeometryModifier? = nil) throws {
        assertUnimplemented()
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public init(from material: any Material, geometryModifier: CustomMaterial.GeometryModifier) throws {
        assertUnimplemented()
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public struct Custom {
        public var value: SIMD4<Float>
        
        public static let __valueKey: String = {
            assertUnimplemented()
        }()
        
        public static let __textureKey: String = {
            assertUnimplemented()
        }()
        
        public var texture: CustomMaterial.Texture?
        
        public init(value: SIMD4<Float> = .init(repeating: 0), texture: CustomMaterial.Texture? = nil) {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var lightingModel: CustomMaterial.LightingModel {
        get {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var baseColor: CustomMaterial.BaseColor {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var metallic: CustomMaterial.Metallic {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var roughness: CustomMaterial.Roughness {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var emissiveColor: CustomMaterial.EmissiveColor {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var specular: CustomMaterial.Specular {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var opacityThreshold: Float? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var faceCulling: CustomMaterial.FaceCulling {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var blending: CustomMaterial.Blending {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var normal: CustomMaterial.Normal {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var ambientOcclusion: CustomMaterial.AmbientOcclusion {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var clearcoat: CustomMaterial.Clearcoat {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var clearcoatRoughness: CustomMaterial.ClearcoatRoughness {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var textureCoordinateTransform: CustomMaterial.TextureCoordinateTransform {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var secondaryTextureCoordinateTransform: CustomMaterial.TextureCoordinateTransform {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var custom: CustomMaterial.Custom {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    @available(visionOS, unavailable)
    public var triangleFillMode: CustomMaterial.TriangleFillMode {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
@available(visionOS, unavailable)
extension CustomMaterial {
    public var writesDepth: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var readsDepth: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
@available(visionOS, unavailable)
extension CustomMaterial {
    public var clearcoatNormal: CustomMaterial.ClearcoatNormal {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
@available(visionOS, unavailable)
extension CustomMaterial.GeometryModifier : Equatable, Hashable, @unchecked Sendable {
    public static func == (lhs: CustomMaterial.GeometryModifier, rhs: CustomMaterial.GeometryModifier) -> Bool {
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

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
@available(visionOS, unavailable)
extension CustomMaterial.SurfaceShader : Equatable, Hashable, @unchecked Sendable {
    public static func == (lhs: CustomMaterial.SurfaceShader, rhs: CustomMaterial.SurfaceShader) -> Bool {
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
