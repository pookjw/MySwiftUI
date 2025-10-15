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
            return .automatic
        }
        
        static func reduce(value: inout ContainerBackgroundKeys.Transparency, nextValue: () -> ContainerBackgroundKeys.Transparency) {
            fatalError("TODO")
        }
    }
}

extension EnvironmentValues {
    var presentationWantsTransparentBackground: Bool {
        get {
            return self[ContainerBackgroundKeys.TransparentPresentation.self]
        }
        set {
            self[ContainerBackgroundKeys.TransparentPresentation.self] = newValue
        }
    }
}

extension ContainerBackgroundKeys {
    fileprivate struct TransparentPresentation: EnvironmentKey {
        static var defaultValue: Bool {
            return false
        }
    }
}
