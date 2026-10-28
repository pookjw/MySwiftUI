internal import CoreGraphics

public enum LayoutDirection : Hashable, CaseIterable, Sendable {
    case leftToRight
    case rightToLeft
    
    var opposite: LayoutDirection {
        assertUnimplemented()
    }
    
    static func convert(_ rect: CGRect, to target: LayoutDirection, in size: CGSize) -> CGRect {
        assertUnimplemented()
    }
}

extension LayoutDirection : CodableByProxy {}

extension LayoutDirection : Serializable {
    package func serialize(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    package static func deserialize(from decoder: Decoder) throws -> LayoutDirection {
        assertUnimplemented()
    }
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
    
    struct LayoutDirectionKey : EnvironmentKey {
        static var defaultValue: LayoutDirection {
            return .leftToRight
        }
    }
}

public enum LayoutDirectionBehavior : Hashable, Sendable {
    case fixed // 2
    case mirrors(in: LayoutDirection) // 0/1
}
