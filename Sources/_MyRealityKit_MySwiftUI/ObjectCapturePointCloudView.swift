public import MySwiftUICore

@available(iOS 17.0, *)
@available(watchOS, unavailable)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
@available(visionOS, unavailable)
@MainActor public struct ObjectCapturePointCloudView : View {
    @MainActor public init(session: ObjectCaptureSession) {
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
extension ObjectCapturePointCloudView {
    @MainActor public func showShotLocations(_ value: Bool = true) -> ObjectCapturePointCloudView {
        assertUnimplemented()
    }
}

@available(iOS 17.0, *)
@available(watchOS, unavailable)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
@available(visionOS, unavailable)
extension ObjectCapturePointCloudView : Sendable {}
