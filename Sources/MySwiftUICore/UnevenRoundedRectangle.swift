#warning("TODO")
public import CoreGraphics

public struct UnevenRoundedRectangle {
    public var cornerRadii: RectangleCornerRadii
    public var style: RoundedCornerStyle
    
    @inlinable public init(cornerRadii: RectangleCornerRadii, style: RoundedCornerStyle = .continuous) {
        self.cornerRadii = cornerRadii
        self.style = style
    }
    
    @_alwaysEmitIntoClient public init(topLeadingRadius: CGFloat = 0, bottomLeadingRadius: CGFloat = 0, bottomTrailingRadius: CGFloat = 0, topTrailingRadius: CGFloat = 0, style: RoundedCornerStyle = .continuous) {
        self.init(
            cornerRadii: RectangleCornerRadii(
                topLeading: topLeadingRadius,
                bottomLeading: bottomLeadingRadius,
                bottomTrailing: bottomTrailingRadius,
                topTrailing: topTrailingRadius
            ),
            style: style
        )
    }
}
