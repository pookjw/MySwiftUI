// 54C853EF26D00A0E6B1785C3902A74F4
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
    
    var codingProxy: CodableLayoutDirection {
        assertUnimplemented()
    }
    
    static func unwrap(codingProxy: CodableLayoutDirection) -> LayoutDirection {
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

struct CodableLayoutDirection : CodableProxy {
    private(set) var base: LayoutDirection
    
    init(_ base: LayoutDirection) {
        self.base = base
    }
    
    func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}

extension CodableLayoutDirection {
    fileprivate enum CodingValue {
        case leftToRight
        case rightToLeft
    }
}
