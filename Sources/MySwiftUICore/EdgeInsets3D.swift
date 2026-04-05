public import CoreGraphics

@frozen public struct EdgeInsets3D : Equatable {
    package static var zero: EdgeInsets3D {
        return EdgeInsets3D(top: 0, leading: 0, bottom: 0, trailing: 0, front: 0, back: 0)
    }
    
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
    package init(_all: CGFloat) {
        assertUnimplemented()
    }
    
    package var negatedInsets: EdgeInsets3D {
        return EdgeInsets3D(
            top: -top,
            leading: -leading,
            bottom: -bottom,
            trailing: -trailing,
            front: -front,
            back: -back
        )
    }
}

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension EdgeInsets3D : Sendable {}

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension EdgeInsets3D : BitwiseCopyable {}

package struct OptionalEdgeInsets3D : Equatable {
    package var top: CGFloat?
    package var leading: CGFloat?
    package var bottom: CGFloat?
    package var trailing: CGFloat?
    package var back: CGFloat?
    package var front: CGFloat?
    
    init(top: CGFloat?, leading: CGFloat?, bottom: CGFloat?, trailing: CGFloat?, front: CGFloat?, back: CGFloat?) {
        self.top = top
        self.leading = leading
        self.bottom = bottom
        self.trailing = trailing
        self.back = back
        self.front = front
    }
    
    init(_: CGFloat?, edges: Edge3D.Set) {
        assertUnimplemented()
    }
    
    init(_: EdgeInsets3D, edges: Edge3D.Set) {
        assertUnimplemented()
    }
}
