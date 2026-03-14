public import MySwiftUICore

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension View {
    public nonisolated func windowToolbarFullScreenVisibility(_ visibility: WindowToolbarFullScreenVisibility) -> some View {
        fatalError("TODO")
    }
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct WindowToolbarFullScreenVisibility: Sendable, Equatable {
    private(set) var role: WindowToolbarFullScreenVisibility.Role
    
    public static let automatic = WindowToolbarFullScreenVisibility(role: .automatic)
    
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS, unavailable)
    public static let visible = WindowToolbarFullScreenVisibility(role: .visible)
    
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS, unavailable)
    public static let onHover = WindowToolbarFullScreenVisibility(role: .onHover)
}

extension WindowToolbarFullScreenVisibility {
    enum Role: Hashable {
        case automatic
        case visible
        case onHover
    }
}
