public import MySwiftUICore

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
public struct ToolbarTitleDisplayMode {
    private(set) var role: ToolbarTitleDisplayMode.Role
    
    public static var automatic: ToolbarTitleDisplayMode {
        return ToolbarTitleDisplayMode(role: .automatic)
    }
    
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    public static var large: ToolbarTitleDisplayMode {
        return ToolbarTitleDisplayMode(role: .large)
    }
    
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public static var inlineLarge: ToolbarTitleDisplayMode {
        return ToolbarTitleDisplayMode(role: .inlineLarge)
    }
    
    public static var inline: ToolbarTitleDisplayMode {
        return ToolbarTitleDisplayMode(role: .inline)
    }
}

@available(*, unavailable)
extension ToolbarTitleDisplayMode: Sendable {
}

extension ToolbarTitleDisplayMode: Equatable {}

extension ToolbarTitleDisplayMode {
    enum Role: Hashable {
        case automatic
        case large
        case inlineLarge
        case inline
        case settings
    }
}

extension View {
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    public nonisolated func toolbarTitleDisplayMode(_ mode: ToolbarTitleDisplayMode) -> some View {
        fatalError("TODO")
    }
}
