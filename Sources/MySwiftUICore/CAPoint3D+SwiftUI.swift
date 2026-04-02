package import _QuartzCorePrivate
package import Spatial

extension CAPoint3D {
    package init(_ point: Point3D) {
        self.init(x: point.x, y: point.y, z: point.z)
    }
}
