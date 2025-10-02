#warning("TODO")

public protocol ShapeStyle: Sendable {
    // TODO
}

extension Never: ShapeStyle {
    public typealias Resolved = Never
}

@usableFromInline
package class AnyShapeStyleBox: @unchecked Sendable {
    init() {}
    
    package func apply(to: inout _ShapeStyle_Shape) {
        // nop
    }
    
    package func isEqual(to other: AnyShapeStyleBox) -> Bool {
        return false
    }
}

public struct _ShapeStyle_Shape {
    
}
