private import MySwiftUICore

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct SceneRestorationBehavior : Sendable {
    private var role: SceneRestorationBehavior.Role
    
    public static let automatic = SceneRestorationBehavior(role: .automatic)
    
    @available(visionOS 26.0, *)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public static let disabled = SceneRestorationBehavior(role: .disabled)
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension Scene {
    nonisolated public func restorationBehavior(_ behavior: SceneRestorationBehavior) -> some Scene {
        assertUnimplemented()
    }
}

extension SceneRestorationBehavior {
    enum Role: Hashable {
        case automatic
        case enabled
        case disabled
    }
}
