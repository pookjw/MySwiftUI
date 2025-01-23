import QuartzCore

package struct Time: Sendable {
    private var secounds: CFTimeInterval
    
    package init() {
        secounds = 0
    }
    
    package init(seconds: CFTimeInterval) {
        self.secounds = seconds
    }
    
    package static var systemUptime: Time {
        Time(seconds: CACurrentMediaTime())
    }
    
    package static var infinity: Time {
        Time(seconds: .infinity)
    }
}

extension Time: Hashable {
}

extension Time: Comparable {
    package static func < (lhs: Time, rhs: Time) -> Bool {
        lhs.secounds < rhs.secounds
    }
}

extension Time: AdditiveArithmetic {
    package static func - (lhs: Time, rhs: Time) -> Time {
        Time(seconds: lhs.secounds - rhs.secounds)
    }
    
    package static func + (lhs: Time, rhs: Time) -> Time {
        Time(seconds: lhs.secounds + rhs.secounds)
    }
    
    package static var zero: Time {
        Time(seconds: 0)
    }
}

extension Time {
    package static prefix func - (x: Time) -> Time {
        Time(seconds: -x.secounds)
    }
    
    package static func * (lhs: Time, rhs: Time) -> Time {
        Time(seconds: lhs.secounds * rhs.secounds)
    }
    
    package static func / (lhs: Time, rhs: Time) -> Time {
        Time(seconds: lhs.secounds / rhs.secounds)
    }
    
    package static func -= (lhs: inout Time, rhs: Time) -> Time {
        var result = lhs
        result.secounds -= rhs.secounds
        return result
    }
    
    package static func *= (lhs: inout Time, rhs: Time) -> Time {
        var result = lhs
        result.secounds *= rhs.secounds
        return result
    }
    
    package static func /= (lhs: inout Time, rhs: Time) -> Time {
        var result = lhs
        result.secounds /= rhs.secounds
        return result
    }
}
