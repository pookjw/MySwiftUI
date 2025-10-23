// 8BD8C3972A1E496A35EEE3666E0865B8

#warning("TODO")
internal import CoreGraphics

struct ViewFrame: Equatable {
    private(set) var origin: CGPoint
    private(set) var size: ViewSize
    
    @inline(__always)
    mutating func round(toMultipleOf multiple: CGFloat) {
        roundCoordinatesToNearestOrUp(toMultipleOf: multiple)
    }
    
    private mutating func roundCoordinatesToNearestOrUp(toMultipleOf multiple: CGFloat) {
        var rect = CGRect(origin: origin, size: size.value)
        rect.roundCoordinatesToNearestOrUp(toMultipleOf: multiple)
        self.origin = rect.origin
        self.size.value = rect.size
    }
}

extension ViewFrame: Animatable {
    public typealias AnimatableData = Double // TODO
}
