public import MySwiftUICore

@available(iOS 17.0, *)
@available(watchOS, unavailable)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
@available(visionOS, unavailable)
@MainActor @preconcurrency public struct ObjectCaptureView<Overlay> : View where Overlay : View {
    nonisolated public init(session: ObjectCaptureSession) where Overlay == EmptyView {
        assertUnimplemented()
    }
    
    nonisolated public init(session: ObjectCaptureSession, @ViewBuilder cameraFeedOverlay: () -> Overlay) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public var body: some View {
        get {
            assertUnimplemented()
        }
    }
}

@available(iOS 18.0, *)
@available(watchOS, unavailable)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
@available(visionOS, unavailable)
extension ObjectCaptureView {
    @MainActor @preconcurrency public func hideObjectReticle(_ value: Bool = true) -> ObjectCaptureView<Overlay> {
        assertUnimplemented()
    }
}

@available(iOS 17.0, *)
@available(watchOS, unavailable)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
@available(visionOS, unavailable)
extension ObjectCaptureView : Sendable {}
