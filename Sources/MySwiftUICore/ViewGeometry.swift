internal import CoreGraphics

struct ViewGeometry : Equatable, Animatable {
    nonisolated(unsafe) static let invalidValue = unsafe ViewGeometry(
        origin: CGPoint(x: CGFloat.nan, y: CGFloat.nan),
        dimensions: .invalidValue
    )
    
    nonisolated(unsafe) static let zero = unsafe ViewGeometry(origin: .zero, dimensions: .zero)
    
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
        self.origin = CGPoint(
            x: placement.anchorPosition.x - placement.anchor.x * dimensions.size.width,
            y: placement.anchorPosition.y - placement.anchor.y * dimensions.size.height
        )
        self.dimensions = dimensions
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
        return origin.x.isNaN
    }
    
    subscript(_ alignment: HorizontalAlignment) -> CGFloat {
        assertUnimplemented()
    }
    
    subscript(_ alignment: VerticalAlignment) -> CGFloat {
        assertUnimplemented()
    }
    
    subscript(_ key: AlignmentKey) -> CGFloat {
        assertUnimplemented()
    }
    
    subscript(explicit: HorizontalAlignment) -> CGFloat? {
        assertUnimplemented()
    }
    
    subscript(explicit: VerticalAlignment) -> CGFloat? {
        assertUnimplemented()
    }
    
    subscript(explicit: AlignmentKey) -> CGFloat? {
        assertUnimplemented()
    }
}
