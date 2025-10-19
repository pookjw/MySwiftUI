#warning("TODO")
internal import CoreGraphics

struct ViewFrame {
    private(set) var origin: CGPoint
    private(set) var size: ViewSize
}

extension ViewFrame: Animatable {
    public typealias AnimatableData = Double // TODO
}
