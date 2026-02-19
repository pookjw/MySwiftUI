
@usableFromInline
package class AnyShapeStyle: @unchecked Sendable/*, ShapeStyle*/ {
    package var storage: AnyShapeStyle.Storage
    
    init<T: ShapeStyle>(_: T) {
        fatalError("TODO")
    }
}

extension AnyShapeStyle {
    package struct Storage: Equatable {
        package static func == (lhs: AnyShapeStyle.Storage, rhs: AnyShapeStyle.Storage) -> Bool {
            return lhs.box.isEqual(to: rhs.box)
        }
        
        var box: AnyShapeStyleBox
    }
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
