internal import CoreGraphics

struct ViewDepthGeometry: Equatable, Animatable {
    var origin: ViewDepthOrigin
    var size: ViewDepth
    
    init(origin: ViewDepthOrigin, size: ViewDepth) {
        assertUnimplemented()
    }
    
    init(origin: CGFloat, size: CGFloat, proposal: CGFloat?) {
        assertUnimplemented()
    }
    
    init(origin: CGFloat, dimensions: ViewDimensions3D) {
        assertUnimplemented()
    }
    
    init(_: ClosedRange<CGFloat>, proposal: CGFloat?) {
        assertUnimplemented()
    }
    
    var isInvalid: Bool {
        assertUnimplemented()
    }
    
    var animatableData: AnimatablePair<CGFloat, CGFloat> {
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
    
    static var invalidValue: ViewDepthGeometry {
        assertUnimplemented()
    }
    
    static var zero: ViewDepthGeometry {
        assertUnimplemented()
    }
}

struct ViewDepthOrigin: Equatable, Animatable {
    var value: CGFloat
    
    init(_ value: CGFloat) {
        self.value = value
    }
    
    static var invalidValue: ViewDepthOrigin {
        return ViewDepthOrigin(.nan)
    }
    
    static var zero: ViewDepthOrigin {
        return ViewDepthOrigin(0)
    }
    
    var isInvalid: Bool {
        return !value.isFinite
    }
    
    var animatableData: CGFloat {
        get {
            return value
        }
        set {
            value = newValue
        }
        _modify {
            yield &value
        }
    }
}
