internal import CoreGraphics

enum ContentStyle {}

extension ContentStyle {
    enum ID: Int8, CodableByProxy, ColorProvider, Serializable {
        case primary
        case secondary
        case tertiary
        case quaternary
        case quinary
        
        init(truncatingLevel: Int) {
            if truncatingLevel <= 4 {
                self.init(rawValue: Int8(truncatingIfNeeded: truncatingLevel))!
            } else {
                self = .quinary
            }
        }
        
        var level: Int {
            return Int(self.rawValue)
        }
        
        init?(level: Int) {
            guard let rawValue = Int8(exactly: level) else {
                return nil
            }
            
            self.init(rawValue: rawValue)
        }
        
        var tag: Color.ProviderTag {
            return ._contentStyle
        }
        
        func resolve(in environment: EnvironmentValues) -> Color.Resolved {
            assertUnimplemented()
        }
        
        func resolveHDR(in environment: EnvironmentValues) -> Color.ResolvedHDR {
            assertUnimplemented()
        }
        
        func apply(color: Color, to shape: inout _ShapeStyle_Shape) {
            assertUnimplemented()
        }
        
        var staticColor: CGColor? {
            assertUnimplemented()
        }
        
        var kitColor: AnyObject? {
            assertUnimplemented()
        }
        
        var colorDescription: String {
            assertUnimplemented()
        }
        
        func opacity(at: Int, environment: EnvironmentValues) -> Float {
            assertUnimplemented()
        }
        
        func serialize(to encoder: any Encoder) throws {
            assertUnimplemented()
        }
        
        static func deserialize(from decoder: any Decoder) throws -> ContentStyle.ID {
            assertUnimplemented()
        }
    }
    
    enum Primitive {
        case fill
        case stroke
        case separator
        case overlay
        case destructive
    }
    
    struct Style {
        private(set) var id: ContentStyle.ID
        private(set) var primitive: ContentStyle.Primitive
    }
    
    struct MaterialStyle {
        private(set) var material: Material.ResolvedMaterial
        private(set) var base: ContentStyle.Style
        
        func resolveCoreMaterialColor(in environment: EnvironmentValues) -> Color.ResolvedHDR {
            assertUnimplemented()
        }
    }
    
    // nominal type descriptor가 없음
    struct MaterialResolved {
        let material: Material.ResolvedMaterial
        let id: ContentStyle.ID
        let primitive: ContentStyle.Primitive
    }
}

extension EnvironmentValues {
    var backgroundContentStyleID: ContentStyle.ID? {
        assertUnimplemented()
    }
}
