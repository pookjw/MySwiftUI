package import CoreGraphics
package import Spatial

extension CGAffineTransform {
    package init(_ transform3D: AffineTransform3D) {
        let matrix = transform3D.matrix
        self.init(matrix[0][0], matrix[0][1], matrix[1][0], matrix[1][1], matrix[3][0], matrix[3][1])
    }
}
