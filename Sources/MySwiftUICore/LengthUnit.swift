// 38667C00BFB8EED8C379D726121E1265
package import Foundation
package import Spatial
internal import CoreGraphics

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

package protocol LengthUnitConvertible {
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
        unsafe self.vector *= scale
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
        self.uniformlyScale(by: scale)
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

extension PointScale {
    fileprivate func scaleFactor(from: LengthUnit, to: LengthUnit) -> Double {
        return self.convert(1.0, from: from, to: to)
    }
}
