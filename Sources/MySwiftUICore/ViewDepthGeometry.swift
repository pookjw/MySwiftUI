internal import CoreGraphics

struct ViewDepthGeometry: Equatable, Animatable {
    var origin: ViewDepthOrigin
    var size: ViewDepth
    
    init(origin: ViewDepthOrigin, size: ViewDepth) {
        fatalError("TODO")
    }
    
    init(origin: CGFloat, size: CGFloat, proposal: CGFloat?) {
        fatalError("TODO")
    }
    
    init(origin: CGFloat, dimensions: ViewDimensions3D) {
        fatalError("TODO")
    }
    
    init(_: ClosedRange<CGFloat>, proposal: CGFloat?) {
        fatalError("TODO")
    }
    
    var isInvalid: Bool {
        fatalError("TODO")
    }
    
    var animatableData: AnimatablePair<CGFloat, CGFloat> {
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
    
    static var invalidValue: ViewDepthGeometry {
        fatalError("TODO")
    }
    
    static var zero: ViewDepthGeometry {
        fatalError("TODO")
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
