internal import MySwiftUICore

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct _SceneOutputs {
    private(set) var preferences: PreferencesOutputs
}

@available(*, unavailable)
extension _SceneOutputs : Sendable {
}
