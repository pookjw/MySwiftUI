internal import Spatial

struct ViewGeometry3D {
    var origin: ViewOrigin3D
    var dimensions: ViewDimensions3D
    
    init(origin: ViewOrigin3D, dimensions: ViewDimensions3D) {
        assertUnimplemented()
    }
    
    func finalizeLayoutDirection(_: LayoutDirection, parentSize: Size3D) {
        assertUnimplemented()
    }
    
    var isInvalid: Bool {
        assertUnimplemented()
    }
    
    var frame: Rect3D {
        assertUnimplemented()
    }
    
    var depthGeometry: ViewDepthGeometry {
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
    
    static let invalidValue: ViewGeometry3D = {
        assertUnimplemented()
    }()
    
    static let zero: ViewGeometry3D = {
        assertUnimplemented()
    }()
}
