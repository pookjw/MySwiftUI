internal import CoreGraphics
internal import Spatial

struct ViewOrigin3D {
    var origin2D: CGPoint
    var depthOrigin: ViewDepthOrigin
    
    init(_ size: Size3D) {
        fatalError("TODO")
    }
    
    var value: Point3D {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
        _modify {
            fatalError("TODO")
        }
    }
    
    subscript(_ axis: _Axis3D) -> CGFloat {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
        _modify {
            fatalError("TODO")
        }
    }
    
    static var zero: ViewOrigin3D {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
        _modify {
            fatalError("TODO")
        }
    }
}
