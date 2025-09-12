@frozen public enum HorizontalEdge: Int8, CaseIterable, Codable {
    case leading
    case trailing
}

extension HorizontalEdge: Equatable {}
extension HorizontalEdge: Hashable {}
extension HorizontalEdge: RawRepresentable {}
extension HorizontalEdge: Sendable {}
extension HorizontalEdge: BitwiseCopyable {}

extension HorizontalEdge {
    @frozen public struct Set : OptionSet {
        public typealias Element = HorizontalEdge.Set
        public typealias ArrayLiteralElement = HorizontalEdge.Set.Element
        
        public let rawValue: Int8
        
        public init(rawValue: Int8) {
            self.rawValue = rawValue
        }
        
        public static let leading = HorizontalEdge.Set(rawValue: 1 << 0)
        public static let trailing = HorizontalEdge.Set(rawValue: 1 << 1)
        public static let all: HorizontalEdge.Set = [.leading, .trailing]
        
        public init(_ edge: HorizontalEdge) {
            switch edge {
            case .leading:
                self = .leading
            case .trailing:
                self = .trailing
            }
        }
    }
}


extension HorizontalEdge.Set: Sendable {}
extension HorizontalEdge.Set: BitwiseCopyable {}
