
@frozen public struct Angle {
    public var radians: Double
    
    @inlinable public var degrees: Double {
        get {
            return radians * (180.0 / .pi)
        }
        set {
            radians = newValue * (.pi / 180.0)
        }
    }
    
    @inlinable public init() {
        self.init(radians: 0.0)
    }
    
    @inlinable public init(radians: Double) {
        self.radians = radians
    }
    
    @inlinable public init(degrees: Double) {
        self.init(radians: degrees * (.pi / 180.0))
    }
    
    @inlinable public static func radians(_ radians: Double) -> Angle {
        return Angle(radians: radians)
    }
    
    @inlinable public static func degrees(_ degrees: Double) -> Angle {
        return Angle(degrees: degrees)
    }
    
    @inlinable public static var zero: Angle {
        return Angle(radians: 0)
    }
}

extension Angle: Hashable, Comparable {
    @inlinable public static func < (lhs: Angle, rhs: Angle) -> Bool {
        return lhs.radians < rhs.radians
    }
}

extension Angle: Codable {}
extension Angle: Animatable {
    public var animatableData: Double {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
}
