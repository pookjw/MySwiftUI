@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public enum AudioEvents {
    public struct PlaybackCompleted : Event {
        public var playbackController: AudioPlaybackController
    }
}
