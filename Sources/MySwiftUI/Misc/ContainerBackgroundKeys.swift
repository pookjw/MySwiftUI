#warning("TODO")
internal import MySwiftUICore

enum ContainerBackgroundKeys {}

extension ContainerBackgroundKeys {
    enum Transparency {
        case transparent
        case notTransparent
        case automatic
    }
    
    struct HostTransparency: HostPreferenceKey {
        static var defaultValue: Transparency {
            fatalError("TODO")
        }
    }
}
