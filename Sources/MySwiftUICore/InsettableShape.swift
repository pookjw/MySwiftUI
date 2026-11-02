public import CoreGraphics

public protocol InsettableShape : Shape {
    associatedtype InsetShape : InsettableShape
    nonisolated func inset(by amount: CGFloat) -> Self.InsetShape
}

extension InsettableShape {
    @inlinable @_disfavoredOverload public func strokeBorder<S>(_ content: S, style: StrokeStyle, antialiased: Bool = true) -> some View where S : ShapeStyle {
        return inset(by: style.lineWidth * 0.5)
            .stroke(style: style)
            .fill(content, style: FillStyle(antialiased: antialiased))
    }
    
    @inlinable @_disfavoredOverload public func strokeBorder(style: StrokeStyle, antialiased: Bool = true) -> some View {
        return inset(by: style.lineWidth * 0.5)
            .stroke(style: style)
            .fill(style: FillStyle(antialiased: antialiased))
    }
    
    @inlinable @_disfavoredOverload public func strokeBorder<S>(_ content: S, lineWidth: CGFloat = 1, antialiased: Bool = true) -> some View where S : ShapeStyle {
        let style = StrokeStyle(lineWidth: lineWidth)
        return inset(by: style.lineWidth * 0.5)
            .stroke(style: style)
            .fill(content, style: FillStyle(antialiased: antialiased))
    }
    
    @inlinable @_disfavoredOverload public func strokeBorder(lineWidth: CGFloat = 1, antialiased: Bool = true) -> some View {
        let style = StrokeStyle(lineWidth: lineWidth)
        return inset(by: style.lineWidth * 0.5)
            .stroke(style: style)
            .fill(style: FillStyle(antialiased: antialiased))
    }
}
