// AD93C9ABB9E9FED36CB57677678034F4
internal import MySwiftUICore

@available(visionOS 2.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct WindowProxy {
    public var id: String? {
        assertUnimplemented()
    }

    public var phase: ScenePhase {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension WindowProxy: Sendable {}

extension EnvironmentValues {
    @inline(__always)
    var activeWindows: [WindowProxy] {
        get {
            return self[EnvironmentValues.ActiveWindowsKey.self]
        }
        set {
            self[EnvironmentValues.ActiveWindowsKey.self] = newValue
        }
    }
    
    fileprivate struct ActiveWindowsKey: EnvironmentKey {
        @safe static nonisolated(unsafe) let defaultValue: [WindowProxy] = []
    }
}
