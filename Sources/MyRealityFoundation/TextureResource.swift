public import Foundation
public import Metal
public import CoreGraphics

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@preconcurrency @MainActor public class TextureResource : Resource {
    @MainActor @preconcurrency public var __coreAsset: __AssetRef {
        get {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public enum Semantic {
        case raw
        case scalar
        case color
        case hdrColor
        case normal
        
        public static func == (a: TextureResource.Semantic, b: TextureResource.Semantic) -> Bool {
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
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public enum MipmapsMode {
        case none
        case allocateAll
        case allocateAndGenerateAll
        
        public static func == (a: TextureResource.MipmapsMode, b: TextureResource.MipmapsMode) -> Bool {
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
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public struct CreateOptions {
        public var semantic: TextureResource.Semantic?
        
        public var mipmapsMode: TextureResource.MipmapsMode
        
        @available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
        public var compression: TextureResource.Compression
        
        public init(semantic: TextureResource.Semantic?, mipmapsMode: TextureResource.MipmapsMode = .allocateAndGenerateAll) {
            assertUnimplemented()
        }
        
        @available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
        public init(semantic: TextureResource.Semantic?, compression: TextureResource.Compression, mipmapsMode: TextureResource.MipmapsMode = .allocateAndGenerateAll) {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    @MainActor @preconcurrency public var semantic: TextureResource.Semantic? {
        get {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    @MainActor @preconcurrency public var width: Int {
        get {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    @MainActor @preconcurrency public var height: Int {
        get {
            assertUnimplemented()
        }
    }
    
    @available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    @MainActor @preconcurrency public var depth: Int {
        get {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    @MainActor @preconcurrency public var mipmapLevelCount: Int {
        get {
            assertUnimplemented()
        }
    }
    
    @available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    @MainActor @preconcurrency public var pixelFormat: MTLPixelFormat {
        get {
            assertUnimplemented()
        }
    }
    
    @available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    @MainActor @preconcurrency public var textureType: MTLTextureType {
        get {
            assertUnimplemented()
        }
    }
    
    @available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    @MainActor @preconcurrency public var arrayLength: Int {
        get {
            assertUnimplemented()
        }
    }
    
    @available(*, noasync, message: "Synchronous loading APIs block the main actor and should not be used in async contexts.  Use init(...) async instead")
    @MainActor @preconcurrency public static func load(contentsOf url: URL, withName resourceName: String? = nil) throws -> TextureResource {
        assertUnimplemented()
    }
    
    @available(macOS, introduced: 10.15, deprecated: 15.0, renamed: "init(contentsOf:withName:)")
    @available(iOS, introduced: 13.0, deprecated: 18.0, renamed: "init(contentsOf:withName:)")
    @available(macCatalyst, introduced: 13.0, deprecated: 18.0, renamed: "init(contentsOf:withName:)")
    @available(visionOS, introduced: 1.0, deprecated: 1.0, renamed: "init(contentsOf:withName:)")
    @available(tvOS, unavailable)
    @MainActor @preconcurrency public static func loadAsync(contentsOf url: URL, withName resourceName: String? = nil) -> LoadRequest<TextureResource> {
        assertUnimplemented()
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    @available(*, noasync, message: "Synchronous loading APIs block the main actor and should not be used in async contexts.  Use init(...) async instead")
    @MainActor @preconcurrency public static func load(contentsOf url: URL, withName resourceName: String? = nil, options: TextureResource.CreateOptions) throws -> TextureResource {
        assertUnimplemented()
    }
    
    @available(macOS, introduced: 12.0, deprecated: 15.0, renamed: "init(contentsOf:withName:options:)")
    @available(iOS, introduced: 15.0, deprecated: 18.0, renamed: "init(contentsOf:withName:options:)")
    @available(macCatalyst, introduced: 15.0, deprecated: 18.0, renamed: "init(contentsOf:withName:options:)")
    @available(visionOS, introduced: 1.0, deprecated: 1.0, renamed: "init(contentsOf:withName:options:)")
    @available(tvOS, unavailable)
    @MainActor @preconcurrency public static func loadAsync(contentsOf url: URL, withName resourceName: String? = nil, options: TextureResource.CreateOptions) -> LoadRequest<TextureResource> {
        assertUnimplemented()
    }
    
    @available(macOS, introduced: 12.0, deprecated: 15.0, renamed: "init(image:withName:options:)")
    @available(iOS, introduced: 15.0, deprecated: 18.0, renamed: "init(image:withName:options:)")
    @available(macCatalyst, introduced: 15.0, deprecated: 18.0, renamed: "init(image:withName:options:)")
    @available(visionOS, introduced: 1.0, deprecated: 2.0, renamed: "init(image:withName:options:)")
    @available(tvOS, unavailable)
    @MainActor @preconcurrency public static func generate(from cgImage: CGImage, withName resourceName: String? = nil, options: TextureResource.CreateOptions) throws -> TextureResource {
        assertUnimplemented()
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    @available(macOS, introduced: 12.0, deprecated: 15.0, renamed: "init(image:withName:options:)")
    @available(iOS, introduced: 15.0, deprecated: 18.0, renamed: "init(image:withName:options:)")
    @available(macCatalyst, introduced: 15.0, deprecated: 18.0, renamed: "init(image:withName:options:)")
    @available(visionOS, introduced: 1.0, deprecated: 1.0, renamed: "init(image:withName:options:)")
    @available(tvOS, unavailable)
    @MainActor @preconcurrency public static func generateAsync(from cgImage: CGImage, withName resourceName: String? = nil, options: TextureResource.CreateOptions) -> LoadRequest<TextureResource> {
        assertUnimplemented()
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    @MainActor @preconcurrency public func replace(withImage cgImage: CGImage, options: TextureResource.CreateOptions) throws {
        assertUnimplemented()
    }
    
    @available(macOS, introduced: 12.0, deprecated: 15.0, renamed: "replace(using:options:)")
    @available(iOS, introduced: 15.0, deprecated: 18.0, renamed: "replace(using:options:)")
    @available(macCatalyst, introduced: 15.0, deprecated: 18.0, renamed: "replace(using:options:)")
    @available(visionOS, introduced: 1.0, deprecated: 1.0, renamed: "replace(using:options:)")
    @available(tvOS, unavailable)
    @MainActor @preconcurrency public func replaceAsync(withImage cgImage: CGImage, options: TextureResource.CreateOptions) -> LoadRequest<TextureResource> {
        assertUnimplemented()
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    @MainActor @preconcurrency public func copy(to texture: any MTLTexture) throws {
        assertUnimplemented()
    }
    
    @available(macOS, introduced: 12.0, deprecated: 15.0, renamed: "copy(to:)")
    @available(iOS, introduced: 15.0, deprecated: 18.0, renamed: "copy(to:)")
    @available(macCatalyst, introduced: 15.0, deprecated: 18.0, renamed: "copy(to:)")
    @available(visionOS, introduced: 1.0, deprecated: 1.0, renamed: "copy(to:)")
    @preconcurrency @MainActor public func copyAsync(to texture: any MTLTexture, completionHandler: @escaping @MainActor ((any Error)?) -> Void) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func __generate(size: CGSize, using drawingHandler: (CGContext) -> Void) throws -> TextureResource {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func __texture(from mtlTexture: any MTLTexture) -> TextureResource {
        assertUnimplemented()
    }
    
    @available(*, deprecated, message: "Use generate(from: CGImage, ...), and for color images specify `CreateOptions.Semantic = .color`")
    @MainActor @preconcurrency public static func __texture(from cgImage: CGImage, label: String? = nil) -> TextureResource {
        assertUnimplemented()
    }
    
    @_hasMissingDesignatedInitializers @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public class Drawable {
        public var drawableQueue: TextureResource.DrawableQueue {
            get {
                assertUnimplemented()
            }
        }
        
        public var texture: any MTLTexture {
            get {
                assertUnimplemented()
            }
        }
        
        public func present() {
            assertUnimplemented()
        }
        
        @available(visionOS 1.0, *)
        @MainActor public func presentOnSceneUpdate() {
            assertUnimplemented()
        }
        }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public class DrawableQueue {
        public struct Descriptor {
            public var pixelFormat: MTLPixelFormat
            
            public var width: Int
            
            public var height: Int
            
            public var usage: MTLTextureUsage
            
            public var mipmapsMode: TextureResource.MipmapsMode
            
            public init(pixelFormat: MTLPixelFormat, width: Int, height: Int, usage: MTLTextureUsage, mipmapsMode: TextureResource.MipmapsMode) {
                assertUnimplemented()
            }
        }
        
        public var pixelFormat: MTLPixelFormat {
            get {
                assertUnimplemented()
            }
        }
        
        public var width: Int {
            get {
                assertUnimplemented()
            }
        }
        
        public var height: Int {
            get {
                assertUnimplemented()
            }
        }
        
        public var usage: MTLTextureUsage {
            get {
                assertUnimplemented()
            }
        }
        
        public var mipmapsMode: TextureResource.MipmapsMode {
            get {
                assertUnimplemented()
            }
        }
        
        @preconcurrency @MainActor public init(_ descriptor: TextureResource.DrawableQueue.Descriptor) throws {
            assertUnimplemented()
        }
        
        public func nextDrawable() throws -> TextureResource.Drawable {
            assertUnimplemented()
        }
        
        public var allowsNextDrawableTimeout: Bool
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    @MainActor @preconcurrency public func replace(withDrawables drawableQueue: TextureResource.DrawableQueue) {
        assertUnimplemented()
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    @MainActor @preconcurrency public var drawableQueue: TextureResource.DrawableQueue? {
        get {
            assertUnimplemented()
        }
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension TextureResource.Semantic : Sendable {
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension TextureResource.MipmapsMode : Sendable {
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource {
    @MainActor @preconcurrency convenience public init(contentsOf url: URL, withName resourceName: String? = nil) async throws {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency convenience public init(contentsOf url: URL, withName resourceName: String? = nil, options: TextureResource.CreateOptions) async throws {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource : @MainActor Equatable {
    @MainActor @preconcurrency public static func == (lhs: TextureResource, rhs: TextureResource) -> Bool {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, macCatalyst 18.0, iOS 18.0, tvOS 26.0, *)
extension TextureResource {
    @available(macOS, unavailable, introduced: 15.0, renamed: "init(image:withName:options:)")
    @available(iOS, unavailable, introduced: 18.0, renamed: "init(image:withName:options:)")
    @available(macCatalyst, unavailable, introduced: 18.0, renamed: "init(image:withName:options:)")
    @available(visionOS, unavailable, renamed: "init(image:withName:options:)")
    @MainActor @preconcurrency public static func generate(from cgImage: CGImage, named resourceName: String? = nil, options: TextureResource.CreateOptions) async throws -> TextureResource {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func replace(using cgImage: CGImage, options: TextureResource.CreateOptions) async throws {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func copy(to texture: any MTLTexture) async throws {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, macOS 15.0, macCatalyst 18.0, iOS 18.0, tvOS 26.0, *)
extension TextureResource {
    @MainActor @preconcurrency public static func texture2DArray(slices: [CGImage], named resourceName: String? = nil, options: TextureResource.CreateOptions) throws -> TextureResource {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func texture2DArray(slices: [CGImage], named resourceName: String? = nil, options: TextureResource.CreateOptions) async throws -> TextureResource {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func cube(slices: [CGImage], named resourceName: String? = nil, options: TextureResource.CreateOptions) throws -> TextureResource {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func cube(slices: [CGImage], named resourceName: String? = nil, options: TextureResource.CreateOptions) async throws -> TextureResource {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func texture3D(slices: [CGImage], named resourceName: String? = nil, options: TextureResource.CreateOptions) throws -> TextureResource {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func texture3D(slices: [CGImage], named resourceName: String? = nil, options: TextureResource.CreateOptions) async throws -> TextureResource {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource {
    public struct Compression : Hashable, Sendable {
        public static var none: TextureResource.Compression {
            get {
                assertUnimplemented()
            }
        }
        
        public static var `default`: TextureResource.Compression {
            get {
                assertUnimplemented()
            }
        }
        
        public enum ASTCBlockSize : Hashable, Sendable {
            case block4x4
            case block5x4
            case block5x5
            case block6x5
            case block6x6
            case block8x5
            case block8x6
            case block8x8
            case block10x5
            case block10x6
            case block10x8
            case block10x10
            case block12x10
            case block12x12
            
            public static func == (a: TextureResource.Compression.ASTCBlockSize, b: TextureResource.Compression.ASTCBlockSize) -> Bool {
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
        
        public enum ASTCQuality : Hashable, Sendable {
            case fast
            case normal
            case high
            case exhaustive
            
            public static func == (a: TextureResource.Compression.ASTCQuality, b: TextureResource.Compression.ASTCQuality) -> Bool {
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
        
        @available(iOS, unavailable)
        @available(tvOS, unavailable)
        @available(visionOS, unavailable)
        public static func astc(blockSize: TextureResource.Compression.ASTCBlockSize, quality: TextureResource.Compression.ASTCQuality = .fast) -> TextureResource.Compression {
            assertUnimplemented()
        }
        
        public static func == (a: TextureResource.Compression, b: TextureResource.Compression) -> Bool {
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
    
    public typealias SamplingQuality = EnvironmentResource.CreateOptions.SamplingQuality
    
    @MainActor @preconcurrency convenience public init(cubeFromEquirectangular cgImage: CGImage, named resourceName: String? = nil, quality: TextureResource.SamplingQuality = .fast, faceSize: Int? = nil, options: TextureResource.CreateOptions) throws {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency convenience public init(cubeFromEquirectangular cgImage: CGImage, named resourceName: String? = nil, quality: TextureResource.SamplingQuality = .fast, faceSize: Int? = nil, options: TextureResource.CreateOptions) async throws {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency convenience public init(cubeFromImage cgImage: CGImage, named resourceName: String? = nil, options: TextureResource.CreateOptions) throws {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency convenience public init(cubeFromImage cgImage: CGImage, named resourceName: String? = nil, options: TextureResource.CreateOptions) async throws {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource.DrawableQueue.Descriptor {
    public var timeout: Duration {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public init(pixelFormat: MTLPixelFormat, width: Int, height: Int, usage: MTLTextureUsage, mipmapsMode: TextureResource.MipmapsMode, timeout: Duration) {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource {
    @MainActor @preconcurrency convenience public init(image cgImage: CGImage, withName resourceName: String? = nil, options: TextureResource.CreateOptions) throws {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency convenience public init(image cgImage: CGImage, withName resourceName: String? = nil, options: TextureResource.CreateOptions) async throws {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource {
    public struct Dimensions2DArray {
    }
    
    public struct DimensionsCube {
    }
    
    public struct Dimensions3D {
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource {
    public struct Dimensions2D {
    }
    
    public struct Format {
    }
    
    public struct Contents {
        public struct MipmapLevel {
        }
        
        public init(mipmapLevels: [TextureResource.Contents.MipmapLevel]) {
            assertUnimplemented()
        }
    }
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource.Contents {
    public struct Slice : Sendable {
        public static func slice(data: Data, bytesPerRow: Int) -> TextureResource.Contents.Slice {
            assertUnimplemented()
        }
        
        public static func slice(unsafeBuffer buffer: any MTLBuffer, offset: Int = 0, size: Int, bytesPerRow: Int) -> TextureResource.Contents.Slice {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource {
    @MainActor @preconcurrency convenience public init(dimensions: TextureResource.Dimensions2D, format: TextureResource.Format, contents: TextureResource.Contents) async throws {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency convenience public init(dimensions: TextureResource.Dimensions2D, format: TextureResource.Format, contents: TextureResource.Contents) throws {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource {
    @MainActor @preconcurrency convenience public init(dimensions: TextureResource.Dimensions2DArray, format: TextureResource.Format, contents: TextureResource.Contents) async throws {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency convenience public init(dimensions: TextureResource.Dimensions2DArray, format: TextureResource.Format, contents: TextureResource.Contents) throws {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency convenience public init(dimensions: TextureResource.DimensionsCube, format: TextureResource.Format, contents: TextureResource.Contents) async throws {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency convenience public init(dimensions: TextureResource.DimensionsCube, format: TextureResource.Format, contents: TextureResource.Contents) throws {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency convenience public init(dimensions: TextureResource.Dimensions3D, format: TextureResource.Format, contents: TextureResource.Contents) async throws {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency convenience public init(dimensions: TextureResource.Dimensions3D, format: TextureResource.Format, contents: TextureResource.Contents) throws {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource.Dimensions2D {
    public static func dimensions(width: Int, height: Int) -> TextureResource.Dimensions2D {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource.Dimensions2DArray {
    public static func dimensions(width: Int, height: Int, length: Int) -> TextureResource.Dimensions2DArray {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource.DimensionsCube {
    public static func dimensions(faceSize: Int) -> TextureResource.DimensionsCube {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource.Dimensions3D {
    public static func dimensions(width: Int, height: Int, depth: Int) -> TextureResource.Dimensions3D {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource.Format {
    public enum ColorSpace {
        case displayP3
    }
    
    public static func color(_ colorSpace: TextureResource.Format.ColorSpace, pixelFormat: MTLPixelFormat) -> TextureResource.Format {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource.Format {
    public enum NormalEncoding {
        case xy
        case wy
    }
    
    public static func normal(_ encoding: TextureResource.Format.NormalEncoding, pixelFormat: MTLPixelFormat) -> TextureResource.Format {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource.Format {
    public static func raw(pixelFormat: MTLPixelFormat) -> TextureResource.Format {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource.Contents.MipmapLevel {
    @available(visionOS, unavailable, renamed: "mip(unsafeBuffer:offset:size:bytesPerRow:)")
    @available(macOS, unavailable)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public static func mip(buffer: any MTLBuffer, offset: Int = 0, size: Int, bytesPerRow: Int) -> TextureResource.Contents.MipmapLevel {
        assertUnimplemented()
    }
    
    public static func mip(data: Data, bytesPerRow: Int) -> TextureResource.Contents.MipmapLevel {
        assertUnimplemented()
    }
    
    public static func mip(unsafeBuffer buffer: any MTLBuffer, offset: Int = 0, size: Int, bytesPerRow: Int) -> TextureResource.Contents.MipmapLevel {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource.Contents.MipmapLevel {
    public static func mip(slices: [TextureResource.Contents.Slice]) -> TextureResource.Contents.MipmapLevel {
        assertUnimplemented()
    }
    
    public static func mip(data: Data, bytesPerRow: Int, bytesPerImage: Int) -> TextureResource.Contents.MipmapLevel {
        assertUnimplemented()
    }
    
    public static func mip(unsafeBuffer buffer: any MTLBuffer, offset: Int = 0, size: Int, bytesPerRow: Int, bytesPerImage: Int) -> TextureResource.Contents.MipmapLevel {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource.Dimensions2D : Equatable, Hashable {
    public static func == (a: TextureResource.Dimensions2D, b: TextureResource.Dimensions2D) -> Bool {
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

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource.Dimensions2DArray : Equatable, Hashable {
    public static func == (a: TextureResource.Dimensions2DArray, b: TextureResource.Dimensions2DArray) -> Bool {
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

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource.DimensionsCube : Equatable, Hashable {
    public static func == (a: TextureResource.DimensionsCube, b: TextureResource.DimensionsCube) -> Bool {
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

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource.Dimensions3D : Equatable, Hashable {
    public static func == (a: TextureResource.Dimensions3D, b: TextureResource.Dimensions3D) -> Bool {
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

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource.Format : Equatable, Hashable {
    public static func == (a: TextureResource.Format, b: TextureResource.Format) -> Bool {
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

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource.Format.ColorSpace : Equatable, Hashable {
    public static func == (a: TextureResource.Format.ColorSpace, b: TextureResource.Format.ColorSpace) -> Bool {
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

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource.Format.NormalEncoding : Equatable, Hashable {
    public static func == (a: TextureResource.Format.NormalEncoding, b: TextureResource.Format.NormalEncoding) -> Bool {
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

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource.Dimensions2D : Sendable {
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource.Dimensions2DArray : Sendable {
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource.DimensionsCube : Sendable {
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource.Dimensions3D : Sendable {
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource.Format : Sendable {
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource.Format.ColorSpace : Sendable {
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource.Format.NormalEncoding : Sendable {
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource.Contents : Sendable {
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource.Contents.MipmapLevel : Sendable {
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension TextureResource {
    @MainActor @preconcurrency convenience public init(from texture: LowLevelTexture) async throws {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency convenience public init(from texture: LowLevelTexture) throws {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func replace(with texture: LowLevelTexture) {
        assertUnimplemented()
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension TextureResource.Semantic : Equatable {}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension TextureResource.Semantic : Hashable {}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension TextureResource.MipmapsMode : Equatable {}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension TextureResource.MipmapsMode : Hashable {}
