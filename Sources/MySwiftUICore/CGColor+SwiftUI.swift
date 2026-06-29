internal import CoreGraphics

extension CGColor : ColorProvider {
    var tag: Color.ProviderTag {
        return .coreGraphics
    }
    
    func resolve(in environment: EnvironmentValues) -> Color.Resolved {
        assertUnimplemented()
    }
    
    func resolveHDR(in environment: EnvironmentValues) -> Color.ResolvedHDR {
        if let resolved = Color.Resolved(failableCGColor: self) {
            var contentHeadroom: Float? = self.contentHeadroom
            if contentHeadroom == 0 {
                contentHeadroom = nil
            }
            
            return Color.ResolvedHDR(resolved, headroom: contentHeadroom)
        } else {
            return Color
                .ResolvedHDR(
                    Color
                        .Resolved(
                            linearRed: 0,
                            linearGreen: 0,
                            linearBlue: 0,
                            opacity: 0
                        ),
                    headroom: nil
                )
        }
    }
    
    func apply(color: Color, to: inout _ShapeStyle_Shape) {
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
    
    static func deserialize(from decoder: any Decoder) throws -> Self {
        assertUnimplemented()
    }
}
