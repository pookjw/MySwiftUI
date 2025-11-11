public import CoreGraphics

extension CGPoint {
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package static var infinity: CGPoint {
        get {
            return .init(x: CGFloat.infinity, y: CGFloat.infinity)
        }
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package init(_ size: CGSize) {
        self.init(x: size.width, y: size.height)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package var isFinite: Bool {
        get {
            return x.isFinite && y.isFinite
        }
    }
    
    @available(iOS 26.1, macOS 26.1, tvOS 26.1, watchOS 26.1, visionOS 26.1, *)
    @inlinable package var isNegative: Bool {
        get { x < 0.0 || y < 0.0 }
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package func offsetBy(dx: CGFloat, dy: CGFloat) -> CGPoint {
        return CGPoint(x: self.x + dx, y: self.y + dy)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package func offsetBy(dx: CGFloat) -> CGPoint {
        offsetBy(dx: dx, dy: 0)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package func offsetBy(dy: CGFloat) -> CGPoint {
        offsetBy(dx: 0, dy: dy)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package func offset(by offset: CGSize) -> CGPoint {
        return offsetBy(dx: offset.width, dy: offset.height)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package func scaledBy(x: CGFloat, y: CGFloat) -> CGPoint {
        return CGPoint(x: self.x * x, y: self.y * y)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package func scaledBy(x: CGFloat) -> CGPoint {
        scaledBy(x: x, y: 1)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package func scaledBy(y: CGFloat) -> CGPoint {
        scaledBy(x: 1, y: y)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package func scaled(by scale: CGFloat) -> CGPoint {
        return self.scaledBy(x: scale, y: scale)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package var isNaN: Bool {
        get { x.isNaN || y.isNaN }
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package var flushingNaNs: CGPoint {
        get {
            return CGPoint(x: !x.isNaN ? x : 0, y: !y.isNaN ? y : 0)
        }
    }
    
    @available(iOS 26.1, macOS 26.1, tvOS 26.1, watchOS 26.1, visionOS 26.1, *)
    @inlinable package var flushingNegatives: CGPoint {
        get {
            CGPoint(x: max(x, 0.0), y: max(y, 0.0))
        }
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package func approximates(_ other: CGPoint, epsilon: CGFloat) -> Bool {
        x.approximates(other.x, epsilon: epsilon)
        && y.approximates(other.y, epsilon: epsilon)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package mutating func clamp(size: CGSize) {
        x.clamp(to: 0 ... size.width)
        y.clamp(to: 0 ... size.height)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package func clamped(size: CGSize) -> CGPoint {
        var point = self
        point.clamp(size: size)
        return point
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package mutating func clamp(rect: CGRect) {
        x.clamp(to: rect.x ... rect.size.width)
        y.clamp(to: rect.y ... rect.size.height)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package func clamped(rect: CGRect) -> CGPoint {
        var point = self
        point.clamp(rect: rect)
        return point
    }
}

extension CGPoint {
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package subscript(d: Axis) -> CGFloat {
        get { return d == .horizontal ? x : y }
        set { if d == .horizontal { x = newValue } else { y = newValue } }
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package init(_ l1: CGFloat, in first: Axis, by l2: CGFloat) {
        self = first == .horizontal ? CGPoint(x: l1, y: l2) :
        CGPoint(x: l2, y: l1)
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension CGPoint : Animatable {
    @_implements(MySwiftUICore.Animatable, AnimatableData)
    public typealias MSUI_AnimatableData = AnimatablePair<CGFloat, CGFloat>
    
    public var animatableData: CGPoint.MSUI_AnimatableData {
        @inlinable get { return .init(x, y) }
        @inlinable set { (x, y) = (newValue.first, newValue.second) }
    }
}

extension CGPoint {
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package static func + (lhs: CGPoint, rhs: CGSize) -> CGPoint {
        return lhs.offset(by: rhs)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package static func - (lhs: CGPoint, rhs: CGSize) -> CGPoint {
        return lhs + -rhs
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package static func += (lhs: inout CGPoint, rhs: CGSize) {
        lhs = lhs + rhs
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package static func -= (lhs: inout CGPoint, rhs: CGSize) {
        lhs = lhs - rhs
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable prefix package static func - (lhs: CGPoint) -> CGPoint {
        return CGPoint(x: -lhs.x, y: -lhs.y)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package static func - (lhs: CGPoint, rhs: CGPoint) -> CGSize {
        return CGSize(width: lhs.x - rhs.x, height: lhs.y - rhs.y)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package static func * (lhs: CGPoint, rhs: CGFloat) -> CGPoint {
        return lhs.scaled(by: rhs)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package static func *= (lhs: inout CGPoint, rhs: CGFloat) {
        lhs = lhs * rhs
    }
}

extension CGPoint {
    public func applying(_ m: ProjectionTransform) -> CGPoint {
        fatalError("TODO")
    }
}

extension CGPoint {
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inline(__always) @inlinable package mutating func round(_ rule: FloatingPointRoundingRule, toMultipleOf m: CGFloat) {
        x.round(rule, toMultipleOf: m)
        y.round(rule, toMultipleOf: m)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @_transparent @inlinable package mutating func round(toMultipleOf m: CGFloat) {
        round(.toNearestOrAwayFromZero, toMultipleOf: m)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inline(__always) @inlinable package func rounded(_ rule: FloatingPointRoundingRule, toMultipleOf m: CGFloat) -> CGPoint {
        var r = self
        r.round(rule, toMultipleOf: m)
        return r
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package func rounded(toMultipleOf m: CGFloat) -> CGPoint {
        rounded(.toNearestOrAwayFromZero, toMultipleOf: m)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package mutating func roundToNearestOrUp(toMultipleOf m: CGFloat) {
        x.roundToNearestOrUp(toMultipleOf: m)
        y.roundToNearestOrUp(toMultipleOf: m)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package func roundedToNearestOrUp(toMultipleOf m: CGFloat) -> CGPoint {
        var r = self
        r.roundToNearestOrUp(toMultipleOf: m)
        return r
    }
}

extension CGPoint {
    static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    static func += (value: inout CGPoint, other: CGPoint) {
        value = (value + other)
    }
}
