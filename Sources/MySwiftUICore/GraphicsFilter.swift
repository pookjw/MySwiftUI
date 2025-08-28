#warning("TODO")
private import CoreGraphics

enum GraphicsFilter {
    case blur(BlurStyle)
    case variableBlur(VariableBlurStyle)
    case displacementMap(GraphicsFilter.DisplacementMap)
    case chromaticAberrationMap(GraphicsFilter.DisplacementMap)
    case shadow(ResolvedShadowStyle)
    case projection(ProjectionTransform)
    case colorMatrix((_ColorMatrix, premultiplied: Bool))
    case colorMultiply(Color.ResolvedHDR)
    case alphaMultiply(Color.ResolvedHDR)
    case hueRotation(Angle)
    case saturation(Double)
    case brightness(Double)
    case contrast(Double)
    case grayscale(Double)
    case colorMonochrome(GraphicsFilter.ColorMonochrome)
    case vibrantColorMatrix(GraphicsFilter.VibrantColorMatrix)
    case luminanceCurve(GraphicsFilter.LuminanceCurve)
    case colorCurves(GraphicsFilter.ColorCurves)
    case shader(GraphicsFilter.ShaderFilter)
    case alphaThreshold(GraphicsFilter.AlphaThreshold)
    case edrGainMultiply(GraphicsFilter.EDRGainMultiply)
    case glassBackground(GraphicsFilter.GlassBackgroundStyle)
    case caFilter(AnyCAFilterProvider)
    case averageColor
    case luminanceToAlpha
    case colorInvert
}

extension GraphicsFilter {
    struct DisplacementMap {
        private var amount: CGFloat
        private var mask: VariableBlurStyle.Mask
    }
    
    struct ColorMonochrome {
        private var color: Color.ResolvedHDR
        private var amount: Float
        private var bias: Float
    }
    
    struct VibrantColorMatrix {
        private var matrix: _ColorMatrix
        private var maxColorComponent: Float
        private var options: VibrantColorMatrix.Options
    }
    
    struct Curve {
        private var values: (Float, Float, Float, Float)
    }
    
    struct LuminanceCurve {
        private var curve: Curve
        private var amount: Float
    }
    
    struct ColorCurves {
        private var redCurve: GraphicsFilter.Curve
        private var greenCurve: GraphicsFilter.Curve
        private var blueCurve: GraphicsFilter.Curve
        private var opacityCurve: GraphicsFilter.Curve
    }
    
    struct ShaderFilter {
        private var shader: Shader.ResolvedShader
        private var size: CGSize
    }
    
    struct AlphaThreshold {
        private var color: Color.ResolvedHDR
        private var amount: Float
    }
    
    struct EDRGainMultiply {
        private var amount: Float
        private var scale: Float
        private var isAdaptive: Bool
        private var allowsGroup: Bool
    }
    
    struct GlassBackgroundStyle {
        private var margin: CGFloat
        private var mask: VariableBlurStyle.Mask
    }
}

extension GraphicsFilter.VibrantColorMatrix {
    struct Options: OptionSet {
        let rawValue: UInt8
    }
}
