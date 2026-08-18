// 35273CE9B08E81B9B7BB15A240C7CCDE
public import MySwiftUICore

@available(visionOS 26.0, macOS 26.0, iOS 26.0, macCatalyst 26.0, tvOS 26.0, *)
@available(watchOS, unavailable)
public struct RealityViewLayoutOption : Equatable, Sendable {
    private var value: UInt8
    
    public static let flexible = RealityViewLayoutOption(value: 0)
    public static let centered = RealityViewLayoutOption(value: 1)
    public static let fixedSize = RealityViewLayoutOption(value: 2)
}

@available(visionOS 26.0, macOS 26.0, iOS 26.0, macCatalyst 26.0, tvOS 26.0, *)
@available(watchOS, unavailable)
extension View {
    @MainActor @preconcurrency public func realityViewLayoutBehavior(_ layoutOption: RealityViewLayoutOption) -> some View {
        return self.environment(\.realityViewLayoutOption, layoutOption)
    }
}

extension EnvironmentValues {
    fileprivate(set) var realityViewLayoutOption: RealityViewLayoutOption {
        get {
            return self[RealityViewLayoutOptionKey.self]
        }
        set {
            self[RealityViewLayoutOptionKey.self] = newValue
        }
    }
    
    fileprivate struct RealityViewLayoutOptionKey : EnvironmentKey {
        static var defaultValue: RealityViewLayoutOption {
            return .flexible
        }
    }
}
