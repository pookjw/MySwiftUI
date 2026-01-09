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
    
    var animatableData: .AnimatablePair<CGFloat, CGFloat> {
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

struct ViewDepthOrigin {
    private var value: CGFloat
}
