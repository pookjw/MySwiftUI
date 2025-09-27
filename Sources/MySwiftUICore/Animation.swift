#warning("TODO")
package import CoreGraphics
public import Spatial

public struct Animation {
    package var function: Function {
        fatalError("TODO")
    }
}

extension Animation {
    package enum Function {
        case linear(duration: Double)
        case circularEaseIn(duration: Double)
        case circularEaseOut(duration: Double)
        case circularEaseInOut(duration: Double)
        case bezier(duration: Double, CGPoint)
        case spring(duration: Double, mass: Double, stiffness: Double, damping: Double, initialVelocity: Double)
        case customFunction(Double, (inout AnimationContext<Double>) -> Double?)
        indirect case delay(Double, Animation.Function)
        indirect case speed(Double, Animation.Function)
        indirect case `repeat`(count: Double, autoreverses: Bool, Animation.Function)
    }
}

public struct AnimationContext<Value: VectorArithmetic> {
    
}

public protocol VectorArithmetic : AdditiveArithmetic {
    mutating func scale(by rhs: Double)
    var magnitudeSquared: Double { get }
}

extension Double: VectorArithmetic {
    public mutating func scale(by rhs: Double) {
        fatalError("TODO")
    }
    
    public var magnitudeSquared: Double {
        fatalError("TODO")
    }
}

extension Vector3D: VectorArithmetic {
    public mutating func scale(by rhs: Double) {
        fatalError("TODO")
    }
    
    public var magnitudeSquared: Double {
        fatalError("TODO")
    }
}

extension Size3D: VectorArithmetic {
    public mutating func scale(by rhs: Double) {
        fatalError("TODO")
    }
    
    public var magnitudeSquared: Double {
        fatalError("TODO")
    }
}
