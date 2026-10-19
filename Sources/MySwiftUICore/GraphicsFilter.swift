package import CoreGraphics
private import QuartzCore
internal import _MySwiftUICoreShims

package enum GraphicsFilter {
    case blur(BlurStyle)
    case variableBlur(VariableBlurStyle)
    case displacementMap(GraphicsFilter.DisplacementMap)
    case chromaticAberrationMap(GraphicsFilter.DisplacementMap)
    case shadow(ResolvedShadowStyle)
    case projection(ProjectionTransform)
    case colorMatrix((_ColorMatrix, premultiplied: Bool))
    case colorMultiply(Color.ResolvedHDR) // 0xc800000
    case alphaMultiply(Color.ResolvedHDR) // 0x10000000
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
    
    static func updateAsync(
        layer: inout DisplayList.ViewUpdater.AsyncLayer,
        oldFilters: [GraphicsFilter],
        newFilters: [GraphicsFilter]
    ) -> Bool {
        assertUnimplemented()
    }
    
    fileprivate func makeCAFilter() -> CAFilter? {
        assertUnimplemented()
    }
}

extension GraphicsFilter : RendererEffect {
    package var animatableData: UInt8 { // TODO
        assertUnimplemented()
    }
    
    nonisolated func effectValue(size: CGSize) -> DisplayList.Effect {
        assertUnimplemented()
    }
    
    nonisolated static var isolatesChildPosition: Bool {
        assertUnimplemented()
    }
    
    nonisolated static var disabledForFlattenedContent: Bool {
        assertUnimplemented()
    }
    
    nonisolated static var preservesEmptyContent: Bool {
        assertUnimplemented()
    }
    
    nonisolated static var isScrapeable: Bool {
        assertUnimplemented()
    }
}

extension GraphicsFilter : Equatable {
    package static func == (lhs: GraphicsFilter, rhs: GraphicsFilter) -> Bool {
        assertUnimplemented()
    }
}

extension GraphicsFilter : ProtobufEncodableMessage {
    package func encode(to encoder: inout ProtobufEncoder) throws {
        assertUnimplemented()
    }
}

extension GraphicsFilter : ProtobufDecodableMessage {
    package init(from decoder: inout ProtobufDecoder) throws {
        assertUnimplemented()
    }
}

// 원래 없음
extension Array where Element == GraphicsFilter {
    var caFilters: Any {
        let array = _CAFilterArrayCreate()
        
        for element in reversed() {
            if let caFilter = element.makeCAFilter() {
                _CAFilterArrayAppend(array, caFilter)
            }
        }
        
        return array
    }
}

extension GraphicsFilter {
    package struct DisplacementMap {
        private var amount: CGFloat
        private var mask: VariableBlurStyle.Mask
    }
    
    package struct ColorMonochrome {
        private var color: Color.ResolvedHDR
        private var amount: Float
        private var bias: Float
    }
    
    package struct VibrantColorMatrix {
        private(set) var matrix: _ColorMatrix
        private(set) var maxColorComponent: Float
        private(set) var options: VibrantColorMatrix.Options
    }
    
    struct Curve {
        private var values: (Float, Float, Float, Float)
    }
    
    package struct LuminanceCurve {
        private var curve: Curve
        private var amount: Float
    }
    
    package struct ColorCurves {
        private var redCurve: GraphicsFilter.Curve
        private var greenCurve: GraphicsFilter.Curve
        private var blueCurve: GraphicsFilter.Curve
        private var opacityCurve: GraphicsFilter.Curve
    }
    
    package struct ShaderFilter {
        private var shader: Shader.ResolvedShader
        private var size: CGSize
    }
    
    package struct AlphaThreshold {
        private var color: Color.ResolvedHDR
        private var amount: Float
    }
    
    package struct EDRGainMultiply {
        private var amount: Float
        private var scale: Float
        private var isAdaptive: Bool
        private var allowsGroup: Bool
    }
    
    package struct GlassBackgroundStyle {
        private var margin: CGFloat
        private var mask: VariableBlurStyle.Mask
    }
}

extension GraphicsFilter.VibrantColorMatrix {
    struct Options : OptionSet {
        let rawValue: UInt8
    }
}

extension GraphicsFilter.DisplacementMap : Equatable, ProtobufEncodableMessage, ProtobufDecodableMessage {
    package func encode(to encoder: inout ProtobufEncoder) throws {
        assertUnimplemented()
    }
    
    package init(from decoder: inout ProtobufDecoder) throws {
        assertUnimplemented()
    }
}

extension GraphicsFilter.ColorMonochrome : Equatable, ProtobufEncodableMessage, ProtobufDecodableMessage {
    package func encode(to encoder: inout ProtobufEncoder) throws {
        assertUnimplemented()
    }
    
    package init(from decoder: inout ProtobufDecoder) throws {
        assertUnimplemented()
    }
}

extension GraphicsFilter.VibrantColorMatrix : Equatable, ProtobufEncodableMessage, ProtobufDecodableMessage {
    package func encode(to encoder: inout ProtobufEncoder) throws {
        assertUnimplemented()
    }
    
    package init(from decoder: inout ProtobufDecoder) throws {
        assertUnimplemented()
    }
}

extension GraphicsFilter.Curve : Equatable {
    static func == (lhs: borrowing GraphicsFilter.Curve, rhs: borrowing GraphicsFilter.Curve) -> Bool {
        assertUnimplemented()
    }
    
}

extension GraphicsFilter.LuminanceCurve : Equatable, ProtobufEncodableMessage, ProtobufDecodableMessage {
    package func encode(to encoder: inout ProtobufEncoder) throws {
        assertUnimplemented()
    }
    
    package init(from decoder: inout ProtobufDecoder) throws {
        assertUnimplemented()
    }
}

extension GraphicsFilter.ColorCurves : Equatable, ProtobufEncodableMessage, ProtobufDecodableMessage {
    package func encode(to encoder: inout ProtobufEncoder) throws {
        assertUnimplemented()
    }
    
    package init(from decoder: inout ProtobufDecoder) throws {
        assertUnimplemented()
    }
}

extension GraphicsFilter.ShaderFilter : Equatable, ProtobufEncodableMessage, ProtobufDecodableMessage {
    package static func == (lhs: GraphicsFilter.ShaderFilter, rhs: GraphicsFilter.ShaderFilter) -> Bool {
        assertUnimplemented()
    }
    
    package func encode(to encoder: inout ProtobufEncoder) throws {
        assertUnimplemented()
    }
    
    package init(from decoder: inout ProtobufDecoder) throws {
        assertUnimplemented()
    }
}

extension GraphicsFilter.AlphaThreshold : Equatable, ProtobufEncodableMessage, ProtobufDecodableMessage {
    package func encode(to encoder: inout ProtobufEncoder) throws {
        assertUnimplemented()
    }
    
    package init(from decoder: inout ProtobufDecoder) throws {
        assertUnimplemented()
    }
}

extension GraphicsFilter.EDRGainMultiply : Equatable, ProtobufEncodableMessage, ProtobufDecodableMessage {
    package func encode(to encoder: inout ProtobufEncoder) throws {
        assertUnimplemented()
    }
    
    package init(from decoder: inout ProtobufDecoder) throws {
        assertUnimplemented()
    }
}

extension GraphicsFilter.GlassBackgroundStyle : Equatable, ProtobufEncodableMessage, ProtobufDecodableMessage {
    package func encode(to encoder: inout ProtobufEncoder) throws {
        assertUnimplemented()
    }
    
    package init(from decoder: inout ProtobufDecoder) throws {
        assertUnimplemented()
    }
}

package struct VariableBlurStyle {
    private var radius: CGFloat
    private(set) var isOpaque: Bool
    private var dither: Bool
    private var mask: VariableBlurStyle.Mask
}

extension VariableBlurStyle {
    enum Mask {
        case image(GraphicsImage)
        case layerIndex(UInt)
        case none
    }
}

extension VariableBlurStyle : RendererEffect, Equatable, ProtobufEncodableMessage, ProtobufDecodableMessage {
    package var animatableData: CGFloat {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    nonisolated func effectValue(size: CGSize) -> DisplayList.Effect {
        assertUnimplemented()
    }
    
    package func encode(to encoder: inout ProtobufEncoder) throws {
        assertUnimplemented()
    }
    
    package init(from decoder: inout ProtobufDecoder) throws {
        assertUnimplemented()
    }
}

extension VariableBlurStyle.Mask : Equatable, ProtobufEncodableMessage, ProtobufDecodableMessage {
    func encode(to encoder: inout ProtobufEncoder) throws {
        assertUnimplemented()
    }
    
    init(from decoder: inout ProtobufDecoder) throws {
        assertUnimplemented()
    }
}
