// E260E0B806737DCE3177AA5D1543C826
internal import MySwiftUICore
internal import CoreGraphics

extension View {
    func resetListStackBehavior() -> some View {
        self.environment(\.listStackBehavior, .none)
    }
}

enum ListStackBehavior {
    case limited(CGFloat?)
    case none
    case full
    case lazyFull
}

extension EnvironmentValues {
    var listStackBehavior: ListStackBehavior {
        get {
            return self[ListHasStackBehaviorKey.self]
        }
        set {
            self[ListHasStackBehaviorKey.self] = newValue
        }
    }
}

fileprivate struct ListHasStackBehaviorKey : EnvironmentKey {
    static var defaultValue: ListStackBehavior {
        return .none
    }
}
