@frozen public enum Edge : Int8, CaseIterable {
    case top, leading, bottom, trailing
}

extension Edge {
    @_alwaysEmitIntoClient init(vertical edge: VerticalEdge) {
        self = unsafe Edge(rawValue: edge.rawValue << 1).unsafelyUnwrapped
    }
    @_alwaysEmitIntoClient init(horizontal edge: HorizontalEdge) {
        self = unsafe Edge(rawValue: 1 &+ (edge.rawValue << 1)).unsafelyUnwrapped
    }
}

extension Edge : Equatable {}
extension Edge : Hashable {}
extension Edge : RawRepresentable {}
extension Edge : Sendable {}
extension Edge : BitwiseCopyable {}

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
        
        package func contains(_ edge: Edge) -> Bool {
            let set = Edge.Set(edge)
            return self.contains(set)
        }
    }
    
    enum Corner : Int8 {
        case topLeading
        case topTrailing
        case bottomLeading
        case bottomTrailing
    }
}

extension Edge.Corner {
    struct Set : OptionSet, CustomDebugStringConvertible {
        let rawValue: Int8
        
        init(rawValue: Int8) {
            self.rawValue = rawValue
        }
        
        func contains(_ member: Edge.Corner) -> Bool {
            var w8 = member.rawValue
            let w9 = self.rawValue
            var w10 = w8 & 7
            let w11: Int8 = 1
            w10 = (w11 << w10)
            w8 = (w8 < 8) ? w10 : 0
            return (w8 & ~w9) == 0
        }
        
        static let all: Edge.Corner.Set = [.topLeading, .topTrailing, .bottomLeading, .bottomTrailing]
        static let leading: Edge.Corner.Set = [.topLeading, .bottomLeading]
        static let trailing: Edge.Corner.Set = [.topTrailing, .bottomTrailing]
        static let bottom: Edge.Corner.Set = [.bottomLeading, .bottomTrailing]
        static let top: Edge.Corner.Set = [.topLeading, .topTrailing]
        
        static var none: Edge.Corner.Set {
            return []
        }
        
        static var topLeading: Edge.Corner.Set {
            return Edge.Corner.Set(rawValue: 1 << 0)
        }
        
        static var topTrailing: Edge.Corner.Set {
            return Edge.Corner.Set(rawValue: 1 << 1)
        }
        
        static var bottomLeading: Edge.Corner.Set {
            return Edge.Corner.Set(rawValue: 1 << 2)
        }
        
        static var bottomTrailing: Edge.Corner.Set {
            return Edge.Corner.Set(rawValue: 1 << 3)
        }
        
        var debugDescription: String {
            assertUnimplemented()
        }
    }
    
    struct Style {
        // TODO
    }
}

extension Edge.Set : Sendable {}
extension Edge.Set : BitwiseCopyable {}

enum AbsoluteEdge : Int8, Hashable, CaseIterable {
    case top
    case left
    case bottom
    case right
    
    struct Set : OptionSet {
        static var top: AbsoluteEdge.Set {
            return AbsoluteEdge.Set(rawValue: 1 << 0)
        }
        
        static var left: AbsoluteEdge.Set {
            return AbsoluteEdge.Set(rawValue: 1 << 1)
        }
        
        static var bottom: AbsoluteEdge.Set {
            return AbsoluteEdge.Set(rawValue: 1 << 2)
        }
        
        static var right: AbsoluteEdge.Set {
            return AbsoluteEdge.Set(rawValue: 1 << 3)
        }
        
        static var all: AbsoluteEdge.Set {
            return [.top, .left, .bottom, .right]
        }
        
        static var horizontal: AbsoluteEdge.Set {
            return [.left, .right]
        }
        
        static var vertical: AbsoluteEdge.Set {
            return [.top, .bottom]
        }
        
        let rawValue: Int8
        
        init(rawValue: Int8) {
            self.rawValue = rawValue
        }
        
        init(_ edge: AbsoluteEdge) {
            switch edge {
            case .top:
                self = .top
            case .left:
                self = .left
            case .bottom:
                self = .bottom
            case .right:
                self = .right
            }
        }
        
        init(_ set: Edge.Set, layoutDirection: LayoutDirection) {
            /*
             set -> x19
             layoutDirection -> w21
             */
            var results: AbsoluteEdge.Set = []
            
            if set.contains(.leading) {
                results.formUnion(layoutDirection == .leftToRight ? .left : .right)
            }
            
            if set.contains(.trailing) {
                results.formUnion(layoutDirection == .leftToRight ? .right : .left)
            }
            
            if set.contains(.top) {
                results.formUnion(.top)
            }
            
            if set.contains(.bottom) {
                results.formUnion(.bottom)
            }
            
            self = results
        }
        
        func contains(_ edge: AbsoluteEdge) -> Bool {
            return contains(AbsoluteEdge.Set(edge))
        }
    }
}
