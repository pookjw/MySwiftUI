// BEFE9363F68E039B4AB6422B8AA4535A

@usableFromInline
package class AnyShapeStyle : @unchecked Sendable/*, ShapeStyle*/ {
    package var storage: AnyShapeStyle.Storage
    
    init<T : ShapeStyle>(_: T) {
        assertUnimplemented()
    }
}

extension AnyShapeStyle {
    package struct Storage : Equatable {
        package static func == (lhs: AnyShapeStyle.Storage, rhs: AnyShapeStyle.Storage) -> Bool {
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

extension EnvironmentValues {
    package var defaultForegroundStyle: AnyShapeStyle? {
        get {
            return self[DefaultForegroundStyleKey.self]
        }
        set {
            self[DefaultForegroundStyleKey.self] = newValue
        }
    }
}

fileprivate struct DefaultForegroundStyleKey : EnvironmentKey {
    static var defaultValue: AnyShapeStyle? {
        return nil
    }
}

extension ShapeStyle {
    package func copyStyle(
        name: _ShapeStyle_Name = .foreground,
        in environment: EnvironmentValues,
        foregroundStyle: AnyShapeStyle?
    ) -> AnyShapeStyle {
        assertUnimplemented()
    }
}

package enum _ShapeStyle_Name {
    case foreground
    case background
    case multicolor
}
