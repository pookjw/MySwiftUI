public import CoreGraphics
public import Spatial

public protocol Shape {
    // TODO
}

public struct _ShapeView<Content : Shape, Style : ShapeStyle>: UnaryView, ShapeStyledLeafView, PrimitiveView, LeafViewLayout, ShapeView {
    public var shape: Content {
        assertUnimplemented()
    }
    
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

protocol ShapeStyledLeafView : ContentResponder {
    // TODO
}

public protocol ShapeView<Content> : View, _RemoveGlobalActorIsolation {
    associatedtype Content : Shape
    
    var shape: Self.Content {
        get
    }
}
