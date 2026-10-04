// C5308685324599C90E2F7A588812BB29

@usableFromInline
package struct AnyShapeStyle : @unchecked Sendable/*, ShapeStyle*/ {
    package var storage: AnyShapeStyle.Storage
    
    init<T : ShapeStyle>(_ style: T) {
        if let casted = style as? AnyShapeStyle {
            self.storage = casted.storage
        } else if let casted = style as? Color {
            self.storage = AnyShapeStyle.Storage(box: casted.provider)
        } else if let casted = style as? AnyGradient {
            self.storage = AnyShapeStyle.Storage(box: casted.provider)
        } else {
            self.storage = AnyShapeStyle.Storage(box: ShapeStyleBox(style))
        }
    }
}

extension AnyShapeStyle {
    package struct Storage : Equatable {
        package static func == (lhs: AnyShapeStyle.Storage, rhs: AnyShapeStyle.Storage) -> Bool {
            if lhs.box === rhs.box {
                return true
            }
            return lhs.box.isEqual(to: rhs.box)
        }
        
        var box: AnyShapeStyleBox
    }
}

@usableFromInline
package class AnyShapeStyleBox : @unchecked Sendable {
    init() {}
    
    func apply(to: inout _ShapeStyle_Shape) {
        // noop
    }
    
    func isEqual(to other: AnyShapeStyleBox) -> Bool {
        return false
    }
}

extension ShapeStyle {
    package func copyStyle(
        name: _ShapeStyle_Name = .foreground,
        in environment: EnvironmentValues,
        foregroundStyle: AnyShapeStyle?
    ) -> AnyShapeStyle {
        /*
         self -> x20
         name -> x0 -> x29 - 0xc0
         environment -> x1 -> x23/x24
         foregroundStyle -> x2
         */
        var shape = _ShapeStyle_Shape(
            operation: .copyStyle(name: name),
            result: .none,
            environment: environment,
            foregroundStyle: foregroundStyle,
            bounds: nil,
            role: .fill,
            substrate: nil
        )
        
        self._apply(to: &shape)
        
        if case .style(let style) = shape.result {
            return style
        } else {
            return AnyShapeStyle(self)
        }
    }
}

package enum _ShapeStyle_Name {
    case foreground
    case background
    case multicolor
}

fileprivate final class ShapeStyleBox<T : ShapeStyle> : AnyShapeStyleBox, @unchecked Sendable {
    let base: T
    
    init(_ base: T) {
        self.base = base
    }
    
    override func apply(to: inout _ShapeStyle_Shape) {
        assertUnimplemented()
    }
    
    override func isEqual(to other: AnyShapeStyleBox) -> Bool {
        assertUnimplemented()
    }
}
