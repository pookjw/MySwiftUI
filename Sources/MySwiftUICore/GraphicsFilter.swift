// 07401C2C9845FAA2984B0D65D34F2B64
package import CoreGraphics
private import QuartzCore
private import simd
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
    
    var isIdentity: Bool {
        assertUnimplemented()
    }
    
    var changesDOD: Bool {
        assertUnimplemented()
    }
    
    func domainOfDefinition(for rect: CGRect) -> CGRect {
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
        private(set) var color: Color.ResolvedHDR
        private(set) var amount: Float
        private(set) var bias: Float
        
        package init(color: Color.ResolvedHDR, amount: Float, bias: Float) {
            self.color = color
            self.amount = amount
            self.bias = bias
        }
    }
    
    package struct VibrantColorMatrix {
        private(set) var matrix: _ColorMatrix
        private var maxColorComponent: Float
        private var options: VibrantColorMatrix.Options
        
        init(
            _ matrix: _ColorMatrix,
            maxColorComponent: Float = .infinity,
            options: VibrantColorMatrix.Options = []
        ) {
            self.matrix = matrix
            self.maxColorComponent = maxColorComponent
            self.options = options
        }
    }
    
    package struct Curve {
        private(set) var values: (Float, Float, Float, Float)
        
        package init(_ values: (Float, Float, Float, Float)) {
            self.values = values
        }
        
        package init(_ vector: SIMD4<Float>) {
            self.values = (vector.x, vector.y, vector.z, vector.w)
        }
    }
    
    package struct LuminanceCurve {
        private(set) var curve: GraphicsFilter.Curve
        private(set) var amount: Float
        
        init(curve: Curve, amount: Float) {
            self.curve = curve
            self.amount = amount
        }
    }
    
    package struct ColorCurves {
        private(set) var redCurve: GraphicsFilter.Curve
        private(set) var greenCurve: GraphicsFilter.Curve
        private(set) var blueCurve: GraphicsFilter.Curve
        private(set) var opacityCurve: GraphicsFilter.Curve
        
        init(
            redCurve: GraphicsFilter.Curve,
            greenCurve: GraphicsFilter.Curve,
            blueCurve: GraphicsFilter.Curve,
            opacityCurve: GraphicsFilter.Curve
        ) {
            self.redCurve = redCurve
            self.greenCurve = greenCurve
            self.blueCurve = blueCurve
            self.opacityCurve = opacityCurve
        }
    }
    
    package struct ShaderFilter {
        private var shader: Shader.ResolvedShader
        private var size: CGSize
        
        init(shader: Shader.ResolvedShader, size: CGSize) {
            self.shader = shader
            self.size = size
        }
    }
    
    package struct AlphaThreshold {
        private var color: Color.ResolvedHDR
        private var amount: Float
        
        init(color: Color.ResolvedHDR, amount: Float) {
            self.color = color
            self.amount = amount
        }
    }
    
    package struct EDRGainMultiply {
        private var amount: Float
        private var scale: Float
        private var isAdaptive: Bool
        private var allowsGroup: Bool
        
        package init(
            amount: Float = 0,
            scale: Float = 1,
            isAdaptive: Bool = false,
            allowsGroup: Bool = true
        ) {
            self.amount = amount
            self.scale = scale
            self.isAdaptive = isAdaptive
            self.allowsGroup = allowsGroup
        }
    }
    
    package struct GlassBackgroundStyle {
        private var margin: CGFloat
        private var mask: VariableBlurStyle.Mask
    }
}

extension GraphicsFilter.VibrantColorMatrix {
    package struct Options : OptionSet {
        package let rawValue: UInt8
        
        package init(rawValue: UInt8) {
            self.rawValue = rawValue
        }
    }
}

extension GraphicsFilter.DisplacementMap : Equatable, ProtobufEncodableMessage, ProtobufDecodableMessage {
    package static func == (lhs: GraphicsFilter.DisplacementMap, rhs: GraphicsFilter.DisplacementMap) -> Bool {
        assertUnimplemented()
    }
    
    package func encode(to encoder: inout ProtobufEncoder) throws {
        assertUnimplemented()
    }
    
    package init(from decoder: inout ProtobufDecoder) throws {
        assertUnimplemented()
    }
}

extension GraphicsFilter.ColorMonochrome : Equatable, ProtobufEncodableMessage, ProtobufDecodableMessage {
    package static func == (lhs: GraphicsFilter.ColorMonochrome, rhs: GraphicsFilter.ColorMonochrome) -> Bool {
        assertUnimplemented()
    }
    
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
    package static func == (lhs: borrowing GraphicsFilter.Curve, rhs: borrowing GraphicsFilter.Curve) -> Bool {
        assertUnimplemented()
    }
    
}

extension GraphicsFilter.LuminanceCurve : Equatable, ProtobufEncodableMessage, ProtobufDecodableMessage {
    package static func == (lhs: GraphicsFilter.LuminanceCurve, rhs: GraphicsFilter.LuminanceCurve) -> Bool {
        assertUnimplemented()
    }
    
    package func encode(to encoder: inout ProtobufEncoder) throws {
        assertUnimplemented()
    }
    
    package init(from decoder: inout ProtobufDecoder) throws {
        assertUnimplemented()
    }
}

extension GraphicsFilter.ColorCurves : Equatable, ProtobufEncodableMessage, ProtobufDecodableMessage {
    package static func == (lhs: GraphicsFilter.ColorCurves, rhs: GraphicsFilter.ColorCurves) -> Bool {
        assertUnimplemented()
    }
    
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
    package static func == (lhs: GraphicsFilter.AlphaThreshold, rhs: GraphicsFilter.AlphaThreshold) -> Bool {
        assertUnimplemented()
    }
    
    package func encode(to encoder: inout ProtobufEncoder) throws {
        assertUnimplemented()
    }
    
    package init(from decoder: inout ProtobufDecoder) throws {
        assertUnimplemented()
    }
}

extension GraphicsFilter.EDRGainMultiply : Equatable, ProtobufEncodableMessage, ProtobufDecodableMessage {
    package static func == (lhs: GraphicsFilter.EDRGainMultiply, rhs: GraphicsFilter.EDRGainMultiply) -> Bool {
        assertUnimplemented()
    }
    
    package func encode(to encoder: inout ProtobufEncoder) throws {
        assertUnimplemented()
    }
    
    package init(from decoder: inout ProtobufDecoder) throws {
        assertUnimplemented()
    }
}

extension GraphicsFilter.GlassBackgroundStyle : Equatable, ProtobufEncodableMessage, ProtobufDecodableMessage {
    package static func == (lhs: GraphicsFilter.GlassBackgroundStyle, rhs: GraphicsFilter.GlassBackgroundStyle) -> Bool {
        assertUnimplemented()
    }
    
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
    
    init(radius: CGFloat = 0, isOpaque: Bool = false, dither: Bool = false, mask: VariableBlurStyle.Mask = .none) {
        self.radius = radius
        self.isOpaque = isOpaque
        self.dither = dither
        self.mask = mask
    }
    
    var caFilterRadius: CGFloat {
        assertUnimplemented()
    }
    
    var isIdentity: Bool {
        assertUnimplemented()
    }
}

extension VariableBlurStyle {
    package enum Mask {
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
    
    package static func == (lhs: VariableBlurStyle, rhs: VariableBlurStyle) -> Bool {
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
    package static func == (lhs: VariableBlurStyle.Mask, rhs: VariableBlurStyle.Mask) -> Bool {
        assertUnimplemented()
    }
    
    package func encode(to encoder: inout ProtobufEncoder) throws {
        assertUnimplemented()
    }
    
    package init(from decoder: inout ProtobufDecoder) throws {
        assertUnimplemented()
    }
    
    private func setCAFilterInput(of filter: CAFilter) {
        assertUnimplemented()
    }
}
