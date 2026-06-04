@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public enum AnimationEvents {
    public struct PlaybackCompleted : Event {
        public let playbackController: AnimationPlaybackController
    }
    
    public struct PlaybackLooped : Event {
        public let playbackController: AnimationPlaybackController
    }
    
    public struct PlaybackTerminated : Event {
        public let playbackController: AnimationPlaybackController
    }
}

@available(visionOS 1.0, macOS 15.0, macCatalyst 18.0, iOS 18.0, tvOS 26.0, *)
extension AnimationEvents {
    public struct PlaybackStarted : Event {
        public let playbackController: AnimationPlaybackController
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension AnimationEvents {
    public struct SkeletalPoseUpdateComplete : Event {
        public let deltaTime: Float
    }
}
