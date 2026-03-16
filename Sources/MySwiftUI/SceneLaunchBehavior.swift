private import MySwiftUICore

@available(macOS 15.0, visionOS 26.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Scene {
    nonisolated public func defaultLaunchBehavior(_ behavior: SceneLaunchBehavior) -> some Scene {
        assertUnimplemented()
    }
}

@available(macOS 15.0, visionOS 26.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct SceneLaunchBehavior : Sendable {
    private var role: SceneLaunchBehavior.Role
    
    public static let automatic = SceneLaunchBehavior(role: .automatic)
    public static let presented = SceneLaunchBehavior(role: .presented)
    public static let suppressed = SceneLaunchBehavior(role: .suppressed)
}

extension SceneLaunchBehavior {
    enum Role: Hashable {
        case automatic
        case presented
        case suppressed
    }
}
