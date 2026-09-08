internal import CoreGraphics

extension Color {
    public func opacity(_ opacity: Double) -> Color {
        let box = ColorBox(Color.OpacityColor(base: self, opacity: opacity))
        return Color(box: box)
    }
    
    public func mix(with rhs: Color, by fraction: Double, in colorSpace: Gradient.ColorSpace = .perceptual) -> Color {
        assertUnimplemented()
    }
}

extension Color {
    struct OpacityColor : ColorProvider {
        fileprivate private(set) var base: Color
        fileprivate private(set) var opacity: Double
        
        var tag: Color.ProviderTag {
            return .opacity
        }
        
        func resolve(in environment: EnvironmentValues) -> Color.Resolved {
            var resolved = self.base.provider.resolve(in: environment)
            resolved.opacity *= Float(self.opacity)
            return resolved
        }
        
        func resolveHDR(in environment: EnvironmentValues) -> Color.ResolvedHDR {
            var resolved = self.base.provider.resolve(in: environment)
            resolved.opacity *= Float(self.opacity)
            return Color.ResolvedHDR(resolved, headroom: nil)
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
        
        static func deserialize(from decoder: Decoder) throws -> Self {
            assertUnimplemented()
        }
        
        func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        static func == (lhs: Color.OpacityColor, rhs: Color.OpacityColor) -> Bool {
            assertUnimplemented()
        }
    }
    
    struct MixProvider {
        private var lhs: Color
        private var rhs: Color
        private var colorSpace: ResolvedGradient.ColorSpace
        private var fraction: Float
    }
}
