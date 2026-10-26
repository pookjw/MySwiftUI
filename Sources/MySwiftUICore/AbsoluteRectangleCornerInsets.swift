package import CoreGraphics

package struct AbsoluteRectangleCornerInsets {
    package var topLeft: CGSize
    package var topRight: CGSize
    package var bottomLeft: CGSize
    package var bottomRight: CGSize
    
    package init(_ insets: RectangleCornerInsets, layoutDirection: LayoutDirection = .leftToRight) {
        switch layoutDirection {
        case .leftToRight:
            self.topLeft = insets.topLeading
            self.topRight = insets.topTrailing
            self.bottomLeft = insets.bottomLeading
            self.bottomRight = insets.bottomTrailing
        case .rightToLeft:
            self.topLeft = insets.topTrailing
            self.topRight = insets.topLeading
            self.bottomLeft = insets.bottomTrailing
            self.bottomRight = insets.bottomLeading
        }
    }
    
    var isNonEmpty: Bool {
        assertUnimplemented()
    }
    
    func cornerPoints(in: CGRect) -> [CGPoint] {
        assertUnimplemented()
    }
}
