package import Foundation
package import Spatial
package import CoreGraphics

package enum LengthUnit: Equatable {
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
    
    package static nonisolated(unsafe) let meters = LengthUnit.length(.meters) 
}

package protocol LengthUnitConvertible {
    mutating func scale(by scale: Double)
}

extension Point3D: LengthUnitConvertible {
    package mutating func scale(by scale: Double) {
        self.x *= scale
        self.y *= scale
        self.z *= scale
        self.vector *= scale
    }
}

extension CGRect: LengthUnitConvertible {
    package mutating func scale(by scale: Double) {
        self.origin.x *= scale
        self.origin.y *= scale
        self.size.width *= scale
        self.size.height *= scale
    }
}

extension Rect3D: LengthUnitConvertible {
    package mutating func scale(by scale: Double) {
        self.uniformlyScale(by: scale)
    }
}

extension ViewTransform: LengthUnitConvertible {
    package mutating func scale(by scale: Double) {
        guard scale != 1 else {
            return
        }
        
        let transform = AffineTransform3D(scale: Size3D(width: 1, height: 1, depth: 1).scaled(by: scale))
        appendAffineTransform3D(transform, inverse: true)
    }
}

extension _ProposedSize: LengthUnitConvertible {
    mutating func scale(by scale: Double) {
        if var width {
            self.width = width * scale
        }
        
        if var height {
            self.height = height * scale
        }
    }
}

extension CGSize: LengthUnitConvertible {
    package mutating func scale(by scale: Double) {
        self.width *= scale
        self.height *= scale
    }
}

extension _ProposedSize3D: LengthUnitConvertible {
    mutating func scale(by scale: Double) {
        if var width {
            self.width = width * scale
        }
        
        if var height {
            self.height = height * scale
        }
        
        if var depth {
            self.depth = depth * scale
        }
    }
}

extension EdgeInsets3D: LengthUnitConvertible {
    package mutating func scale(by scale: Double) {
        self.top *= scale
        self.leading *= scale
        self.bottom *= scale
        self.trailing *= scale
        self.front *= scale
        self.back *= scale
    }
}
