internal import CoreGraphics

extension CGRect {
    @inline(__always)
    mutating func roundCoordinatesToNearestOrUp(toMultipleOf multiplier: CGFloat) {
        self = standardized
        var d1d3 = CGPoint(x: size.width + origin.x, y: size.height + origin.y)
        origin.roundToNearestOrUp(toMultipleOf: multiplier)
        d1d3.roundToNearestOrUp(toMultipleOf: multiplier)
        size.width = d1d3.x - origin.x
        size.height = d1d3.y - origin.y
        size.round(toMultipleOf: multiplier)
    }
    
    @inline(__always)
    func roundedCoordinatesToNearestOrUp(toMultipleOf multiplier: CGFloat) -> CGRect {
        var copy = self
        copy.roundCoordinatesToNearestOrUp(toMultipleOf: multiplier)
        return copy
    }
}

extension CGSize {
    @inline(__always)
    mutating func round(_ rule: FloatingPointRoundingRule, toMultipleOf multiplier: CGFloat) {
        width.round(rule, toMultipleOf: multiplier)
        height.round(rule, toMultipleOf: multiplier)
    }
    
    @inline(__always)
    func rounded(_ rule: FloatingPointRoundingRule, toMultipleOf multiplier: CGFloat) -> CGSize {
        var copy = self
        copy.round(rule, toMultipleOf: multiplier)
        return copy
    }
    
    @inline(__always)
    mutating func round(toMultipleOf multiplier: CGFloat) {
        width.round(toMultipleOf: multiplier)
        height.round(toMultipleOf: multiplier)
    }
    
    @inline(__always)
    func rounded(toMultipleOf multiplier: CGFloat) -> CGSize {
        var copy = self
        copy.round(toMultipleOf: multiplier)
        return copy
    }
}

extension CGPoint {
    @inline(__always)
    mutating func roundToNearestOrUp(toMultipleOf multiplier: CGFloat) {
        x.round(toMultipleOf: multiplier)
        y.round(toMultipleOf: multiplier)
    }
    
    @inline(__always)
    func roundedToNearestOrUp(toMultipleOf multiplier: CGFloat) -> CGPoint {
        var copy = self
        copy.roundToNearestOrUp(toMultipleOf: multiplier)
        return copy
    }
    
    @inline(__always)
    mutating func round(_ rule: FloatingPointRoundingRule, toMultipleOf multiplier: CGFloat) {
        x.round(rule, toMultipleOf: multiplier)
        y.round(rule, toMultipleOf: multiplier)
    }
    
    @inline(__always)
    func rounded(_ rule: FloatingPointRoundingRule, toMultipleOf multiplier: CGFloat) -> CGPoint {
        var copy = self
        copy.round(rule, toMultipleOf: multiplier)
        return copy
    }
    
    @inline(__always)
    mutating func round(toMultipleOf multiplier: CGFloat) {
        x.round(toMultipleOf: multiplier)
        y.round(toMultipleOf: multiplier)
    }
    
    @inline(__always)
    func rounded(toMultipleOf multiplier: CGFloat) -> CGPoint {
        var copy = self
        copy.round(toMultipleOf: multiplier)
        return copy
    }
}

extension FloatingPoint {
    @inline(__always)
    mutating func round(toMultipleOf multiplier: Self) {
        round(.toNearestOrAwayFromZero, toMultipleOf: multiplier)
    }
    
    @inline(__always)
    func rounded(toMultipleOf multiplier: Self) -> Self {
        var copy = self
        copy.round(toMultipleOf: multiplier)
        return copy
    }
    
    @inline(__always)
    mutating func round(_ rule: FloatingPointRoundingRule, toMultipleOf multiplier: Self) {
        if multiplier == 1 {
            round(rule)
        } else {
            self /= multiplier
            round(rule)
            self *= multiplier
        }
    }
    
    @inline(__always)
    func rounded(_ rule: FloatingPointRoundingRule, toMultipleOf multiplier: Self) -> Self {
        var copy = self
        copy.round(rule, toMultipleOf: multiplier)
        return copy
    }
    
    @inline(__always)
    mutating func roundToNearestOrUp(toMultipleOf multiplier: Self) {
        self += (multiplier / 2)
        return round(.down, toMultipleOf: multiplier)
    }
    
    @inline(__always)
    func roundedToNearestOrUp(toMultipleOf multiplier: Self) -> Self {
        var copy = self
        copy.roundToNearestOrUp(toMultipleOf: multiplier)
        return copy
    }
}

extension EdgeInsets {
    @inline(__always)
    mutating func round(_ rule: FloatingPointRoundingRule, toMultipleOf multiplier: CGFloat) {
        top.round(rule, toMultipleOf: multiplier)
        leading.round(rule, toMultipleOf: multiplier)
        bottom.round(rule, toMultipleOf: multiplier)
        trailing.round(rule, toMultipleOf: multiplier)
    }
    
    @inline(__always)
    func rounded(_ rule: FloatingPointRoundingRule, toMultipleOf multiplier: CGFloat) -> EdgeInsets {
        var copy = self
        copy.round(rule, toMultipleOf: multiplier)
        return copy
    }
    
    @inline(__always)
    mutating func round(toMultipleOf multiplier: CGFloat) {
        top.round(toMultipleOf: multiplier)
        leading.round(toMultipleOf: multiplier)
        bottom.round(toMultipleOf: multiplier)
        trailing.round(toMultipleOf: multiplier)
    }
    
    @inline(__always)
    func rounded(toMultipleOf multiplier: CGFloat) -> EdgeInsets {
        var copy = self
        copy.round(toMultipleOf: multiplier)
        return copy
    }
}
