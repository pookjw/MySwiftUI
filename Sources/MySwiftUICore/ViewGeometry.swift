internal import CoreGraphics

struct ViewGeometry: Equatable, Animatable {
    static nonisolated(unsafe) let invalidValue: ViewGeometry = {
        fatalError("TODO")
    }()
    
    static nonisolated(unsafe) let zero: ViewGeometry = {
        fatalError("TODO")
    }()
    
    var origin: CGPoint
    var dimensions: ViewDimensions
    
    init(origin: CGPoint, dimensions: ViewDimensions) {
        self.origin = origin
        self.dimensions = dimensions
    }
    
    init(dimensions: ViewDimensions) {
        self.origin = .zero
        self.dimensions = dimensions
    }
    
    init(placement: _Placement, dimensions: ViewDimensions) {
        fatalError("TODO")
    }
    
    mutating func finalizeLayoutDirection(_ layoutDirection: LayoutDirection, parentSize: CGSize) {
        guard layoutDirection == .rightToLeft else {
            return
        }
        
        origin.x = (parentSize.width - frame.maxX)
    }
    
    var frame: CGRect {
        return CGRect(origin: origin, size: dimensions.size.value)
    }
    
    var animatableData: AnimatablePair<AnimatablePair<CGFloat, CGFloat>, AnimatablePair<CGFloat, CGFloat>> {
        get {
            return AnimatableData(origin.animatableData, dimensions.size.animatableData)
        }
        set {
            origin.animatableData = newValue.first
            dimensions.size.animatableData = newValue.second
        }
    }
    
    var isInvalid: Bool {
        fatalError("TODO")
    }
    
    subscript(_ alignment: HorizontalAlignment) -> CGFloat {
        fatalError("TODO")
    }
    
    subscript(_ alignment: VerticalAlignment) -> CGFloat {
        fatalError("TODO")
    }
    
    subscript(_ key: AlignmentKey) -> CGFloat {
        fatalError("TODO")
    }
    
    subscript(explicit: HorizontalAlignment) -> CGFloat? {
        fatalError("TODO")
    }
    
    subscript(explicit: VerticalAlignment) -> CGFloat? {
        fatalError("TODO")
    }
    
    subscript(explicit: AlignmentKey) -> CGFloat? {
        fatalError("TODO")
    }
}
