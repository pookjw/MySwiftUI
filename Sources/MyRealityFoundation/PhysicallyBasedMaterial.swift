public import CoreGraphics

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension PhysicallyBasedMaterial {
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public typealias Texture = MaterialParameters.Texture
    
    public typealias FaceCulling = MaterialParameterTypes.FaceCulling
    
    public typealias TextureCoordinateTransform = MaterialParameterTypes.TextureCoordinateTransform
    
    @available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    public typealias TriangleFillMode = MaterialParameterTypes.TriangleFillMode
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public struct BaseColor {
        public static let __tintKey: String = {
            assertUnimplemented()
        }()
        
        public var __tint: CGColor
        
        public static let __textureKey: String = {
            assertUnimplemented()
        }()
        
        public var texture: PhysicallyBasedMaterial.Texture?
        
        @available(*, deprecated, message: "Default textures are no longer needed")
        public static var __defaultTexture: (any __REAssetService) -> TextureResource {
            get {
                assertUnimplemented()
            }
        }
        
        @safe public static nonisolated(unsafe) let textureSemantic: TextureResource.Semantic = {
            assertUnimplemented()
        }()
        
        @available(visionOS, unavailable)
        public init(_ value: CustomMaterial.BaseColor) {
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
        
        public var texture: PhysicallyBasedMaterial.Texture?
        
        @available(*, deprecated, message: "Default textures are no longer needed")
        public static var __defaultTexture: (any __REAssetService) -> TextureResource {
            get {
                assertUnimplemented()
            }
        }
        
        @safe public static nonisolated(unsafe) let textureSemantic: TextureResource.Semantic = {
            assertUnimplemented()
        }()
        
        public init(scale: Float = 1.0, texture: PhysicallyBasedMaterial.Texture? = nil) {
            assertUnimplemented()
        }
        
        public init(floatLiteral value: Float) {
            assertUnimplemented()
        }
        
        @available(visionOS, unavailable)
        public init(_ value: CustomMaterial.Metallic) {
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
        
        public var texture: PhysicallyBasedMaterial.Texture?
        
        @available(*, deprecated, message: "Default textures are no longer needed")
        public static var __defaultTexture: (any __REAssetService) -> TextureResource {
            get {
                assertUnimplemented()
            }
        }
        
        @safe public static nonisolated(unsafe) let textureSemantic: TextureResource.Semantic = {
            assertUnimplemented()
        }()
        
        public init(scale: Float = 1.0, texture: PhysicallyBasedMaterial.Texture? = nil) {
            assertUnimplemented()
        }
        
        public init(floatLiteral value: Float) {
            assertUnimplemented()
        }
        
        @available(visionOS, unavailable)
        public init(_ value: CustomMaterial.Roughness) {
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
        
        public var texture: PhysicallyBasedMaterial.Texture?
        
        @available(*, deprecated, message: "Default textures are no longer needed")
        public static var __defaultTexture: (any __REAssetService) -> TextureResource {
            get {
                assertUnimplemented()
            }
        }
        
        @safe public static nonisolated(unsafe) let textureSemantic: TextureResource.Semantic = {
            assertUnimplemented()
        }()
        
        @available(visionOS, unavailable)
        public init(_ value: CustomMaterial.EmissiveColor) {
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
        
        public var texture: PhysicallyBasedMaterial.Texture?
        
        @available(*, deprecated, message: "Default textures are no longer needed")
        public static var __defaultTexture: (any __REAssetService) -> TextureResource {
            get {
                assertUnimplemented()
            }
        }
        
        @safe public static nonisolated(unsafe) let textureSemantic: TextureResource.Semantic = {
            assertUnimplemented()
        }()
        
        public init(scale: Float = 1.0, texture: PhysicallyBasedMaterial.Texture? = nil) {
            assertUnimplemented()
        }
        
        public init(floatLiteral value: Float) {
            assertUnimplemented()
        }
        
        @available(visionOS, unavailable)
        public init(_ value: CustomMaterial.Specular) {
            assertUnimplemented()
        }
        
        @available(iOS 15.0, tvOS 26.0, macOS 12.0, macCatalyst 15.0, *)
        public typealias FloatLiteralType = Float
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public enum Blending {
        case opaque
        case transparent(opacity: PhysicallyBasedMaterial.Opacity)
        
        @available(visionOS, unavailable)
        public init(blending value: CustomMaterial.Blending) {
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
        
        public var texture: PhysicallyBasedMaterial.Texture?
        
        @available(*, deprecated, message: "Default textures are no longer needed")
        public static var __defaultTexture: (any __REAssetService) -> TextureResource {
            get {
                assertUnimplemented()
            }
        }
        
        public static var textureSemantic: TextureResource.Semantic {
            get {
                assertUnimplemented()
            }
        }
        
        public init(scale: Float = 1.0, texture: PhysicallyBasedMaterial.Texture? = nil) {
            assertUnimplemented()
        }
        
        public init(floatLiteral value: Float) {
            assertUnimplemented()
        }
        
        @available(visionOS, unavailable)
        public init(_ value: CustomMaterial.Opacity) {
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
        
        public var texture: PhysicallyBasedMaterial.Texture?
        
        @available(*, deprecated, message: "Default textures are no longer needed")
        public static var __defaultTexture: (any __REAssetService) -> TextureResource {
            get {
                assertUnimplemented()
            }
        }
        
        @safe public static nonisolated(unsafe) let textureSemantic: TextureResource.Semantic = {
            assertUnimplemented()
        }()
        
        public init(scale: Float = 1.0, texture: PhysicallyBasedMaterial.Texture? = nil) {
            assertUnimplemented()
        }
        
        public init(floatLiteral value: Float) {
            assertUnimplemented()
        }
        
        @available(visionOS, unavailable)
        public init(_ value: CustomMaterial.Clearcoat) {
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
        
        public var texture: PhysicallyBasedMaterial.Texture?
        
        @available(*, deprecated, message: "Default textures are no longer needed")
        public static var __defaultTexture: (any __REAssetService) -> TextureResource {
            get {
                assertUnimplemented()
            }
        }
        
        @safe public static nonisolated(unsafe) let textureSemantic: TextureResource.Semantic = {
            assertUnimplemented()
        }()
        
        public init(scale: Float = 1.0, texture: PhysicallyBasedMaterial.Texture? = nil) {
            assertUnimplemented()
        }
        
        public init(floatLiteral value: Float) {
            assertUnimplemented()
        }
        
        @available(visionOS, unavailable)
        public init(_ value: CustomMaterial.ClearcoatRoughness) {
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
        
        public var texture: PhysicallyBasedMaterial.Texture?
        
        @available(*, deprecated, message: "Default textures are no longer needed")
        public static var __defaultTexture: (any __REAssetService) -> TextureResource {
            get {
                assertUnimplemented()
            }
        }
        
        @safe public static nonisolated(unsafe) let textureSemantic: TextureResource.Semantic = {
            assertUnimplemented()
        }()
        
        public init(texture: PhysicallyBasedMaterial.Texture? = nil) {
            assertUnimplemented()
        }
        
        @available(visionOS, unavailable)
        public init(_ value: CustomMaterial.Normal) {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public struct AmbientOcclusion {
        public static let __textureKey: String = {
            assertUnimplemented()
        }()
        
        public var texture: PhysicallyBasedMaterial.Texture?
        
        @available(*, deprecated, message: "Default textures are no longer needed")
        public static var __defaultTexture: (any __REAssetService) -> TextureResource {
            get {
                assertUnimplemented()
            }
        }
        
        @safe public static nonisolated(unsafe) let textureSemantic: TextureResource.Semantic = {
            assertUnimplemented()
        }()
        
        public init(texture: PhysicallyBasedMaterial.Texture? = nil) {
            assertUnimplemented()
        }
        
        @available(visionOS, unavailable)
        public init(_ value: CustomMaterial.AmbientOcclusion) {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public struct AnisotropyLevel : ExpressibleByFloatLiteral {
        public static let __scaleKey: String = {
            assertUnimplemented()
        }()
        
        public var scale: Float
        
        public static let __textureKey: String = {
            assertUnimplemented()
        }()
        
        public var texture: PhysicallyBasedMaterial.Texture?
        
        @available(*, deprecated, message: "Default textures are no longer needed")
        public static var __defaultTexture: (any __REAssetService) -> TextureResource {
            get {
                assertUnimplemented()
            }
        }
        
        @safe public static nonisolated(unsafe) let textureSemantic: TextureResource.Semantic = {
            assertUnimplemented()
        }()
        
        public init(scale: Float = 1.0, texture: PhysicallyBasedMaterial.Texture? = nil) {
            assertUnimplemented()
        }
        
        public init(floatLiteral value: Float) {
            assertUnimplemented()
        }
        
        @available(iOS 15.0, tvOS 26.0, macOS 12.0, macCatalyst 15.0, *)
        public typealias FloatLiteralType = Float
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public struct AnisotropyAngle : ExpressibleByFloatLiteral {
        public static let __scaleKey: String = {
            assertUnimplemented()
        }()
        
        public var scale: Float
        
        public static let __textureKey: String = {
            assertUnimplemented()
        }()
        
        public var texture: PhysicallyBasedMaterial.Texture?
        
        @available(*, deprecated, message: "Default textures are no longer needed")
        public static var __defaultTexture: (any __REAssetService) -> TextureResource {
            get {
                assertUnimplemented()
            }
        }
        
        @safe public static nonisolated(unsafe) let textureSemantic: TextureResource.Semantic = {
            assertUnimplemented()
        }()
        
        public init(scale: Float = 1.0, texture: PhysicallyBasedMaterial.Texture? = nil) {
            assertUnimplemented()
        }
        
        public init(floatLiteral value: Float) {
            assertUnimplemented()
        }
        
        @available(iOS 15.0, tvOS 26.0, macOS 12.0, macCatalyst 15.0, *)
        public typealias FloatLiteralType = Float
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public struct SheenColor {
        public static let __tintKey: String = {
            assertUnimplemented()
        }()
        
        public var __tint: CGColor
        
        public static let __textureKey: String = {
            assertUnimplemented()
        }()
        
        public var texture: PhysicallyBasedMaterial.Texture?
        
        @available(*, deprecated, message: "Default textures are no longer needed")
        public static var __defaultTexture: (any __REAssetService) -> TextureResource {
            get {
                assertUnimplemented()
            }
        }
        
        @safe public static nonisolated(unsafe) let textureSemantic: TextureResource.Semantic = {
            assertUnimplemented()
        }()
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension PhysicallyBasedMaterial {
    @_hasMissingDesignatedInitializers final public class Program : Equatable, Hashable, Sendable {
        @safe final public nonisolated(unsafe) let descriptor: PhysicallyBasedMaterial.Program.Descriptor = {
            assertUnimplemented()
        }()
        
        public struct Descriptor : Equatable, Hashable, Sendable {
            public var blendMode: MaterialParameterTypes.BlendMode?
            
            public init() {
                assertUnimplemented()
            }
            
            public static func == (a: PhysicallyBasedMaterial.Program.Descriptor, b: PhysicallyBasedMaterial.Program.Descriptor) -> Bool {
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
        
        public init(descriptor: PhysicallyBasedMaterial.Program.Descriptor) async {
            assertUnimplemented()
        }
        
        public static func == (lhs: PhysicallyBasedMaterial.Program, rhs: PhysicallyBasedMaterial.Program) -> Bool {
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
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension PhysicallyBasedMaterial {
    public struct ClearcoatNormal {
        public static let __textureKey: String = {
            assertUnimplemented()
        }()
        
        public var texture: PhysicallyBasedMaterial.Texture?
        
        @safe public static nonisolated(unsafe) let textureSemantic: TextureResource.Semantic = {
            assertUnimplemented()
        }()
        
        public init(texture: PhysicallyBasedMaterial.Texture? = nil) {
            assertUnimplemented()
        }
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
@available(visionOS, unavailable)
extension PhysicallyBasedMaterial.ClearcoatNormal {
    public init(_ value: CustomMaterial.ClearcoatNormal) {
        assertUnimplemented()
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public struct PhysicallyBasedMaterial : Material {
    public var __resource: __MaterialResource
    
    public var __parameterBlock: __RKMaterialParameterBlock
    
    public init() {
        assertUnimplemented()
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var baseColor: PhysicallyBasedMaterial.BaseColor {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var metallic: PhysicallyBasedMaterial.Metallic {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var roughness: PhysicallyBasedMaterial.Roughness {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var emissiveColor: PhysicallyBasedMaterial.EmissiveColor {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var emissiveIntensity: Float {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var specular: PhysicallyBasedMaterial.Specular {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var clearcoat: PhysicallyBasedMaterial.Clearcoat {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var clearcoatRoughness: PhysicallyBasedMaterial.ClearcoatRoughness {
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
    public var faceCulling: PhysicallyBasedMaterial.FaceCulling {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var blending: PhysicallyBasedMaterial.Blending {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var normal: PhysicallyBasedMaterial.Normal {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var ambientOcclusion: PhysicallyBasedMaterial.AmbientOcclusion {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var anisotropyLevel: PhysicallyBasedMaterial.AnisotropyLevel {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var anisotropyAngle: PhysicallyBasedMaterial.AnisotropyAngle {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var sheen: PhysicallyBasedMaterial.SheenColor? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var textureCoordinateTransform: PhysicallyBasedMaterial.TextureCoordinateTransform {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public var secondaryTextureCoordinateTransform: PhysicallyBasedMaterial.TextureCoordinateTransform {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    public var triangleFillMode: PhysicallyBasedMaterial.TriangleFillMode {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension PhysicallyBasedMaterial {
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

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension PhysicallyBasedMaterial {
    public var program: PhysicallyBasedMaterial.Program {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public init(program: PhysicallyBasedMaterial.Program) {
        assertUnimplemented()
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension PhysicallyBasedMaterial {
    public var clearcoatNormal: PhysicallyBasedMaterial.ClearcoatNormal {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}
