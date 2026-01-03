// 8BD8C3972A1E496A35EEE3666E0865B8

internal import CoreGraphics

struct ViewFrame: Equatable {
    private(set) var origin: CGPoint
    private(set) var size: ViewSize
    
    @inline(__always)
    init(origin: CGPoint, size: ViewSize) {
        self.origin = origin
        self.size = size
    }
    
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
    var animatableData: AnimatablePair<AnimatablePair<CGFloat, CGFloat>, AnimatablePair<CGFloat, CGFloat>> {
        get {
            return AnimatablePair(origin.animatableData, size.value.animatableData)
        }
        set {
            origin.animatableData = newValue.first
            size.value.animatableData = newValue.second
        }
        _modify {
            fatalError("TODO")
        }
    }
}
