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
