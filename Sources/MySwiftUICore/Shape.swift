#warning("TODO")

public protocol Shape {
    
}

public struct _ShapeView<Content: Shape, Style: ShapeStyle>: UnaryView, ShapeStyledLeafView, PrimitiveView, LeafViewLayout, ShapeView {
    public var shape: Content {
        fatalError("TODO")
    }
}

protocol ShapeStyledLeafView: ContentResponder {
    
}

public protocol ShapeView<Content>: View, _RemoveGlobalActorIsolation {
    associatedtype Content : Shape
    
    var shape: Self.Content {
        get
    }
}
