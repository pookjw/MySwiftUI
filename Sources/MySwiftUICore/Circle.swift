public import CoreGraphics

extension Shape where Self == Circle {
    @_alwaysEmitIntoClient public static var circle: Circle {
        get { .init() }
    }
}

@frozen public struct Circle : Shape {
    nonisolated public func path(in rect: CGRect) -> Path {
        assertUnimplemented()
    }
    
    @inlinable public init() {}
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    nonisolated public var layoutDirectionBehavior: LayoutDirectionBehavior {
        assertUnimplemented()
    }
    
    public typealias AnimatableData = EmptyAnimatableData
    public typealias Body = _ShapeView<Circle, ForegroundStyle>
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
extension Circle {
    nonisolated public func sizeThatFits(_ proposal: ProposedViewSize) -> CGSize {
        let result: CGFloat
        
        if let height = proposal.height {
            if let width = proposal.width {
                result = (height < width) ? height : width
            } else {
                result = height
            }
        } else {
            if let width = proposal.width {
                result = width
            } else {
                result = 10
            }
        }
        
        return CGSize(width: result, height: result)
    }
}

extension Circle : InsettableShape {
    @inlinable nonisolated public func inset(by amount: CGFloat) -> some InsettableShape {
        return _Inset(amount: amount)
    }
    
    @usableFromInline
    @frozen internal struct _Inset : InsettableShape {
        @usableFromInline
        internal var amount: CGFloat
        
        @inlinable internal init(amount: CGFloat) {
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
        
        @inlinable nonisolated internal func inset(by amount: CGFloat) -> Circle._Inset {
            var copy = self
            copy.amount += amount
            return copy
        }
        
        @usableFromInline
        internal typealias AnimatableData = CGFloat
        
        @usableFromInline
        internal typealias Body = _ShapeView<Circle._Inset, ForegroundStyle>
        
        @usableFromInline
        internal typealias InsetShape = Circle._Inset
    }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension Circle : RoundedRectangularShape {
    public func corners(in size: CGSize?) -> Circle.Corners? {
        assertUnimplemented()
    }
}

extension Circle : BitwiseCopyable {}
extension Circle._Inset : BitwiseCopyable {}
