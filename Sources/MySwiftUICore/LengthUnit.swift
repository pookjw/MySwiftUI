// 38667C00BFB8EED8C379D726121E1265
package import Foundation
package import Spatial
package import CoreGraphics

package enum LengthUnit : Equatable {
    case length(UnitLength)
    case points
    
    package init(_ length: UnitLength) {
        self = .length(length)
    }
    
    package var lengthUnit: UnitLength? {
        switch self {
        case .length(let unitLength):
            return unitLength
        case .points:
            return nil
        }
    }
    
    package static let meters = LengthUnit.length(.meters) 
}

package protocol LengthUnitConvertible : Equatable {
    mutating func scale(by scale: Double)
}

extension LengthUnitConvertible {
    package func scaled(by scale: Double) -> Self {
        var result = self
        result.scale(by: scale)
        return result
    }
    
    package func convert(from: LengthUnit, to: LengthUnit, scale: PointScale) -> Self {
        return self.scaled(
            by: scale.scaleFactor(from: from, to: to)
        )
    }
}

extension Point3D : LengthUnitConvertible {
    package mutating func scale(by scale: Double) {
        self.x *= scale
        self.y *= scale
        self.z *= scale
    }
}

extension Size3D : LengthUnitConvertible {
}

extension CGRect : LengthUnitConvertible {
    package mutating func scale(by scale: Double) {
        self.origin.x *= scale
        self.origin.y *= scale
        self.size.width *= scale
        self.size.height *= scale
    }
}

extension Rect3D : LengthUnitConvertible {
    package mutating func scale(by scale: Double) {
        origin.scale(by: scale)
        size.uniformlyScale(by: scale)
    }
}

extension ViewTransform : LengthUnitConvertible {
    package mutating func scale(by scale: Double) {
        guard scale != 1 else {
            return
        }
        
        var size = Size3D(width: 1, height: 1, depth: 1)
        size.uniformlyScale(by: scale)
        let transform = AffineTransform3D(scale: size)
        appendAffineTransform3D(transform, inverse: true)
    }
}

extension _ProposedSize : LengthUnitConvertible {
    public mutating func scale(by scale: Double) {
        if let width {
            self.width = width * scale
        }
        
        if let height {
            self.height = height * scale
        }
    }
}

extension CGSize : LengthUnitConvertible {
    package mutating func scale(by scale: Double) {
        self.width *= scale
        self.height *= scale
    }
}

extension CGPoint : LengthUnitConvertible {
    package mutating func scale(by scale: Double) {
        assertUnimplemented()
    }
}

extension CGFloat : LengthUnitConvertible {
}

extension _ProposedSize3D : LengthUnitConvertible {
    package mutating func scale(by scale: Double) {
        if let width {
            self.width = width * scale
        }
        
        if let height {
            self.height = height * scale
        }
        
        if let depth {
            self.depth = depth * scale
        }
    }
}

extension EdgeInsets3D : LengthUnitConvertible {
    package mutating func scale(by scale: Double) {
        self.top *= scale
        self.leading *= scale
        self.bottom *= scale
        self.trailing *= scale
        self.front *= scale
        self.back *= scale
    }
}

extension Double : LengthUnitConvertible {
}

extension EnvironmentValues {
    package var pointScale: PointScale {
        get {
            return self[PointScaleKey.self]
        }
        set {
            self[PointScaleKey.self] = newValue
        }
        _modify {
            yield &self[PointScaleKey.self]
        }
    }
    
    package var pointsPerMeter: CGFloat {
        get {
            return self[PointScaleKey.self].pointsPerMeter
        }
        set {
            self[PointScaleKey.self] = PointScale(pointsPerMeter: newValue)
        }
    }
}

package struct PointScale {
    package var pointsPerMeter: CGFloat
    
    package init(pointsPerMeter: CGFloat) {
        self.pointsPerMeter = pointsPerMeter
    }
    
    package func convert<T : LengthUnitConvertible>(_ fromValue: T, from fromUnit: LengthUnit, to toUnit: LengthUnit) -> T {
        let scale = self.scaleFactor(from: fromUnit, to: toUnit)
        return fromValue.scaled(by: scale)
    }
    
    fileprivate func scaleFactor(from fromUnit: LengthUnit, to toUnit: LengthUnit) -> Double {
        /*
         fromUnit -> x0 -> x22
         toUnit -> x1 -> x23
         */
        var d8 = self.pointsPerMeter
        
        switch fromUnit {
        case .length(let fromLength):
            // <+44>
            switch toUnit {
            case .length(let toLength):
                // <+48>
                /*
                 toLength -> x23 -> x19
                 fromLength -> x22 -> x21
                 */
                if fromLength == toLength {
                    d8 = 1.0
                    // <+672>
                } else {
                    // <+380>
                    do {
                        let isMeters = toLength == UnitLength.meters
                        d8 = 1.0
                        if isMeters {
                            // <+504>
                        } else {
                            // <+468>
                            d8 = toLength.converter.baseUnitValue(fromValue: 1.0)
                            // <+504>
                        }
                    }
                    
                    // <+504>
                    do {
                        if fromLength == UnitLength.meters {
                            // <+672>
                        } else {
                            // <+624>
                            let d9 = fromLength.converter.baseUnitValue(fromValue: 1)
                            d8 = d8 / d9
                            // <+672>
                        }
                    }
                }
            case .points:
                // <+236>
                // fromLength -> x22 -> x19
                if fromLength == UnitLength.meters {
                    // <+552>
                    // <+672>
                } else {
                    // <+332>
                    let d9 = fromLength.converter.baseUnitValue(fromValue: 1.0)
                    d8 = d8 * d9
                    // <+672>
                }
            }
        case .points:
            // <+120>
            switch toUnit {
            case .length(let unitLength):
                // <+124>
                if unitLength == UnitLength.meters {
                    // <+220>
                    d8 = 1.0 / d8
                    // <+672>
                } else {
                    // <+568>
                    let d10 = 1.0
                    let d9 = unitLength.converter.baseUnitValue(fromValue: 1.0)
                    let d0 = d8 * d9
                    d8 = d10 / d0
                    // <+672>
                }
            case .points:
                // <+560>
                d8 = 1.0
                // <+672>
            }
        }
        
        // <+672>
        return d8
    }
}

struct PointScaleKey : BridgedEnvironmentKey {
    static var defaultValue: PointScale {
        return PointScale(pointsPerMeter: 1360)
    }
} 

extension PointScale : Equatable {
    package static func == (lhs: PointScale, rhs: PointScale) -> Bool {
        return lhs.pointsPerMeter == rhs.pointsPerMeter
    }
}
