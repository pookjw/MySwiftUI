package import Spatial
package import CoreRE
private import simd
package import QuartzCore

extension AffineTransform3D {
    package init(_ srt: CoreRE::SRT) {
        /*
         srt -> x0 -> x20
         return pointer -> x8 -> x19
         */
        // sp + 0x20
        let size = Size3D(
            width: Double(srt.s.x),
            height: Double(srt.s.y),
            depth: Double(srt.s.z)
        )
        // sp
        let roation = Rotation3D(
            simd_quatd(
                real: Double(srt.r.real),
                imag: SIMD3<Double>(srt.r.imag)
            )
        )
        
        // sp + 0x40
        let point = Point3D(
            simd_double3(Double(srt.t.x), Double(srt.t.x), Double(srt.t.z))
        )
        
        // sp + 0x80
        let copy_1 = size
        // sp + 0x60
        let copy_2 = roation
        
        let transform = AffineTransform3D(scale: copy_1, rotation: copy_2, translation: Vector3D(point))
        self = transform
    }
    
    var isValid: Bool {
        return self.columns.0.x.isFinite &&
        self.columns.0.y.isFinite &&
        self.columns.0.z.isFinite &&
        self.columns.1.x.isFinite &&
        self.columns.1.y.isFinite &&
        self.columns.1.z.isFinite &&
        self.columns.2.x.isFinite &&
        self.columns.2.y.isFinite &&
        self.columns.2.z.isFinite &&
        self.columns.3.x.isFinite &&
        self.columns.3.y.isFinite &&
        self.columns.3.z.isFinite
    }
    
    var is3DTransform: Bool {
        // x29 - 0x20
        let translation = self.translation
        
        if translation.z != 0 {
            return true
        }
        
        // sp + 0x20
        if let rotation {
            if (rotation.axis.x != 0) || (rotation.axis.y != 0) {
                // <+100>
                if abs(rotation.angle.degrees.remainder(dividingBy: 360)) < Double(bitPattern: 0x3e50000000000000) {
                    // <+148>
                } else {
                    // <+180>
                    return true
                }
            } else {
                // <+148>
            }
        } else {
            // <+148>
        }
        
        // <+148>
        return self.scale.depth != 1
    }
    
    package init(_ transform3D: CATransform3D) {
        if CGFloat.NativeType.self == Double.self {
            self.init(
                matrix: simd_double4x3(
                    SIMD3(Double(transform3D.m11), Double(transform3D.m12), Double(transform3D.m13)),
                    SIMD3(Double(transform3D.m21), Double(transform3D.m22), Double(transform3D.m23)),
                    SIMD3(Double(transform3D.m31), Double(transform3D.m32), Double(transform3D.m33)),
                    SIMD3(Double(transform3D.m41), Double(transform3D.m42), Double(transform3D.m43))
                )
            )
        } else if CGFloat.NativeType.self == Float.self {
            self.init(
                simd_float4x3(
                    SIMD3(Float(transform3D.m11), Float(transform3D.m12), Float(transform3D.m13)),
                    SIMD3(Float(transform3D.m21), Float(transform3D.m22), Float(transform3D.m23)),
                    SIMD3(Float(transform3D.m31), Float(transform3D.m32), Float(transform3D.m33)),
                    SIMD3(Float(transform3D.m41), Float(transform3D.m42), Float(transform3D.m43))
                )
            )
        } else {
            fatalError()
        }
    }
}

extension CGAffineTransform {
    package init(_ transform3D: AffineTransform3D) {
        let matrix = transform3D.matrix
        self.init(matrix[0][0], matrix[0][1], matrix[1][0], matrix[1][1], matrix[3][0], matrix[3][1])
    }
}
