#warning("TODO")
internal import MySwiftUICore

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
