
public protocol _VectorMath : Animatable {
    
}

extension _VectorMath {
    public var magnitude: Double {
        assertUnimplemented()
    }
    
    public mutating func negate() {
        assertUnimplemented()
    }
    
    public mutating func normalize() {
        assertUnimplemented()
    }
    
    public func normalized() -> Self {
        assertUnimplemented()
    }
    
    public static func + (lhs: Self, rhs: Self) -> Self {
        assertUnimplemented()
    }
    
    public static func += (lhs: inout Self, rhs: Self) {
        assertUnimplemented()
    }
    
    public static func - (lhs: Self, rhs: Self) -> Self {
        assertUnimplemented()
    }
    
    public static prefix func - (value: Self) -> Self {
        assertUnimplemented()
    }
    
    public static func -= (lhs: inout Self, rhs: Self) {
        assertUnimplemented()
    }
    
    public static func * (lhs: Self, rhs: Double) -> Self {
        assertUnimplemented()
    }
    
    public static func *= (lhs: inout Self, rhs: Double) {
        assertUnimplemented()
    }
    
    public static func / (lhs: Self, rhs: Double) -> Self {
        assertUnimplemented()
    }
    
    public static func /= (lhs: inout Self, rhs: Double) {
        assertUnimplemented()
    }
}
