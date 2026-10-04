public import CoreGraphics

@frozen public struct Rectangle : Shape {
    nonisolated public func path(in rect: CGRect) -> Path {
        assertUnimplemented()
    }
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    nonisolated public var layoutDirectionBehavior: LayoutDirectionBehavior {
        assertUnimplemented()
    }
    
    @inlinable public init() {}
    
    public typealias AnimatableData = EmptyAnimatableData
    public typealias Body = _ShapeView<Rectangle, ForegroundStyle>
}

extension Shape where Self == Rectangle {
    @_alwaysEmitIntoClient public static var rect: Rectangle {
        get { .init() }
    }
}

extension Rectangle : InsettableShape {
    @inlinable nonisolated public func inset(by amount: CGFloat) -> some InsettableShape {
        return _Inset(amount: amount)
    }
    
    @usableFromInline
    @frozen internal struct _Inset : InsettableShape {
        @usableFromInline
        internal var amount: CGFloat
        
        @inlinable nonisolated internal init(amount: CGFloat) {
            self.amount = amount
        }
        
        @usableFromInline
        nonisolated internal func path(in rect: CGRect) -> Path {
            assertUnimplemented()
        }
        
        @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
        @usableFromInline
        nonisolated internal var layoutDirectionBehavior: LayoutDirectionBehavior {
            assertUnimplemented()
        }
        
        @usableFromInline
        internal var animatableData: CGFloat {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        @inlinable nonisolated internal func inset(by amount: CGFloat) -> Rectangle._Inset {
            var copy = self
            copy.amount += amount
            return copy
        }
        
        @usableFromInline
        internal typealias AnimatableData = CGFloat
        
        @usableFromInline
        internal typealias Body = _ShapeView<Rectangle._Inset, ForegroundStyle>
        
        @usableFromInline
        internal typealias InsetShape = Rectangle._Inset
    }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension Rectangle : RoundedRectangularShape {
    public func corners(in size: CGSize?) -> Rectangle.Corners? {
        assertUnimplemented()
    }
}

extension ShapeStyle where Self : View, Self.Body == _ShapeView<Rectangle, Self> {
    public var body: _ShapeView<Rectangle, Self> {
        assertUnimplemented()
    }
}

extension Rectangle : BitwiseCopyable {}
extension Rectangle._Inset : BitwiseCopyable {}
