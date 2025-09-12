@frozen public enum Edge: Int8, CaseIterable {
    case top, leading, bottom, trailing
}

extension Edge {
    @_alwaysEmitIntoClient init(vertical edge: VerticalEdge) {
        self = Edge(rawValue: edge.rawValue << 1).unsafelyUnwrapped
    }
    @_alwaysEmitIntoClient init(horizontal edge: HorizontalEdge) {
        self = Edge(rawValue: 1 &+ (edge.rawValue << 1)).unsafelyUnwrapped
    }
}

extension Edge: Equatable {}
extension Edge: Hashable {}
extension Edge: RawRepresentable {}
extension Edge: Sendable {}
extension Edge: BitwiseCopyable {}

extension Edge {
    @frozen public struct Set : OptionSet {
        public typealias Element = Edge.Set
        public typealias ArrayLiteralElement = Edge.Set.Element
        
        public let rawValue: Int8
        
        public init(rawValue: Int8) {
            self.rawValue = rawValue
        }
        
        public static let top = Edge.Set(rawValue: 1 << 0)
        public static let leading = Edge.Set(rawValue: 1 << 1)
        public static let bottom = Edge.Set(rawValue: 1 << 2)
        public static let trailing = Edge.Set(rawValue: 1 << 3)
        
        public static let all: Edge.Set = [.top, .leading, .bottom, .trailing]
        public static let horizontal: Edge.Set = [.leading, .trailing]
        public static let vertical: Edge.Set = [.top, .bottom]
        
        public init(_ e: Edge) {
            switch e {
            case .top:
                self = .top
            case .leading:
                self = .leading
            case .bottom:
                self = .bottom
            case .trailing:
                self = .trailing
            }
        }
    }
}

extension Edge.Set: Sendable {}
extension Edge.Set: BitwiseCopyable {}
