public import MySwiftUICore

@available(visionOS 26.0, macOS 26.0, iOS 26.0, macCatalyst 26.0, tvOS 26.0, *)
@available(watchOS, unavailable)
public struct RealityViewLayoutOption : Equatable {
    private var value: UInt8
    
    @safe public static nonisolated(unsafe) let flexible = RealityViewLayoutOption(value: 0)
    @safe public static nonisolated(unsafe) let centered = RealityViewLayoutOption(value: 1)
    @safe public static nonisolated(unsafe) let fixedSize = RealityViewLayoutOption(value: 2)
}

@available(visionOS 26.0, macOS 26.0, iOS 26.0, macCatalyst 26.0, tvOS 26.0, *)
@available(watchOS, unavailable)
extension View {
    @MainActor @preconcurrency public func realityViewLayoutBehavior(_ layoutOption: RealityViewLayoutOption) -> some View {
        assertUnimplemented()
    }
}

extension EnvironmentValues {
    var realityViewLayoutOption: RealityViewLayoutOption {
        assertUnimplemented()
    }
}
