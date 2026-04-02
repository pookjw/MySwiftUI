// 2E38714EE3D49E99F9CCE13BC14BB103

public import CoreGraphics

public struct ScrollGeometry : Equatable, Sendable {
    public var contentOffset: CGPoint
    public var contentSize: CGSize
    public var contentInsets: EdgeInsets
    public var containerSize: CGSize
    public var visibleRect: CGRect
    
    public var bounds: CGRect {
        assertUnimplemented()
    }
    
    static var zero: ScrollGeometry {
        return ScrollGeometry(contentOffset: .zero, contentSize: .zero, contentInsets: .zero, containerSize: .zero, visibleRect: .zero)
    }
    
    static func viewTransform(contentInsets: EdgeInsets, contentSize: CGSize, containerSize: CGSize) -> ScrollGeometry {
        assertUnimplemented()
    }
    
    package static func rootViewTransform(contentOffset: CGPoint, containerSize: CGSize) -> ScrollGeometry {
        return ScrollGeometry(
            contentOffset: contentOffset,
            contentSize: CGSize(width: CGFloat.infinity, height: CGFloat.infinity),
            contentInsets: .zero,
            containerSize: containerSize,
            visibleRect: CGRect(origin: contentOffset, size: containerSize)
        )
    }
    
    static func size(_ size: CGSize) -> ScrollGeometry {
        assertUnimplemented()
    }
    
    mutating func applyLayoutDirection(_: LayoutDirection, contentSize: CGSize?) {
        assertUnimplemented()
    }
    
    mutating func translate(by: CGSize, limit: CGSize) {
        assertUnimplemented()
    }
    
    mutating func outsetForAX(limit: CGSize) {
        assertUnimplemented()
    }
}

extension ScrollGeometry {
    public init(contentOffset: CGPoint, contentSize: CGSize, contentInsets: EdgeInsets, containerSize: CGSize) {
        assertUnimplemented()
    }
}

extension ScrollGeometry : CustomDebugStringConvertible {
    public var debugDescription: String {
        assertUnimplemented()
    }
}
