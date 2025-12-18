
public enum LayoutDirection: Hashable, CaseIterable, Sendable {
    case leftToRight
    case rightToLeft
}

extension EnvironmentValues {
    public var layoutDirection: LayoutDirection {
        get {
            return self[LayoutDirectionKey.self]
        }
        set {
            self[LayoutDirectionKey.self] = newValue
        }
    }
}

struct LayoutDirectionKey: EnvironmentKey {
    static var defaultValue: LayoutDirection {
        return .leftToRight
    }
}

public enum LayoutDirectionBehavior: Hashable, Sendable {
    case fixed
    case mirrors(in: LayoutDirection)
}
