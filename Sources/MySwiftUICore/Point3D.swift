package import _QuartzCorePrivate
package import Spatial

extension Point3D {
    package init(_ point: CAPoint3D) {
        self.init(x: point.x, y: point.y, z: point.z)
    }
}
