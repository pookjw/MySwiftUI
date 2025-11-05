#warning("TODO")
package import CoreGraphics

package struct AbsoluteRectangleCornerInsets {
    package var topLeading: CGSize
    package var topTrailing: CGSize
    package var bottomLeading: CGSize
    package var bottomTrailing: CGSize
    
    @inline(__always)
    package init(_ insets: RectangleCornerInsets, layoutDirection: LayoutDirection = .leftToRight) {
        switch layoutDirection {
        case .leftToRight:
            self.topLeading = insets.topLeading
            self.topTrailing = insets.topTrailing
            self.bottomLeading = insets.bottomLeading
            self.bottomTrailing = insets.bottomTrailing
        case .rightToLeft:
            self.topLeading = insets.topTrailing
            self.topTrailing = insets.topLeading
            self.bottomLeading = insets.bottomTrailing
            self.bottomTrailing = insets.bottomLeading
        }
    }
}
