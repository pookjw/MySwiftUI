#warning("TODO")
public import CoreGraphics

@frozen
public struct EdgeInsets: Equatable {
    public var top: CGFloat
    public var leading: CGFloat
    public var bottom: CGFloat
    public var trailing: CGFloat
    
    @inlinable public init(top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat) {
        self.top = top
        self.leading = leading
        self.bottom = bottom
        self.trailing = trailing
    }
    
    @inlinable public init() {
        self.init(top: 0, leading: 0, bottom: 0, trailing: 0)
    }
    
    public static var zero: EdgeInsets {
        return EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
    }
    
    @inline(__always)
    package mutating func xFlipIfRightToLeft(layoutDirection: @autoclosure () -> LayoutDirection) {
        let leading = leading
        let trailing = trailing
        
        guard leading != trailing else {
            return
        }
        
        let direction = layoutDirection()
        if direction == .rightToLeft {
            self.leading = trailing
            self.trailing = leading
        }
    }
}

extension EdgeInsets: _VectorMath {
    public typealias AnimatableData = AnimatablePair<CGFloat, AnimatablePair<CGFloat, AnimatablePair<CGFloat, CGFloat>>>
    
    public var animatableData: EdgeInsets.AnimatableData {
        @inlinable get {
            return .init(top, .init(leading, .init(bottom, trailing)))
        }
        @inlinable set {
            let top = newValue.first
            let leading = newValue.second.first
            let bottom = newValue.second.second.first
            let trailing = newValue.second.second.second
            self = .init(
                top: top, leading: leading, bottom: bottom, trailing: trailing)
        }
    }
}

extension EdgeInsets {
    @usableFromInline
    package init(_all: CGFloat) {
        self.top = _all
        self.leading = _all
        self.bottom = _all
        self.trailing = _all
    }
}

extension EdgeInsets: Sendable {}
extension EdgeInsets: BitwiseCopyable {}

extension EdgeInsets {
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inline(__always) @inlinable package mutating func round(_ rule: FloatingPointRoundingRule, toMultipleOf m: CGFloat) {
        top.round(rule, toMultipleOf: m)
        leading.round(rule, toMultipleOf: m)
        bottom.round(rule, toMultipleOf: m)
        trailing.round(rule, toMultipleOf: m)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package mutating func round(toMultipleOf m: CGFloat) {
        round(.toNearestOrAwayFromZero, toMultipleOf: m)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inline(__always) @inlinable package func rounded(_ rule: FloatingPointRoundingRule = .toNearestOrAwayFromZero, toMultipleOf m: CGFloat) -> EdgeInsets {
        var r = self
        r.round(rule, toMultipleOf: m)
        return r
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package func rounded(toMultipleOf m: CGFloat) -> EdgeInsets {
        rounded(.toNearestOrAwayFromZero, toMultipleOf: m)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package func approximates(_ other: EdgeInsets, epsilon: CGFloat) -> Bool {
        top.approximates(other.top, epsilon: epsilon)
        && leading.approximates(other.leading, epsilon: epsilon)
        && bottom.approximates(other.bottom, epsilon: epsilon)
        && trailing.approximates(other.trailing, epsilon: epsilon)
    }
}
