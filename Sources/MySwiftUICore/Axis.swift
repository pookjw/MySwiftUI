
@frozen public enum Axis : Int8, CaseIterable {
    case horizontal
    case vertical
    
    @inlinable package var otherAxis: Axis {
        get {
            return self == .horizontal ? .vertical : .horizontal
        }
    }
    @inlinable package var perpendicularEdges: (min: Edge, max: Edge) {
        get {
            return self == .vertical ? (.top, .bottom) : (.leading, .trailing)
        }
    }

    package init(edge: Edge) {
        assertUnimplemented()
    }

    init?(_ axis3D: _Axis3D) {
        assertUnimplemented()
    }

    func perpendicularAbsoluteEdges(with layoutDirection: LayoutDirection) -> (min: AbsoluteEdge, max: AbsoluteEdge) {
        assertUnimplemented()
    }
}

extension Axis : CustomStringConvertible {
    public var description: String {
        assertUnimplemented()
    }
}

extension Axis : Equatable {}
extension Axis : Hashable {}
extension Axis : RawRepresentable {}
extension Axis : Sendable {}
extension Axis : BitwiseCopyable {}

extension Axis {
    @frozen public struct Set : OptionSet {
        public typealias Element = Axis.Set
        public typealias ArrayLiteralElement = Axis.Set.Element
        
        public let rawValue: Int8
        
        public init(rawValue: Int8) {
            self.rawValue = rawValue
        }
        
        public static let horizontal = Axis.Set(rawValue: 1 << 0)
        public static let vertical = Axis.Set(rawValue: 1 << 1)
        package static let both = Axis.Set(rawValue: (1 << 0) | (1 << 1))

        public init(_ axis: Axis) {
            assertUnimplemented()
        }

        package func contains(_ axis: Axis) -> Bool {
            assertUnimplemented()
        }

        package func isOrthogonal(to other: Axis.Set) -> Bool {
            assertUnimplemented()
        }
    }
}

extension Axis.Set : Sendable {}
extension Axis.Set : BitwiseCopyable {}
