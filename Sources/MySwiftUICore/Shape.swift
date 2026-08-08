package import CoreGraphics

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
