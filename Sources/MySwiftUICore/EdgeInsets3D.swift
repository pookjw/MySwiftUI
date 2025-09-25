#warning("TODO")
public import CoreGraphics

@frozen public struct EdgeInsets3D: Equatable {
    public var top: CGFloat
    public var leading: CGFloat
    public var bottom: CGFloat
    public var trailing: CGFloat
    public var front: CGFloat
    public var back: CGFloat
    
    @_alwaysEmitIntoClient public init(horizontal: CGFloat = 0, vertical: CGFloat = 0, depth: CGFloat = 0) {
        (leading, trailing) = (horizontal, horizontal)
        (top, bottom) = (vertical, vertical)
        (front, back) = (depth, depth)
    }
    
    @_alwaysEmitIntoClient public init(top: CGFloat = 0, leading: CGFloat = 0, bottom: CGFloat = 0, trailing: CGFloat = 0, front: CGFloat = 0, back: CGFloat = 0) {
        self.top = top
        self.leading = leading
        self.bottom = bottom
        self.trailing = trailing
        self.front = front
        self.back = back
    }
}

extension EdgeInsets3D {
    @usableFromInline
    package init(_all: CoreFoundation.CGFloat) {
        fatalError("TODO")
    }
}
