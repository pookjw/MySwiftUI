#warning("TODO")
private import CoreGraphics

struct ViewFrame {
    private var origin: CGPoint
    private var size: ViewSize
}

extension ViewFrame: Animatable {
    public typealias AnimatableData = Double // TODO
}
