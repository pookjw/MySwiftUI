// BE30CA4BBA5F98638AD9D34F1557FB4D
#if SwiftUICompatibility
private import SwiftUI
#endif

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
@frozen public struct HierarchicalShapeStyle : ShapeStyle {
    package var id: UInt32
    
    public static let primary = HierarchicalShapeStyle(id: 0)
    public static let secondary = HierarchicalShapeStyle(id: 1)
    public static let tertiary = HierarchicalShapeStyle(id: 2)
    public static let quaternary = HierarchicalShapeStyle(id: 3)
    
    public func _apply(to shape: inout _ShapeStyle_Shape) {
        /*
         self -> x20
         shape -> x0 -> x19
         */
        if case .primaryStyle = shape.operation {
            // <+148>
            shape.result = .style(HierarchicalShapeStyle.sharedPrimary)
        } else {
            // <+64>
            if shape.activeRecursiveStyles.contains(.content) {
                // <+104>
                LegacyContentStyle.sharedPrimary._apply(to: &shape)
            } else {
                // <+72>
                shape.activeRecursiveStyles.formUnion(.content)
                
                if let foregroundStyle = shape.foregroundStyle ?? shape.environment.currentForegroundStyle {
                    // <+248>
                    if let primaryStyle = foregroundStyle.primaryStyle(in: shape.environment) {
                        self.apply(primaryStyle, to: &shape)
                    } else {
                        self.apply(foregroundStyle, to: &shape)
                    }
                    
                    // <+324>
                } else {
                    // <+364>
                    if shape.role == .separator {
                        SeparatorShapeStyle()._apply(to: &shape)
                        // <+324>
                    } else {
                        // <+388>
                        if let material = shape.environment.backgroundMaterial {
                            // <+492>
                            self.apply(ForegroundMaterialStyle(material: material), to: &shape)
                        } else {
                            self.apply(SystemColorsStyle(), to: &shape)
                        }
                        
                        // <+324>
                    }
                }
                
                // <+324>
                if shape.activeRecursiveStyles.contains(.content) {
                    shape.activeRecursiveStyles.subtract(.content)
                }
            }
        }
    }
    
    public static func _apply(to type: inout _ShapeStyle_ShapeType) {
        assertUnimplemented()
    }
    
    @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
    public typealias Resolved = Never
    
    static let sharedPrimary = AnyShapeStyle(HierarchicalShapeStyle.primary)
    
//    fileprivate func apply<T : ShapeStyle>(_: T, to: inout _ShapeStyle_Shape) {
//        assertUnimplemented()
//    }
    
    fileprivate func apply(_ style: ForegroundMaterialStyle, to shape: inout _ShapeStyle_Shape) {
        assertUnimplemented()
    }
    
    fileprivate func apply(_ style: SystemColorsStyle, to shape: inout _ShapeStyle_Shape) {
        assertUnimplemented()
    }
    
    fileprivate func apply(_ style: AnyShapeStyle, to shape: inout _ShapeStyle_Shape) {
        assertUnimplemented()
    }
}

@available(iOS 16.0, macOS 12.0, macCatalyst 15.0, tvOS 17.0, watchOS 10.0, *)
extension HierarchicalShapeStyle {
    public static let quinary = HierarchicalShapeStyle(id: 4)
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension HierarchicalShapeStyle : BitwiseCopyable {}
