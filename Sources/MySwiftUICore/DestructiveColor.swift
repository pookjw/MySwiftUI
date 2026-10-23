// 39A1E6D323BAD370653EC12D368D864E
internal import CoreGraphics

extension Color {
    static let _destructive = Color(box: ColorBox(DestructiveColorProvider()))
}

struct DestructiveColorProvider : ColorProvider {
    var tag: Color.ProviderTag {
        assertUnimplemented()
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
    
    static func deserialize(from decoder: any Decoder) throws -> DestructiveColorProvider {
        assertUnimplemented()
    }
}
