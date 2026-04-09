// 38667C00BFB8EED8C379D726121E1265
package import CoreGraphics
private import Foundation

extension EnvironmentValues {
    package var pointScale: PointScale {
        get {
            return self[PointScaleKey.self]
        }
        set {
            self[PointScaleKey.self] = newValue
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
        return PointScale(pointsPerMeter: 1280)
    }
} 
