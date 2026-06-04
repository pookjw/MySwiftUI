@available(visionOS 26.0, *)
@available(macOS, unavailable)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(macCatalyst, unavailable)
public enum ImagePresentationEvents {
    public struct TransitionStarted : Event {
        public let currentViewingMode: ImagePresentationComponent.ViewingMode
        
        public let targetViewingMode: ImagePresentationComponent.ViewingMode
    }
    
    public struct TransitionCompleted : Event {
        public let previousViewingMode: ImagePresentationComponent.ViewingMode
        
        public let currentViewingMode: ImagePresentationComponent.ViewingMode
    }
}
