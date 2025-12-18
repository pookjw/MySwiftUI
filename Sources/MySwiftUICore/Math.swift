internal import CoreGraphics

extension FloatingPoint {
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inline(__always) @inlinable package mutating func round(_ rule: FloatingPointRoundingRule, toMultipleOf m: Self) {
        if m == 1 {
            round(rule)
        } else {
            self /= m
            round(rule)
            self *= m
        }
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package mutating func round(toMultipleOf m: Self) {
        round(.toNearestOrAwayFromZero, toMultipleOf: m)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inline(__always) @inlinable package func rounded(_ rule: FloatingPointRoundingRule, toMultipleOf m: Self) -> Self {
        var r = self
        r.round(rule, toMultipleOf: m)
        return r
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package func rounded(toMultipleOf m: Self) -> Self {
        rounded(.toNearestOrAwayFromZero, toMultipleOf: m)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package mutating func roundToNearestOrUp(toMultipleOf m: Self) {
        self += m / 2
        round(.down, toMultipleOf: m)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package func roundedToNearestOrUp(toMultipleOf m: Self) -> Self {
        var r = self
        r.roundToNearestOrUp(toMultipleOf: m)
        return r
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package func approximates(_ value: Self, epsilon: Self) -> Bool {
        abs(self - value) < epsilon
    }
}

extension Comparable {
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package func clamp(min minValue: Self, max maxValue: Self) -> Self {
        return min(max(minValue, self), maxValue)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package mutating func clamp(to limits: ClosedRange<Self>) {
        self = self.clamp(
            min: limits.lowerBound, max: limits.upperBound)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package func clamped(to limits: ClosedRange<Self>) -> Self {
        var result = self
        result.clamp(to: limits)
        return result
    }
}
