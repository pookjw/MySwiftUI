public import MySwiftUICore

@available(visionOS 26.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public struct BreakthroughEffect : Equatable, Sendable {
    private let rawValue: Int8
    
    public static let automatic: BreakthroughEffect = {
        assertUnimplemented()
    }()
    
    public static let subtle: BreakthroughEffect = {
        assertUnimplemented()
    }()
    
    public static let prominent: BreakthroughEffect = {
        assertUnimplemented()
    }()
    
    public static let none: BreakthroughEffect = {
        assertUnimplemented()
    }()
    
    public static func == (a: BreakthroughEffect, b: BreakthroughEffect) -> Bool {
        assertUnimplemented()
    }
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
