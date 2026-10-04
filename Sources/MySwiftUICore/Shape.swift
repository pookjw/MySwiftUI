public import CoreGraphics
public import Spatial

public protocol Shape {
    // TODO
}

@frozen public struct _ShapeView<Content : Shape, Style : ShapeStyle>: UnaryView, ShapeStyledLeafView, PrimitiveView, LeafViewLayout {
    public var shape: Content
    public var style: Style
    public var fillStyle: FillStyle
    
    @inlinable public init(shape: Content, style: Style, fillStyle: FillStyle = FillStyle()) {
        self.shape = shape
        self.style = style
        self.fillStyle = fillStyle
    }
    
    public nonisolated static func _makeView(view: _GraphValue<_ShapeView<Content, Style>>, inputs: _ViewInputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    public typealias Body = Never
    
    package func sizeThatFits(in proposedSize: _ProposedSize) -> CGSize {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func contains(points: UnsafeBufferPointer<Point3D>, size: CGSize) -> BitVector64 {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func contentPath(size: CGSize) -> Path {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func contentPath(size: CGSize, kind: ContentShapeKinds) -> Path {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension _ShapeView : Sendable {
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension _ShapeView : ShapeView {
}

protocol ShapeStyledLeafView : ContentResponder {
    // TODO
}

public protocol ShapeView<Content> : View, _RemoveGlobalActorIsolation {
    associatedtype Content : Shape
    
    var shape: Self.Content {
        get
    }
}
