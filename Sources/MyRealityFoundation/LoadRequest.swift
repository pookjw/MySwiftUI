public import Combine

@available(macOS, introduced: 10.15, deprecated: 15.0)
@available(iOS, introduced: 13.0, deprecated: 18.0)
@available(macCatalyst, introduced: 13.0, deprecated: 18.0)
@available(visionOS, introduced: 1.0, deprecated: 1.0)
@available(tvOS, unavailable)
public class LoadRequest<Output> : Publisher {
    public typealias Failure = Error
    
    public var result: Result<Output, any Error>? {
        get {
            assertUnimplemented()
        }
    }
    
    public func subscribe<S>(_ subscriber: S) where Output == S.Input, S : Subscriber, S.Failure == any Error {
        assertUnimplemented()
    }
    
    public func receive<S>(subscriber: S) where Output == S.Input, S : Subscriber, S.Failure == any Error {
        assertUnimplemented()
    }
    }
