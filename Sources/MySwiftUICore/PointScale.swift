#warning("TODO")
package import CoreGraphics

extension EnvironmentValues {
    package var pointScale: PointScale {
        get {
            return self[PointScaleKey.self]
        }
        set {
            self[PointScaleKey.self] = newValue
        }
    }
}

package struct PointScale {
    package var pointsPerMeter: CGFloat
    
    package init(pointsPerMeter: CGFloat) {
        self.pointsPerMeter = pointsPerMeter
    }
    
    package func convert<T: LengthUnitConvertible>(_ fromValue: T, to unit: LengthUnit) -> T {
        fatalError("TODO")
    }
}

struct PointScaleKey: EnvironmentKey {
    static var defaultValue: PointScale {
        return PointScale(pointsPerMeter: 1280)
    }
} 
