@frozen public enum VerticalEdge: Int8, CaseIterable, Codable {
    case top
    case bottom
}

extension VerticalEdge: Equatable {}
extension VerticalEdge: Hashable {}
extension VerticalEdge: RawRepresentable {}
extension VerticalEdge: Sendable {}
extension VerticalEdge: BitwiseCopyable {}

extension VerticalEdge {
    @frozen public struct Set : OptionSet {
        public typealias Element = VerticalEdge.Set
        public typealias ArrayLiteralElement = VerticalEdge.Set.Element
        
        public let rawValue: Int8
        
        public init(rawValue: Int8) {
            self.rawValue = rawValue
        }
        
        public static let top = VerticalEdge.Set(rawValue: 1 << 0)
        public static let bottom = VerticalEdge.Set(rawValue: 1 << 1)
        public static let all: VerticalEdge.Set = [.top, .bottom]
        
        public init(_ e: VerticalEdge) {
            switch e {
            case .top:
                self = .top
            case .bottom:
                self = .bottom
            }
        }
    }
}

extension VerticalEdge.Set: Sendable {}
extension VerticalEdge.Set: BitwiseCopyable {}
