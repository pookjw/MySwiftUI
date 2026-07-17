internal import CoreGraphics
internal import Spatial

struct ViewOrigin3D {
    var origin2D: CGPoint
    var depthOrigin: ViewDepthOrigin
    
    init(_ point: Point3D) {
        self.origin2D = CGPoint(x: point.x, y: point.y)
        self.depthOrigin = ViewDepthOrigin(point.z)
    }
    
    var value: Point3D {
        get {
            return Point3D(
                x: self.origin2D.x,
                y: self.origin2D.y,
                z: self.depthOrigin.value
            )
        }
        set {
            self.origin2D.x = newValue.x
            self.origin2D.y = newValue.y
            self.depthOrigin.value = newValue.z
        }
    }
    
    subscript(_ axis: _Axis3D) -> CGFloat {
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
    
    static var zero: ViewOrigin3D {
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
    
    static var invalidValue: ViewOrigin3D {
        return ViewOrigin3D(Point3D(x: Double.nan, y: Double.nan, z: Double.nan))
    }
}
