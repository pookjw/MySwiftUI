@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public protocol Event : Sendable {
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public protocol EventSource {
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
public struct EventSubscription {
    public func cancel() {
        assertUnimplemented()
    }
    
    public func subscribe(to scene: Scene) {
        assertUnimplemented()
    }
}
