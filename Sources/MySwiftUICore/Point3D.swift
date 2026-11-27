package import _QuartzCorePrivate
package import CoreGraphics
package import Spatial

extension Point3D {
    package init(_ point: CAPoint3D) {
        self.init(x: point.x, y: point.y, z: point.z)
    }
    
    package init(_ point: Point3D) {
        assertUnimplemented()
    }
    
    package init(_ size: CGSize) {
        assertUnimplemented()
    }
    
    package init(_ point: CGPoint) {
        assertUnimplemented()
    }
    
    package init(_ point: CGPoint, z: CGFloat) {
        assertUnimplemented()
    }
    
    package init(_ size: CGSize, z: CGFloat) {
        assertUnimplemented()
    }
    
    init(_: (), point: Point3D) {
        assertUnimplemented()
    }
    
    func values() -> (CGFloat, CGFloat, CGFloat) {
        assertUnimplemented()
    }
    
    subscript(axis: Axis) -> CGFloat {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    subscript(axis: _Axis3D) -> CGFloat {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    var magnitude: CGFloat {
        assertUnimplemented()
    }
    
    var magnitudeSquared: Double {
        assertUnimplemented()
    }
    
    static var nan: Point3D {
        assertUnimplemented()
    }
    
    var flushingNaNs: Point3D {
        assertUnimplemented()
    }
    
    func normalized() -> Point3D {
        assertUnimplemented()
    }
    
    func squaredDistance(to point: Point3D) -> Double {
        assertUnimplemented()
    }
    
    func offset(by size: Size3D) -> Point3D {
        assertUnimplemented()
    }
    
    func offset(by insets: EdgeInsets3D) -> Point3D {
        assertUnimplemented()
    }
    
    func offsetBy(dx: CGFloat) -> Point3D {
        assertUnimplemented()
    }
    
    func offsetBy(dy: CGFloat) -> Point3D {
        assertUnimplemented()
    }
    
    func offsetBy(dz: CGFloat) -> Point3D {
        assertUnimplemented()
    }
    
    func offsetBy(dx: CGFloat, dy: CGFloat) -> Point3D {
        assertUnimplemented()
    }
    
    func offsetBy(dx: CGFloat, dz: CGFloat) -> Point3D {
        assertUnimplemented()
    }
    
    func offsetBy(dy: CGFloat, dz: CGFloat) -> Point3D {
        assertUnimplemented()
    }
    
    func offsetBy(dx: CGFloat, dy: CGFloat, dz: CGFloat) -> Point3D {
        assertUnimplemented()
    }
    
    static func * (lhs: Point3D, rhs: Double) -> Point3D {
        assertUnimplemented()
    }
    
    static func + (lhs: Point3D, rhs: Double) -> Point3D {
        assertUnimplemented()
    }
    
    static func - (lhs: Point3D, rhs: Double) -> Point3D {
        assertUnimplemented()
    }
    
    static func += (lhs: inout Point3D, rhs: Point3D) {
        assertUnimplemented()
    }
    
    static func += (lhs: inout Point3D, rhs: Double) {
        assertUnimplemented()
    }
    
    static func -= (lhs: inout Point3D, rhs: Point3D) {
        assertUnimplemented()
    }
    
    static func -= (lhs: inout Point3D, rhs: Double) {
        assertUnimplemented()
    }
    
    static func *= (lhs: inout Point3D, rhs: Double) {
        assertUnimplemented()
    }
    
    static func /= (lhs: inout Point3D, rhs: Double) {
        assertUnimplemented()
    }
    
    static func * (lhs: Point3D, rhs: Transform3D) -> Point3D {
        assertUnimplemented()
    }
    
    static func * (lhs: Transform3D, rhs: Point3D) -> Point3D {
        assertUnimplemented()
    }
    
    func applying(_ transform: Transform3D) -> Point3D {
        assertUnimplemented()
    }
    
    func unapplying(_ transform: Transform3D) -> Point3D {
        assertUnimplemented()
    }
    
    func _applying(_ transform: AffineTransform3D) -> Point3D {
        assertUnimplemented()
    }
    
    func _unapplying(_ transform: AffineTransform3D) -> Point3D {
        assertUnimplemented()
    }
    
    func _rotation(to point: Point3D) -> Rotation3D {
        assertUnimplemented()
    }
    
    func elementWiseMaximum(_ x: CGFloat, _ y: CGFloat, _ z: CGFloat) -> Point3D {
        assertUnimplemented()
    }
    
    func elementWiseMinimum(_ x: CGFloat, _ y: CGFloat, _ z: CGFloat) -> Point3D {
        assertUnimplemented()
    }
}

extension Point3D : Animatable {
    package var animatableData: Vector3D {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

extension Point3D : ViewTransformable {
    mutating func convert(to space: CoordinateSpace, transform: ViewTransform) {
        assertUnimplemented()
    }
    
    mutating func convert(from space: CoordinateSpace, transform: ViewTransform) {
        assertUnimplemented()
    }
    
    mutating func convertGlobal(to space: CoordinateSpace, transform: ViewTransform) {
        assertUnimplemented()
    }
    
    mutating func convertGlobal(from space: CoordinateSpace, transform: ViewTransform) {
        assertUnimplemented()
    }
}

extension CGPoint {
    init(_ point: Point3D) {
        assertUnimplemented()
    }
}

extension SIMD3 where Scalar == Double {
    init(_ point: Point3D) {
        assertUnimplemented()
    }
}
