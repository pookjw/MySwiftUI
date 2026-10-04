@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct ButtonRole : Equatable, Sendable {
    private var role: ButtonRole.Role
    
    public static let destructive = ButtonRole(role: .destructive)
    public static let cancel = ButtonRole(role: .cancel)
    @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
    public static let confirm = ButtonRole(role: .confirm)
    @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
    public static let close = ButtonRole(role: .close)
}

extension ButtonRole {
    enum Role : Hashable, Sendable {
        case destructive
        case cancel
        case confirm
        case close
    }
}
