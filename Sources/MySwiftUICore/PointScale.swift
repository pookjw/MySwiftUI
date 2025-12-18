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
    
    package func convert<T: LengthUnitConvertible>(_ fromValue: T, to unit: LengthUnit) -> T {
        fatalError("TODO")
    }
}

struct PointScaleKey: BridgedEnvironmentKey {
    static var defaultValue: PointScale {
        return PointScale(pointsPerMeter: 1280)
    }
} 
