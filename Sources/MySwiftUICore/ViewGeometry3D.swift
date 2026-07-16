internal import Spatial

struct ViewGeometry3D {
    var origin: ViewOrigin3D
    var dimensions: ViewDimensions3D
    
    init(origin: ViewOrigin3D, dimensions: ViewDimensions3D) {
        self.origin = origin
        self.dimensions = dimensions
    }
    
    func finalizeLayoutDirection(_: LayoutDirection, parentSize: Size3D) {
        assertUnimplemented()
    }
    
    var isInvalid: Bool {
        return self.origin.value.x.isNaN
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
    
    static let invalidValue = ViewGeometry3D(
        origin: .invalidValue,
        dimensions: .invalidValue
    )
    
    static let zero: ViewGeometry3D = {
        assertUnimplemented()
    }()
}
