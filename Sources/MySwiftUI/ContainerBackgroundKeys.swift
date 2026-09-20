internal import MySwiftUICore

enum ContainerBackgroundKeys {}

extension ContainerBackgroundKeys {
    enum Transparency {
        case transparent
        case notTransparent
        case automatic
    }
    
    struct HostTransparency : HostPreferenceKey {
        static var defaultValue: Transparency {
            return .automatic
        }
        
        static func reduce(value: inout ContainerBackgroundKeys.Transparency, nextValue: () -> ContainerBackgroundKeys.Transparency) {
            assertUnimplemented()
        }
    }
    
    struct PresentationKey : ContainerBackgroundPlacementKey, HostPreferenceKey {
        static var defaultValue: ContainerBackgroundValue.Content {
            assertUnimplemented()
        }
        
        static func reduce(value: inout ContainerBackgroundValue.Content, nextValue: () -> ContainerBackgroundValue.Content) {
            assertUnimplemented()
        }
        
        static let placement: ContainerBackgroundPlacement = {
            assertUnimplemented()
        }()
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
    fileprivate struct TransparentPresentation : EnvironmentKey {
        static var defaultValue: Bool {
            return false
        }
    }
}

struct ContainerBackgroundValue {
    private var content: ContainerBackgroundValue.Content
    private var allowsVibrancy: Bool
    private var environment: EnvironmentValues
}

extension ContainerBackgroundValue {
    enum Content {
        case view(AnyView)
        case shapeStyle(AnyView, AnyShapeStyle)
        case none
    }
}
