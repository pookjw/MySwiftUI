// 459982CEE1B36FEFD0501A7900DAFA6F
public import MySwiftUICore

@available(iOS 16.0, macOS 13.0, watchOS 9.0, *)
@available(tvOS, unavailable)
extension View {
    nonisolated public func scrollContentBackground(_ visibility: Visibility) -> some View {
        assertUnimplemented()
    }
}

extension EnvironmentValues {
    var scrollContentBackground: ScrollContentBackground {
        get {
            return self[ScrollContentBackgroundKey.self]
        }
        set {
            self[ScrollContentBackgroundKey.self] = newValue
        }
    }
}

struct ScrollContentBackground {
    private(set) var style: AnyShapeStyle?
    private(set) var visibility: Visibility
    private(set) var wantsWindowBackground: Bool
}

fileprivate struct ScrollContentBackgroundKey : EnvironmentKey {
    static var defaultValue: ScrollContentBackground {
        return ScrollContentBackground(
            style: nil,
            visibility: .automatic,
            wantsWindowBackground: false
        )
    }
}
