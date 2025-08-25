#warning("TODO")
public import CoreGraphics

@frozen public struct RectangleCornerRadii: Equatable {
    @usableFromInline package var topLeft: CGFloat
    @usableFromInline package var topRight: CGFloat
    @usableFromInline package var bottomRight: CGFloat
    @usableFromInline package var bottomLeft: CGFloat
    
    @_alwaysEmitIntoClient public var topLeading: CGFloat {
        get {
            topLeft
        }
        set {
            topLeft = newValue
        }
    }
    
    @_alwaysEmitIntoClient public var bottomLeading: CGFloat {
        get {
            bottomLeft
        }
        set {
            bottomLeft = newValue
        }
    }
    
    @_alwaysEmitIntoClient public var bottomTrailing: CGFloat {
        get {
            bottomRight
        }
        set {
            bottomRight = newValue
        }
    }
    
    @_alwaysEmitIntoClient public var topTrailing: CGFloat {
        get {
            topRight
        }
        set {
            topRight = newValue
        }
    }
    
    @usableFromInline
    package init(topLeft: CGFloat, topRight: CGFloat, bottomRight: CGFloat, bottomLeft: CGFloat) {
        self.topLeft = topLeft
        self.topRight = topRight
        self.bottomRight = bottomRight
        self.bottomLeft = bottomLeft
    }
    
    @_alwaysEmitIntoClient public init(topLeading: CGFloat = 0, bottomLeading: CGFloat = 0, bottomTrailing: CGFloat = 0, topTrailing: CGFloat = 0) {
        self.init(topLeft: topLeading, topRight: topTrailing,  bottomRight: bottomTrailing, bottomLeft: bottomLeading)
    }
}
