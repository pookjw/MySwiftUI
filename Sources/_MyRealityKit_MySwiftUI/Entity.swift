public import MySwiftUICore

@available(macOS 26.0, iOS 26.0, tvOS 26.0, macCatalyst 26.0, visionOS 26.0, *)
extension Entity {
    @MainActor @preconcurrency public static func animate(_ animation: Animation, body: () -> Void, completion: (() -> Void)? = nil) {
        assertUnimplemented()
    }
}
