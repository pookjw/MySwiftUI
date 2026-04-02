package import CoreGraphics

package struct EdgeOutsets3D : Equatable, Sendable {
    package var top: CGFloat
    package var leading: CGFloat
    package var bottom: CGFloat
    package var trailing: CGFloat
    package var front: CGFloat
    package var back: CGFloat
    
    package static var zero: EdgeOutsets3D {
        return EdgeOutsets3D(top: 0, leading: 0, bottom: 0, trailing: 0, front: 0, back: 0)
    }
    
    var insets3D: EdgeInsets3D {
        return EdgeInsets3D(top: top, leading: leading, bottom: bottom, trailing: trailing, front: front, back: back)
    }
    
    mutating func xFlipIfRightToLeft(layoutDirection: () -> LayoutDirection) {
        let leading = leading
        let trailing = trailing
        
        guard leading != trailing else {
            return
        }
        
        let direction = layoutDirection()
        if direction == .rightToLeft {
            self.leading = trailing
            self.trailing = leading
        }
    }
}
