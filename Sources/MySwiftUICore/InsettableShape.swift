public import CoreGraphics

public protocol InsettableShape : Shape {
    associatedtype InsetShape : InsettableShape
    nonisolated func inset(by amount: CGFloat) -> Self.InsetShape
}
