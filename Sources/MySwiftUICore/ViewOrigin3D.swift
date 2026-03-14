internal import CoreGraphics
internal import Spatial

struct ViewOrigin3D {
    var origin2D: CGPoint
    var depthOrigin: ViewDepthOrigin
    
    init(_ size: Size3D) {
        assertUnimplemented()
    }
    
    var value: Point3D {
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
}
