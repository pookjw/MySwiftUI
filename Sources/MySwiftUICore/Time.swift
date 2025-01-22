import QuartzCore

@_spi(MySwiftUIOnly)
public struct Time: Sendable {
    private var secounds: CFTimeInterval
    
    public init() {
        secounds = 0
    }
    
    public init(seconds: CFTimeInterval) {
        self.secounds = seconds
    }
    
    public static var systemUptime: Time {
        Time(seconds: CACurrentMediaTime())
    }
    
    public static var infinity: Time {
        Time(seconds: .infinity)
    }
}

extension Time: Hashable {
}

extension Time: Comparable {
    public static func < (lhs: Time, rhs: Time) -> Bool {
        lhs.secounds < rhs.secounds
    }
}

extension Time: AdditiveArithmetic {
    public static func - (lhs: Time, rhs: Time) -> Time {
        Time(seconds: lhs.secounds - rhs.secounds)
    }
    
    public static func + (lhs: Time, rhs: Time) -> Time {
        Time(seconds: lhs.secounds + rhs.secounds)
    }
    
    public static var zero: Time {
        Time(seconds: 0)
    }
}

extension Time {
    public static prefix func - (x: Time) -> Time {
        Time(seconds: -x.secounds)
    }
    
    public static func * (lhs: Time, rhs: Time) -> Time {
        Time(seconds: lhs.secounds * rhs.secounds)
    }
    
    public static func / (lhs: Time, rhs: Time) -> Time {
        Time(seconds: lhs.secounds / rhs.secounds)
    }
    
    public static func -= (lhs: inout Time, rhs: Time) -> Time {
        var result = lhs
        result.secounds -= rhs.secounds
        return result
    }
    
    public static func *= (lhs: inout Time, rhs: Time) -> Time {
        var result = lhs
        result.secounds *= rhs.secounds
        return result
    }
    
    public static func /= (lhs: inout Time, rhs: Time) -> Time {
        var result = lhs
        result.secounds /= rhs.secounds
        return result
    }
}
