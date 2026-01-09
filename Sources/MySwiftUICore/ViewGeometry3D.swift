internal import Spatial

struct ViewGeometry3D {
    var origin: ViewOrigin3D
    var dimensions: ViewDimensions3D
    
    init(origin: ViewOrigin3D, dimensions: ViewDimensions3D) {
        fatalError("TODO")
    }
    
    func finalizeLayoutDirection(_: LayoutDirection, parentSize: Size3D) {
        fatalError("TODO")
    }
    
    var isInvalid: Bool {
        fatalError("TODO")
    }
    
    var frame: Rect3D {
        fatalError("TODO")
    }
    
    var depthGeometry: ViewDepthGeometry {
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
    
    static let invalidValue: ViewGeometry3D = {
        fatalError("TODO")
    }()
    
    static let zero: ViewGeometry3D = {
        fatalError("TODO")
    }()
}
