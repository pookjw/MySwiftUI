// 2E38714EE3D49E99F9CCE13BC14BB103

public import CoreGraphics

public struct ScrollGeometry : Equatable, Sendable {
    public var contentOffset: CGPoint { // 0x0
        didSet {
            visibleRect.origin.x += contentOffset.x - oldValue.x
            visibleRect.origin.y += contentOffset.y - oldValue.y
        }
    }
    public var contentSize: CGSize // 0x10
    public var contentInsets: EdgeInsets // 0x20
    public var containerSize: CGSize { // 0x40
        didSet {
            visibleRect.size.width += containerSize.width - oldValue.width
            visibleRect.size.height += containerSize.height - oldValue.height
        }
    }
    public var visibleRect: CGRect // 0x50
    
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
