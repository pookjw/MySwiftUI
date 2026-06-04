@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
public enum VideoPlayerEvents {
    public struct ContentTypeDidChange : Event {
        public enum ContentType : UInt8, Sendable {
            case invalid
            case mono
            @available(visionOS 1.0, *)
            @available(macOS, unavailable)
            @available(macCatalyst, unavailable)
            @available(iOS, unavailable)
            @available(tvOS, unavailable)
            @available(watchOS, unavailable)
            case stereo
            @available(visionOS 1.0, *)
            @available(macOS, unavailable)
            @available(macCatalyst, unavailable)
            @available(iOS, unavailable)
            @available(tvOS, unavailable)
            @available(watchOS, unavailable)
            case immersive
            @available(visionOS 26.0, *)
            @available(macOS, unavailable)
            @available(macCatalyst, unavailable)
            @available(iOS, unavailable)
            @available(tvOS, unavailable)
            @available(watchOS, unavailable)
            case halfEquirectangular
            @available(visionOS 26.0, *)
            @available(macOS, unavailable)
            @available(macCatalyst, unavailable)
            @available(iOS, unavailable)
            @available(tvOS, unavailable)
            @available(watchOS, unavailable)
            case equirectangular
            @available(visionOS 26.0, *)
            @available(macOS, unavailable)
            @available(macCatalyst, unavailable)
            @available(iOS, unavailable)
            @available(tvOS, unavailable)
            @available(watchOS, unavailable)
            case parametricImmersive
            
            public init?(rawValue: UInt8) {
                assertUnimplemented()
            }
            
            @available(iOS 18.0, tvOS 26.0, visionOS 1.0, macOS 15.0, macCatalyst 18.0, *)
            public typealias RawValue = UInt8
            
            public var rawValue: UInt8 {
                get {
                    assertUnimplemented()
                }
            }
        }
        
        public let contentType: VideoPlayerEvents.ContentTypeDidChange.ContentType
        
        public let previousType: VideoPlayerEvents.ContentTypeDidChange.ContentType
    }
    
    public struct ViewingModeDidChange : Event {
        public let currentViewingMode: VideoPlaybackController.ViewingMode?
        
        public let previousViewingMode: VideoPlaybackController.ViewingMode?
    }
    
    @available(visionOS 2.0, *)
    @available(macOS, unavailable)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(macCatalyst, unavailable)
    public struct ImmersiveViewingModeDidChange : Event {
        public let previousMode: VideoPlayerComponent.ImmersiveViewingMode?
        
        public let currentMode: VideoPlayerComponent.ImmersiveViewingMode?
    }
    
    @available(visionOS 2.0, *)
    @available(macOS, unavailable)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(macCatalyst, unavailable)
    public struct ImmersiveViewingModeWillTransition : Event {
        public let previousMode: VideoPlayerComponent.ImmersiveViewingMode?
        
        public let currentMode: VideoPlayerComponent.ImmersiveViewingMode?
    }
    
    @available(visionOS 2.0, *)
    @available(macOS, unavailable)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(macCatalyst, unavailable)
    public struct ImmersiveViewingModeDidTransition : Event {
        public let previousMode: VideoPlayerComponent.ImmersiveViewingMode?
        
        public let currentMode: VideoPlayerComponent.ImmersiveViewingMode?
    }
    
    public struct VideoSizeDidChange : Event {
        public let screenMeshSize: SIMD2<Float>
        
        public let videoDimension: SIMD2<Float>
    }
    
    @available(visionOS 26.0, *)
    @available(macOS, unavailable)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(macCatalyst, unavailable)
    public struct SpatialVideoModeDidChange : Event, Sendable {
        public let previousMode: VideoPlayerComponent.SpatialVideoMode
        
        public let currentMode: VideoPlayerComponent.SpatialVideoMode
    }
    
    @available(macOS 26.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, visionOS 26.0, *)
    @available(watchOS, unavailable)
    public struct RenderingStatusDidChange : Event, Sendable {
        public let previousStatus: VideoPlayerComponent.RenderingStatus
        
        public let currentStatus: VideoPlayerComponent.RenderingStatus
    }
}

@available(visionOS 26.0, *)
@available(macOS, unavailable)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(macCatalyst, unavailable)
extension VideoPlayerEvents {
    public struct VideoComfortMitigationDidOccur : Event {
        @safe public nonisolated(unsafe) let comfortMitigation: VideoPlayerComponent.VideoComfortMitigation
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension VideoPlayerEvents.ContentTypeDidChange.ContentType : Equatable {}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension VideoPlayerEvents.ContentTypeDidChange.ContentType : Hashable {}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension VideoPlayerEvents.ContentTypeDidChange.ContentType : RawRepresentable {}
