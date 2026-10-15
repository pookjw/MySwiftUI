internal import CoreGraphics
private import simd

package struct SDFShape {
    private(set) var origin: CGPoint // 0x0
    private(set) var path: PathSet // 0x10
    private(set) var style: SDFStyle // 0x20
    private(set) var ovalization: Float // 0x28
    private(set) var options: Material.Layer.SDFLayer.Options // 0x2c
    private(set) var backdropObserver: SDFShape.BackdropObserver? // 0x30
}

extension SDFShape {
    final class BackdropObserver {
        // TODO
    }
}

indirect enum SDFStyle {
    case fill(SDFStyle.Fill)
    case stroke(SDFStyle.Stroke)
    case gradient(SDFStyle.Gradient)
    case shadow(SDFStyle.Shadow)
    case customFill(SDFStyle.CustomFill)
    case glassDisplacement(SDFStyle.GlassDisplacement)
    case glassHighlight(SDFStyle.GlassHighlight)
    case glassKeyFillHighlight(Material.Layer.SDFLayer.Contents.GlassKeyFillHighlight)
    case group(SDFStyle.Group)
    case mask(SDFStyle.Mask)
    case outputSDF(SDFStyle.OutputSDF)
}

extension SDFStyle {
    struct OutputSDF {
        private var inset: CGFloat
        private var range: ClosedRange<CGFloat>
    }
    
    struct Mask {
        private var content: SDFStyle
        private var mask: SDFStyle
    }
    
    struct Group {
        // TODO
    }
    
    struct GlassHighlight {
        private var inset: CGFloat
        private var color: Color.ResolvedHDR
        private var height: CGFloat
        private var angle: Angle
        private var curvature: CGFloat
        private var spread: Angle
        private var amount: CGFloat
        private var appliesDisplayAngle: Bool
    }
    
    struct GlassDisplacement {
        private var inset: CGFloat
        private var height: CGFloat
        private var curvature: CGFloat
        private var angle: Angle
        private var maskInset: CGFloat
    }
    
    struct CustomFill {
        // TODO
    }
    
    struct Shadow {
        private var inset: CGFloat
        private var color: Color.ResolvedHDR
        private var radius: CGFloat
        private var offset: CGSize
        private var knockout: Bool
        private var inverted: Bool
    }
    
    struct Gradient {
        private var colors: [Color.ResolvedHDR]
        private var distances: [CGFloat]
        private var interpolations: [SIMD4<Float>]
    }
    
    struct Stroke {
        private var inset: CGFloat
        private var lineWidth: CGFloat
        private var color: Color.ResolvedHDR
    }
    
    struct Fill {
        private(set) var inset: CGFloat
        private(set) var color: Color.ResolvedHDR
    }
}
