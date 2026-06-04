public import AVFoundation

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
public struct VideoPlayerComponent : Component {
    @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 1.0, *)
    public var desiredViewingMode: VideoPlaybackController.ViewingMode {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 1.0, *)
    public var viewingMode: VideoPlaybackController.ViewingMode? {
        get {
            assertUnimplemented()
        }
    }
    
    @available(visionOS 2.0, *)
    @available(macOS, unavailable)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(macCatalyst, unavailable)
    public enum ImmersiveViewingMode : Sendable {
        case portal
        case full
        @available(visionOS 26.0, *)
        case progressive
        
        public static func == (a: VideoPlayerComponent.ImmersiveViewingMode, b: VideoPlayerComponent.ImmersiveViewingMode) -> Bool {
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
    
    @available(visionOS 26.0, *)
    @available(macOS, unavailable)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(macCatalyst, unavailable)
    public enum VideoComfortMitigation {
        case play
        case pause
        case reduceImmersion
        
        public static func == (a: VideoPlayerComponent.VideoComfortMitigation, b: VideoPlayerComponent.VideoComfortMitigation) -> Bool {
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
    
    @available(visionOS 2.0, *)
    @available(macOS, unavailable)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(macCatalyst, unavailable)
    public var desiredImmersiveViewingMode: VideoPlayerComponent.ImmersiveViewingMode {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(visionOS 2.0, *)
    @available(macOS, unavailable)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(macCatalyst, unavailable)
    public var immersiveViewingMode: VideoPlayerComponent.ImmersiveViewingMode? {
        get {
            assertUnimplemented()
        }
    }
    
    @available(visionOS 26.0, *)
    @available(macOS, unavailable)
    @available(iOS, unavailable)
    @available(macCatalyst, unavailable)
    public enum SpatialVideoMode : Hashable, Sendable {
        case screen
        case spatial
        
        public static func == (a: VideoPlayerComponent.SpatialVideoMode, b: VideoPlayerComponent.SpatialVideoMode) -> Bool {
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
    
    @available(visionOS 26.0, *)
    @available(macOS, unavailable)
    @available(iOS, unavailable)
    @available(macCatalyst, unavailable)
    public var desiredSpatialVideoMode: VideoPlayerComponent.SpatialVideoMode {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(visionOS 26.0, *)
    @available(macOS, unavailable)
    @available(iOS, unavailable)
    @available(macCatalyst, unavailable)
    public var spatialVideoMode: VideoPlayerComponent.SpatialVideoMode {
        get {
            assertUnimplemented()
        }
    }
    
    @available(macOS 26.0, iOS 18.0, macCatalyst 18.0, visionOS 26.0, tvOS 26.0, *)
    @available(watchOS, unavailable)
    public enum RenderingStatus : Sendable {
        case loading
        case ready
        
        public static func == (a: VideoPlayerComponent.RenderingStatus, b: VideoPlayerComponent.RenderingStatus) -> Bool {
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
    
    @available(macOS 26.0, iOS 18.0, macCatalyst 18.0, visionOS 26.0, tvOS 26.0, *)
    @available(watchOS, unavailable)
    public var currentRenderingStatus: VideoPlayerComponent.RenderingStatus {
        get {
            assertUnimplemented()
        }
    }
    
    public var playerScreenSize: SIMD2<Float> {
        get {
            assertUnimplemented()
        }
    }
    
    public var screenVideoDimension: SIMD2<Float> {
        get {
            assertUnimplemented()
        }
    }
    
    @available(visionOS 1.0, *)
    @available(macOS, unavailable)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public var isPassthroughTintingEnabled: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var avPlayer: AVPlayer? {
        get {
            assertUnimplemented()
        }
    }
    
    public init(avPlayer: AVPlayer) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func __fromCore(_ coreComponent: __ComponentRef) -> VideoPlayerComponent {
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
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension VideoPlayerComponent {
    public var videoRenderer: AVSampleBufferVideoRenderer? {
        get {
            assertUnimplemented()
        }
    }
    
    public init(videoRenderer: AVSampleBufferVideoRenderer) {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, *)
@available(macOS, unavailable)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(macCatalyst, unavailable)
extension VideoPlayerComponent.ImmersiveViewingMode : Equatable {}

@available(visionOS 2.0, *)
@available(macOS, unavailable)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(macCatalyst, unavailable)
extension VideoPlayerComponent.ImmersiveViewingMode : Hashable {}

@available(visionOS 26.0, *)
@available(macOS, unavailable)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(macCatalyst, unavailable)
extension VideoPlayerComponent.VideoComfortMitigation : Equatable {}

@available(visionOS 26.0, *)
@available(macOS, unavailable)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(macCatalyst, unavailable)
extension VideoPlayerComponent.VideoComfortMitigation : Hashable {}

@available(macOS 26.0, iOS 18.0, macCatalyst 18.0, visionOS 26.0, tvOS 26.0, *)
@available(watchOS, unavailable)
extension VideoPlayerComponent.RenderingStatus : Equatable {}

@available(macOS 26.0, iOS 18.0, macCatalyst 18.0, visionOS 26.0, tvOS 26.0, *)
@available(watchOS, unavailable)
extension VideoPlayerComponent.RenderingStatus : Hashable {}
