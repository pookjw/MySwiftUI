package import Spatial
package import QuartzCore

extension AffineTransform3D {
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
                matrix: simd_float4x3(
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
