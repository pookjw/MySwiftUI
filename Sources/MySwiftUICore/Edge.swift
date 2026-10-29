public import CoreGraphics

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
}

extension Edge {
  @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
    public enum Corner : Int8, Hashable, CaseIterable, Sendable {
        case topLeading, topTrailing, bottomLeading, bottomTrailing
        
        public struct Set : OptionSet, Hashable, Sendable {
            public typealias Element = Edge.Corner.Set
            public let rawValue: Int8
            
            public init(rawValue: Int8) {
                self.rawValue = rawValue
            }
            
            public static let none: Edge.Corner.Set = []
            public static let topLeading = Edge.Corner.Set(rawValue: 1 << 0)
            public static let topTrailing = Edge.Corner.Set(rawValue: 1 << 1)
            public static let bottomLeading = Edge.Corner.Set(rawValue: 1 << 2)
            public static let bottomTrailing = Edge.Corner.Set(rawValue: 1 << 3)
            public static let all: Edge.Corner.Set = [.topLeading, .topTrailing, .bottomLeading, .bottomTrailing]
            public static let leading: Edge.Corner.Set = [.topLeading, .bottomLeading]
            public static let trailing: Edge.Corner.Set = [.topTrailing, .bottomTrailing]
            public static let bottom: Edge.Corner.Set = [.bottomLeading, .bottomTrailing]
            public static let top: Edge.Corner.Set = [.topLeading, .topTrailing]
            
            public init(_ corner: Edge.Corner) {
                assertUnimplemented()
            }
            
            public func contains(_ corner: Edge.Corner) -> Bool {
                var w8 = corner.rawValue
                let w9 = self.rawValue
                var w10 = w8 & 7
                let w11: Int8 = 1
                w10 = (w11 << w10)
                w8 = (w8 < 8) ? w10 : 0
                return (w8 & ~w9) == 0
            }
            
            @available(iOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, macOS 26.0, *)
            public typealias ArrayLiteralElement = Edge.Corner.Set.Element
            @available(iOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, macOS 26.0, *)
            public typealias RawValue = Int8
        }
        
        @available(iOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, macOS 26.0, *)
        public typealias AllCases = [Edge.Corner]
        @available(iOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, macOS 26.0, *)
        public typealias RawValue = Int8
    }
}
@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension Edge.Corner : CustomDebugStringConvertible {
    public var debugDescription: String {
        assertUnimplemented()
    }
}
@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension Edge.Corner.Set : CustomDebugStringConvertible {
    public var debugDescription: String {
        assertUnimplemented()
    }
}

extension Edge.Corner {
    @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
    public struct Style : Sendable, Hashable, Equatable, Animatable {
        public static func fixed(_ radius: CGFloat) -> Edge.Corner.Style {
            assertUnimplemented()
        }
        
        public static var concentric: Edge.Corner.Style {
            assertUnimplemented()
        }
        
        public static func concentric(minimum: Edge.Corner.Style? = nil) -> Edge.Corner.Style {
            assertUnimplemented()
        }
        
        public var animatableData: Edge.Corner.Style.AnimatableData {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public struct AnimatableData : VectorArithmetic, Sendable {
            public static func - (lhs: Edge.Corner.Style.AnimatableData, rhs: Edge.Corner.Style.AnimatableData) -> Edge.Corner.Style.AnimatableData {
                assertUnimplemented()
            }
            
            public static func + (lhs: Edge.Corner.Style.AnimatableData, rhs: Edge.Corner.Style.AnimatableData) -> Edge.Corner.Style.AnimatableData {
                assertUnimplemented()
            }
            
            public mutating func scale(by rhs: Double) {
                assertUnimplemented()
            }
            
            public var magnitudeSquared: Double {
                assertUnimplemented()
            }
            
            public static var zero: Edge.Corner.Style.AnimatableData {
                assertUnimplemented()
            }
            
            public static func == (a: Edge.Corner.Style.AnimatableData, b: Edge.Corner.Style.AnimatableData) -> Bool {
                assertUnimplemented()
            }
        }
        
        public static func == (a: Edge.Corner.Style, b: Edge.Corner.Style) -> Bool {
            assertUnimplemented()
        }
        
        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
    }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension Edge.Corner.Style : ExpressibleByFloatLiteral {
    public typealias FloatLiteralType = Float
    
    public init(floatLiteral value: Edge.Corner.Style.FloatLiteralType) {
        assertUnimplemented()
    }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension Edge.Corner.Style : ExpressibleByIntegerLiteral {
    public typealias IntegerLiteralType = Int
    
    public init(integerLiteral value: Edge.Corner.Style.IntegerLiteralType) {
        assertUnimplemented()
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
