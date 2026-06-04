public import MySwiftUICore

@available(visionOS 26.0, macOS 26.0, iOS 26.0, macCatalyst 26.0, tvOS 26.0, *)
@available(watchOS, unavailable)
extension View {
    @MainActor @preconcurrency public func realityViewLayoutBehavior(_ layoutOption: RealityViewLayoutOption) -> some View {
        assertUnimplemented()
    }

}

@available(iOS 18.0, macOS 15.0, macCatalyst 18.0, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension View {
    @MainActor @preconcurrency public func realityViewCameraControls(_ controls: CameraControls) -> some View {
        assertUnimplemented()
    }

}
