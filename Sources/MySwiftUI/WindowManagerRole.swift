private import MySwiftUICore

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension Scene {
    nonisolated public func windowManagerRole(_ role: WindowManagerRole) -> some Scene {
        assertUnimplemented()
    }
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct WindowManagerRole : Sendable {
    private var guts: WindowManagerRole.Guts
    
    public static let automatic = WindowManagerRole(guts: .automatic)
    
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS, unavailable)
    public static let principal = WindowManagerRole(guts: .principal)
    
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS, unavailable)
    public static let associated = WindowManagerRole(guts: .associated)
}

extension WindowManagerRole {
    enum Guts: Hashable {
        case automatic
        case principal
        case associated
    }
}
