internal import MySwiftUICore

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct _SceneInputs {
    var base: _GraphInputs // 0x0
    private(set) var preferences: PreferencesInputs // 0x30
}

@available(*, unavailable)
extension _SceneInputs : Sendable {
}
