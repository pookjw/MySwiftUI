private import QuartzCore

@_spi(Internal) public struct Time : Hashable, Comparable, Sendable {
    package static var zero: Time {
        return Time(seconds: 0)
    }
    
    package static var infinity: Time {
        return Time(seconds: .infinity)
    }
    
    package static var systemUptime: Time {
        return Time(seconds: CACurrentMediaTime())
    }
    
    package var seconds: Double
    
    package init(seconds: Double) {
        self.seconds = seconds
    }
    
    package init() {
        self.seconds = Time.zero.seconds
    }
    
    package static func - (lhs: Time, rhs: Time) -> Time {
        return Time(seconds: lhs.seconds - rhs.seconds)
    }
    
    @_spi(Internal) public static func < (lhs : Time, rhs : Time) -> Bool {
        return lhs.seconds < rhs.seconds
    }
    
    package static prefix func - (time: Time) -> Time {
        return Time(seconds: -time.seconds)
    }
    
    package static func + (lhs: Time, rhs: Double) -> Time {
        return Time(seconds: lhs.seconds + rhs)
    }
    
    package static func += (lhs: inout Time, rhs: Double) {
        lhs.seconds += rhs
    }
    
    package static func + (lhs: Double, rhs: Time) -> Time {
        return Time(seconds: lhs + rhs.seconds)
    }
    
    package static func * (lhs: Time, rhs: Double) -> Time {
        return Time(seconds: lhs.seconds * rhs)
    }
    
    package static func / (lhs: Time, rhs: Double) -> Time {
        return Time(seconds: lhs.seconds / rhs)
    }
    
    package static func -= (lhs: inout Time, rhs: Double) {
        lhs.seconds -= rhs
    }
    
    package static func *= (lhs: inout Time, rhs: Double) {
        lhs.seconds *= rhs
    }
    
    package static func /= (lhs: inout Time, rhs: Double) {
        lhs.seconds /= rhs
    }
    
    @_spi(Internal) public static func == (lhs: Time, rhs: Time) -> Bool {
        return lhs.seconds == rhs.seconds
    }
}

// UIKitCore에서 memcpy
extension Time : BitwiseCopyable {}
