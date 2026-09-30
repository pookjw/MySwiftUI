public import MySwiftUICore

@available(iOS 13.4, tvOS 16.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
public struct HoverEffect {
    @available(iOS 18.0, tvOS 18.0, visionOS 2.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    public init<E>(_ effect: E) where E : CustomHoverEffect {
        assertUnimplemented()
    }
    
    @safe public nonisolated(unsafe) static let automatic: HoverEffect = {
        assertUnimplemented()
    }()
    
    @available(tvOS 17.0, *)
    @safe public nonisolated(unsafe) static let highlight: HoverEffect = {
        assertUnimplemented()
    }()
    
    @safe public nonisolated(unsafe) static let lift: HoverEffect = {
        assertUnimplemented()
    }()
}

@available(*, unavailable)
extension HoverEffect : Sendable {
}
