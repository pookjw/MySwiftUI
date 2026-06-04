public import Foundation
public import ImageIO

@available(visionOS 26.0, *)
@available(macOS, unavailable)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(macCatalyst, unavailable)
extension ImagePresentationComponent {
    public class Spatial3DImage {
        public init(imageSource: CGImageSource) async throws {
            assertUnimplemented()
        }
        
        convenience public init(contentsOf url: URL) async throws {
            assertUnimplemented()
        }
        
        @abi(final func generateNonisolatedNonsendingFinal() async throws)
        @available(visionOS 26.0, *)
        @available(macOS, unavailable)
        @available(iOS, unavailable)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(macCatalyst, unavailable)
        @_alwaysEmitIntoClient nonisolated/*(nonsending)*/ final public func generate() async throws {
            if #available(visionOS 26.4, *) {
                try await generateInPlace()
            } else {
                
                
                try await generateConcurrent()
            }
        }
        
        @available(visionOS 26.4, *)
        @available(macOS, unavailable)
        @available(iOS, unavailable)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(macCatalyst, unavailable)
        @usableFromInline
        nonisolated(nonsending) internal func generateNonisolatedNonsending() async throws {
            assertUnimplemented()
        }
        
        @abi(func generate() async throws)
        @available(visionOS 26.0, *)
        @available(macOS, unavailable)
        @available(iOS, unavailable)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(macCatalyst, unavailable)
        @usableFromInline
        @concurrent internal func generateConcurrent() async throws {
            assertUnimplemented()
        }
        
        @available(visionOS 26.4, *)
        @available(macOS, unavailable)
        @available(iOS, unavailable)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(macCatalyst, unavailable)
        @usableFromInline
        nonisolated(nonsending) internal func generateInPlace() async throws {
            assertUnimplemented()
        }
    }
}

@available(visionOS 26.0, *)
@available(macOS, unavailable)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(macCatalyst, unavailable)
public struct ImagePresentationComponent : Component {
    public func aspectRatio(for viewingMode: ImagePresentationComponent.ViewingMode) -> Float? {
        assertUnimplemented()
    }
    
    public var screenHeight: Float
    
    public var presentationScreenSize: SIMD2<Float> {
        get {
            assertUnimplemented()
        }
    }
    
    public var screenImageDimension: SIMD2<Float> {
        get {
            assertUnimplemented()
        }
    }
    
    public var desiredViewingMode: ImagePresentationComponent.ViewingMode
    
    public var viewingMode: ImagePresentationComponent.ViewingMode {
        get {
            assertUnimplemented()
        }
    }
    
    public var availableViewingModes: Set<ImagePresentationComponent.ViewingMode> {
        get {
            assertUnimplemented()
        }
    }
    
    public static func supportedViewingModes(for imageSource: CGImageSource) -> Set<ImagePresentationComponent.ViewingMode> {
        assertUnimplemented()
    }
    
    public static func supportedViewingModes(for spatial3DImage: ImagePresentationComponent.Spatial3DImage) -> Set<ImagePresentationComponent.ViewingMode> {
        assertUnimplemented()
    }
    
    public init(imageSource: CGImageSource) async throws {
        assertUnimplemented()
    }
    
    public init(contentsOf url: URL) async throws {
        assertUnimplemented()
    }
    
    public init(spatial3DImage: ImagePresentationComponent.Spatial3DImage) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func __fromCore(_ coreComponent: __ComponentRef) -> ImagePresentationComponent {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
    
    public static var __coreComponentType: __ComponentTypeRef {
        get {
            assertUnimplemented()
        }
    }
    
    public struct ViewingMode : Sendable, Hashable {
        public static let mono: ImagePresentationComponent.ViewingMode = {
            assertUnimplemented()
        }()
        
        public static let spatialStereo: ImagePresentationComponent.ViewingMode = {
            assertUnimplemented()
        }()
        
        public static let spatialStereoImmersive: ImagePresentationComponent.ViewingMode = {
            assertUnimplemented()
        }()
        
        public static let spatial3D: ImagePresentationComponent.ViewingMode = {
            assertUnimplemented()
        }()
        
        public static let spatial3DImmersive: ImagePresentationComponent.ViewingMode = {
            assertUnimplemented()
        }()
        
        public static func == (a: ImagePresentationComponent.ViewingMode, b: ImagePresentationComponent.ViewingMode) -> Bool {
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
}
