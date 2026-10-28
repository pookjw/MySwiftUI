public import CoreGraphics

public protocol InsettableShape : Shape {
    associatedtype InsetShape : InsettableShape
    nonisolated func inset(by amount: CGFloat) -> Self.InsetShape
}

extension InsettableShape {
    nonisolated public func strokeBorder(lineWidth: CGFloat = 1, antialiased: Bool = true) -> some View {
        assertUnimplemented()
    }
    
    nonisolated public func strokeBorder<S>(_ content: S, lineWidth: CGFloat = 1, antialiased: Bool = true) -> some View where S : ShapeStyle {
        assertUnimplemented()
    }
    
    nonisolated public func strokeBorder(style: StrokeStyle, antialiased: Bool = true) -> some View {
        assertUnimplemented()
    }
    
    nonisolated public func strokeBorder<S>(_ content: S, style: StrokeStyle, antialiased: Bool = true) -> some View where S : ShapeStyle {
        assertUnimplemented()
    }
}
