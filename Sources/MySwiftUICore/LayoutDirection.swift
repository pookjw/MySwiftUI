public enum LayoutDirection : Hashable, CaseIterable, Sendable {
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
        _modify {
            yield &self[LayoutDirectionKey.self]
        }
    }
}

struct LayoutDirectionKey : EnvironmentKey {
    static var defaultValue: LayoutDirection {
        return .leftToRight
    }
}

public enum LayoutDirectionBehavior : Hashable, Sendable {
    case fixed // 2
    case mirrors(in: LayoutDirection) // 0/1
}
