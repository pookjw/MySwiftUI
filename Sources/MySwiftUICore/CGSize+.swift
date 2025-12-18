public import CoreGraphics
public import Spatial

extension CGSize {
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package init(_ point: CGPoint) {
        self.init(width: point.x, height: point.y)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package func scaledBy(x: CGFloat = 1, y: CGFloat = 1) -> CGSize {
        
        return CGSize(width: width == 0 ? 0 : width * x,
                      height: height == 0 ? 0 : height * y)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package func scaled(by scale: CGFloat) -> CGSize {
        return self.scaledBy(x: scale, y: scale)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package func scaled(by scale: CGSize) -> CGSize {
        return self.scaledBy(x: scale.width, y: scale.height)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package func increasedBy(dWidth: CGFloat = 0, dHeight: CGFloat = 0) -> CGSize {
        CGSize(width: width + dWidth, height: height + dHeight)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package var isFinite: Bool {
        get { width.isFinite && height.isFinite }
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package var isNaN: Bool {
        get { width.isNaN || height.isNaN }
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package var hasZero: Bool {
        get { width == 0.0 || height == 0.0 }
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package var isNegative: Bool {
        get { width < 0.0 || height < 0.0 }
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package var isNonEmpty: Bool {
        get { width > 0.0 && height > 0.0 }
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package var flushingNaNs: CGSize {
        get {
            return CGSize(width: !width.isNaN ? width : 0,
                          height: !height.isNaN ? height : 0)
        }
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package var flushingNegatives: CGSize {
        get {
            CGSize(width: max(width, 0.0), height: max(height, 0.0))
        }
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package func approximates(_ other: CGSize, epsilon: CGFloat) -> Bool {
        width.approximates(other.width, epsilon: epsilon)
        && height.approximates(other.height, epsilon: epsilon)
    }
}

extension CGSize {
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package subscript(d: Axis) -> CGFloat {
        get { return d == .horizontal ? width : height }
        set { if d == .horizontal { width = newValue } else { height = newValue } }
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package init(_ l1: CGFloat, in first: Axis, by l2: CGFloat) {
        self = first == .horizontal ? CGSize(width: l1, height: l2) : CGSize(width: l2, height: l1)
    }
}

extension CGSize {
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package func contains(point p: CGPoint) -> Bool {
        return !(p.x < 0) && !(p.y < 0) && p.x < width && p.y < height
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package func contains(point p: Spatial.Point3D) -> Bool {
        return !(p.x < 0) && !(p.y < 0) && p.x < width && p.y < height
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension CGSize : Animatable {
    @_implements(MySwiftUICore.Animatable, AnimatableData)
    public typealias MSUI_AnimatableData = AnimatablePair<CGFloat, CGFloat>
    
    public var animatableData: CGSize.MSUI_AnimatableData {
        @inlinable get { return .init(width, height) }
        @inlinable set { (width, height) = (newValue.first, newValue.second) }
    }
}

extension CGSize {
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package static func + (lhs: CGSize, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: rhs.x + lhs.width, y: rhs.y + lhs.height)
    }
}

extension CGSize {
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable prefix package static func - (operand: CGSize) -> CGSize {
        var result = operand
        result.width = -result.width
        result.height = -result.height
        return result
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package static func += (lhs: inout CGSize, rhs: CGSize) {
        lhs.width += rhs.width
        lhs.height += rhs.height
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package static func + (lhs: CGSize, rhs: CGSize) -> CGSize {
        var result = lhs
        result += rhs
        return result
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package static func -= (lhs: inout CGSize, rhs: CGSize) {
        lhs.width -= rhs.width
        lhs.height -= rhs.height
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package static func - (lhs: CGSize, rhs: CGSize) -> CGSize {
        var result = lhs
        result -= rhs
        return result
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package static func *= (lhs: inout CGSize, rhs: Double) {
        lhs.width *= CGFloat(rhs)
        lhs.height *= CGFloat(rhs)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package static func * (lhs: CGSize, rhs: Double) -> CGSize {
        var result = lhs
        result *= rhs
        return result
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package static func /= (lhs: inout CGSize, rhs: Double) {
        lhs *= 1 / rhs
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package static func / (lhs: CGSize, rhs: Double) -> CGSize {
        var result = lhs
        result /= rhs
        return result
    }
}

extension CGSize {
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inline(__always) @inlinable package mutating func round(_ rule: FloatingPointRoundingRule, toMultipleOf m: CGFloat) {
        width.round(rule, toMultipleOf: m)
        height.round(rule, toMultipleOf: m)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package mutating func round(toMultipleOf m: CGFloat) {
        round(.toNearestOrAwayFromZero, toMultipleOf: m)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inline(__always) @inlinable package func rounded(_ rule: FloatingPointRoundingRule = .toNearestOrAwayFromZero, toMultipleOf m: CGFloat) -> CGSize {
        var r = self
        r.round(rule, toMultipleOf: m)
        return r
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package func rounded(toMultipleOf m: CGFloat) -> CGSize {
        rounded(.toNearestOrAwayFromZero, toMultipleOf: m)
    }
}

extension CGSize {
    func inset(by insets: EdgeInsets) -> CGSize {
        var d0 = height
        var d1 = width
        let d2 = insets.trailing
        var d3 = insets.bottom
        var d4 = insets.leading
        let d5 = insets.top
        
        d1 += d3
        d1 -= d4
        d4 = 0
        d3 = (d1 >= 0) ? d1 : d4
        
        d0 += d2
        d0 -= d5
        d1 = (d0 >= 0) ? d0 : d4
        
        return CGSize(width: d3, height: d1)
    }
}
