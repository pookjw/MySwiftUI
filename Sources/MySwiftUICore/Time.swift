private import QuartzCore

package struct Time: Hashable, Comparable {
    package static var zero: Time {
        return Time(seconds: 0)
    }
    
    package static var infinity: Time {
        return Time(seconds: .infinity)
    }
    
    @inlinable package static var systemUptime: Time {
        return Time(seconds: CACurrentMediaTime())
    }
    
    var seconds: Double
    
    @inlinable
    package init(seconds: Double) {
        self.seconds = seconds
    }
    
    @inlinable
    package init() {
        self.seconds = Time.zero.seconds
    }
    
    @inlinable
    package static func - (lhs: Time, rhs: Time) -> Time {
        return Time(seconds: lhs.seconds - rhs.seconds)
    }
    
    @inlinable
    package static func < (lhs: Time, rhs: Time) -> Bool {
        return lhs.seconds < rhs.seconds
    }
    
    @inlinable
    package static prefix func - (time: Time) -> Time {
        return Time(seconds: -time.seconds)
    }
    
    @inlinable
    package static func + (lhs: Time, rhs: Double) -> Time {
        return Time(seconds: lhs.seconds + rhs)
    }
    
    @inlinable
    package static func += (lhs: inout Time, rhs: Double) {
        lhs.seconds += rhs
    }
    
    @inlinable
    package static func + (lhs: Double, rhs: Time) -> Time {
        return Time(seconds: lhs + rhs.seconds)
    }
    
    @inlinable
    package static func * (lhs: Time, rhs: Double) -> Time {
        return Time(seconds: lhs.seconds * rhs)
    }
    
    @inlinable
    package static func / (lhs: Time, rhs: Double) -> Time {
        return Time(seconds: lhs.seconds / rhs)
    }
    
    @inlinable
    package static func -= (lhs: inout Time, rhs: Double) {
        lhs.seconds -= rhs
    }
    
    @inlinable
    package static func *= (lhs: inout Time, rhs: Double) {
        lhs.seconds *= rhs
    }
    
    @inlinable
    package static func /= (lhs: inout Time, rhs: Double) {
        lhs.seconds /= rhs
    }
    
    @inlinable
    package static func == (lhs: Time, rhs: Time) -> Bool {
        return lhs.seconds == rhs.seconds
    }
}
