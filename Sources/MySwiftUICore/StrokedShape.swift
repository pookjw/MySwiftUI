public import CoreGraphics

extension Shape {
    @inlinable nonisolated public func stroke(style: StrokeStyle) -> some Shape {
        return _StrokedShape(shape: self, style: style)
    }
    
    @inlinable nonisolated public func stroke(lineWidth: CGFloat = 1) -> some Shape {
        return stroke(style: StrokeStyle(lineWidth: lineWidth))
    }
}

@frozen public struct _StrokedShape<S> : Shape where S : Shape {
    public var shape: S
    public var style: StrokeStyle
    
    @inlinable public init(shape: S, style: StrokeStyle) {
        self.shape = shape
        self.style = style
    }
    
    nonisolated public func path(in rect: CGRect) -> Path {
        let path = self.shape.path(in: rect)
        return path.strokedPath(self.style)
    }
    
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    nonisolated public static var role: ShapeRole {
        return .stroke
    }
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    nonisolated public var layoutDirectionBehavior: LayoutDirectionBehavior {
        return self.shape.layoutDirectionBehavior
    }
    
    public typealias AnimatableData = AnimatablePair<S.AnimatableData, StrokeStyle.AnimatableData>
    
    public var animatableData: _StrokedShape<S>.AnimatableData {
        get {
            return AnimatableData(self.shape.animatableData, self.style.animatableData)
        }
        set {
            self.shape.animatableData = newValue.first
            self.style.animatableData = newValue.second
        }
    }
    
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    nonisolated public func sizeThatFits(_ proposal: ProposedViewSize) -> CGSize {
        return self.shape.sizeThatFits(proposal)
    }
    
    public typealias Body = _ShapeView<_StrokedShape<S>, ForegroundStyle>
}
