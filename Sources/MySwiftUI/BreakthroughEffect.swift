public import MySwiftUICore

@available(visionOS 26.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public struct BreakthroughEffect : Equatable, Sendable {
    private let rawValue: Int8
    
    public static let automatic = BreakthroughEffect(rawValue: 1 << 0)
    public static let subtle = BreakthroughEffect(rawValue: 1 << 1)
    public static let prominent = BreakthroughEffect(rawValue: 1 << 2)
    public static let none = BreakthroughEffect(rawValue: 1 << 3)
}

extension View {
    @available(visionOS 26.0, *)
    @available(iOS, unavailable)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    nonisolated public func presentationBreakthroughEffect(_ effect: BreakthroughEffect) -> some View {
        assertUnimplemented()
    }
    
    @available(visionOS 26.0, *)
    @available(iOS, unavailable)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    nonisolated public func breakthroughEffect(_ effect: BreakthroughEffect) -> some View {
        assertUnimplemented()
    }
}
