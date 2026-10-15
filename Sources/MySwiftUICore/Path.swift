public import CoreGraphics

@frozen public struct Path : Equatable, LosslessStringConvertible, @unchecked Sendable {
    @usableFromInline
    final package class PathBox : Equatable {
        @usableFromInline
        package static func == (lhs: Path.PathBox, rhs: Path.PathBox) -> Bool {
            assertUnimplemented()
        }
    }
    
    @usableFromInline
    @frozen package enum Storage : Equatable {
        case empty // *(uint8_t *)(base + 0x20) = 0x6
        case rect(CGRect) // *(uint8_t *)(base + 0x20) = 0x0
        case ellipse(CGRect) // *(uint8_t *)(base + 0x20) = 0x1
        indirect case roundedRect(FixedRoundedRect)
        
        @available(*, deprecated, message: "obsolete")
        indirect case stroked(StrokedPath)
        
        @available(*, deprecated, message: "obsolete")
        indirect case trimmed(TrimmedPath)
        
        case path(Path.PathBox)
        
        @usableFromInline
        package static func == (a: Path.Storage, b: Path.Storage) -> Bool {
            assertUnimplemented()
        }
    }
    
    package var storage: Path.Storage
    
    public init() {
        self.storage = .empty
    }
    
    public init(_ path: CGPath) {
        assertUnimplemented()
    }
    
    public init(_ path: CGMutablePath) {
        assertUnimplemented()
    }
    
    public init(_ rect: CGRect) {
        if rect.isNull {
            self.storage = .empty
        } else {
            self.storage = .rect(rect)
        }
    }
    
    public init(roundedRect rect: CGRect, cornerSize: CGSize, style: RoundedCornerStyle = .continuous) {
        assertUnimplemented()
    }
    
    public init(roundedRect rect: CGRect, cornerRadius: CGFloat, style: RoundedCornerStyle = .continuous) {
        assertUnimplemented()
    }
    
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    public init(roundedRect rect: CGRect, cornerRadii: RectangleCornerRadii, style: RoundedCornerStyle = .continuous) {
        assertUnimplemented()
    }
    
    public init(ellipseIn rect: CGRect) {
        if rect.isNull {
            self.storage = .empty
        } else if rect.isInfinite {
            self.storage = .rect(rect)
        } else {
            self.storage = .ellipse(rect)
        }
    }
    
    public init(_ callback: (inout Path) -> ()) {
        assertUnimplemented()
    }
    
    public init?(_ string: String) {
        assertUnimplemented()
    }
    
    public var description: String {
        assertUnimplemented()
    }
    
    public var cgPath: CGPath {
        assertUnimplemented()
    }
    
    public var isEmpty: Bool {
        assertUnimplemented()
    }
    
    public var boundingRect: CGRect {
        assertUnimplemented()
    }
    
    public func contains(_ p: CGPoint, eoFill: Bool = false) -> Bool {
        assertUnimplemented()
    }
    
    @frozen public enum Element : Equatable {
        case move(to: CGPoint)
        case line(to: CGPoint)
        case quadCurve(to: CGPoint, control: CGPoint)
        case curve(to: CGPoint, control1: CGPoint, control2: CGPoint)
        case closeSubpath
        
        public static func == (a: Path.Element, b: Path.Element) -> Bool {
            assertUnimplemented()
        }
    }
    
    public func forEach(_ body: (Path.Element) -> Void) {
        assertUnimplemented()
    }
    
    public func strokedPath(_ style: StrokeStyle) -> Path {
        assertUnimplemented()
    }
    
    public func trimmedPath(from: CGFloat, to: CGFloat) -> Path {
        assertUnimplemented()
    }
    
    public static func == (a: Path, b: Path) -> Bool {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension Path.Storage : Sendable {
}

@available(*, unavailable)
extension Path.PathBox : Sendable {
}

extension Path : Shape {
    nonisolated public func path(in _: CGRect) -> Path {
        assertUnimplemented()
    }
    
    public typealias AnimatableData = EmptyAnimatableData
    public typealias Body = _ShapeView<Path, ForegroundStyle>
}

extension Path {
    public mutating func move(to end: CGPoint) {
        assertUnimplemented()
    }
    
    public mutating func addLine(to end: CGPoint) {
        assertUnimplemented()
    }
    
    public mutating func addQuadCurve(to end: CGPoint, control: CGPoint) {
        assertUnimplemented()
    }
    
    public mutating func addCurve(to end: CGPoint, control1: CGPoint, control2: CGPoint) {
        assertUnimplemented()
    }
    
    public mutating func closeSubpath() {
        assertUnimplemented()
    }
    
    public mutating func addRect(_ rect: CGRect, transform: CGAffineTransform = .identity) {
        assertUnimplemented()
    }
    
    public mutating func addRoundedRect(in rect: CGRect, cornerSize: CGSize, style: RoundedCornerStyle = .continuous, transform: CGAffineTransform = .identity) {
        assertUnimplemented()
    }
    
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    public mutating func addRoundedRect(in rect: CGRect, cornerRadii: RectangleCornerRadii, style: RoundedCornerStyle = .continuous, transform: CGAffineTransform = .identity) {
        assertUnimplemented()
    }
    
    public mutating func addEllipse(in rect: CGRect, transform: CGAffineTransform = .identity) {
        assertUnimplemented()
    }
    
    public mutating func addRects(_ rects: [CGRect], transform: CGAffineTransform = .identity) {
        assertUnimplemented()
    }
    
    public mutating func addLines(_ lines: [CGPoint]) {
        assertUnimplemented()
    }
    
    public mutating func addRelativeArc(center: CGPoint, radius: CGFloat, startAngle: Angle, delta: Angle, transform: CGAffineTransform = .identity) {
        assertUnimplemented()
    }
    
    public mutating func addArc(center: CGPoint, radius: CGFloat, startAngle: Angle, endAngle: Angle, clockwise: Bool, transform: CGAffineTransform = .identity) {
        assertUnimplemented()
    }
    
    public mutating func addArc(tangent1End: CGPoint, tangent2End: CGPoint, radius: CGFloat, transform: CGAffineTransform = .identity) {
        assertUnimplemented()
    }
    
    public mutating func addPath(_ path: Path, transform: CGAffineTransform = .identity) {
        assertUnimplemented()
    }
    
    public var currentPoint: CGPoint? {
        assertUnimplemented()
    }
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    public func normalized(eoFill: Bool = true) -> Path {
        assertUnimplemented()
    }
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    public func intersection(_ other: Path, eoFill: Bool = false) -> Path {
        assertUnimplemented()
    }
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    public func union(_ other: Path, eoFill: Bool = false) -> Path {
        assertUnimplemented()
    }
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    public func subtracting(_ other: Path, eoFill: Bool = false) -> Path {
        assertUnimplemented()
    }
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    public func symmetricDifference(_ other: Path, eoFill: Bool = false) -> Path {
        assertUnimplemented()
    }
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    public func lineIntersection(_ other: Path, eoFill: Bool = false) -> Path {
        assertUnimplemented()
    }
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    public func lineSubtraction(_ other: Path, eoFill: Bool = false) -> Path {
        assertUnimplemented()
    }
    
    public func applying(_ transform: CGAffineTransform) -> Path {
        assertUnimplemented()
    }
    
    public func offsetBy(dx: CGFloat, dy: CGFloat) -> Path {
        assertUnimplemented()
    }
}

extension Path.Element : Sendable {}
extension Path.Element : BitwiseCopyable {}

@available(*, deprecated, message: "obsolete")
@usableFromInline
package struct StrokedPath : Equatable {
    public init(path: Path, style: StrokeStyle) {
        assertUnimplemented()
    }
    
    @usableFromInline
    package static func == (a: StrokedPath, b: StrokedPath) -> Bool {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension StrokedPath : Sendable {
}


@available(*, deprecated, message: "obsolete")
@usableFromInline
package struct TrimmedPath : Equatable {
    @usableFromInline
    package static func == (a: TrimmedPath, b: TrimmedPath) -> Bool {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension TrimmedPath : Sendable {
}
