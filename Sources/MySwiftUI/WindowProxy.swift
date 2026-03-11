@available(visionOS 2.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct WindowProxy {
    public var id: String? {
        fatalError("TODO")
    }

    public var phase: ScenePhase {
        fatalError("TODO")
    }
}

@available(*, unavailable)
extension WindowProxy: Sendable {}
