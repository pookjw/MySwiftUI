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
        switch self {
        case .blur(let blurStyle):
            // <+268>
            return blurStyle.isIdentity
        case .variableBlur(let blurStyle):
            // <+292>
            return blurStyle.isIdentity
        case .displacementMap(let map):
            // <+132>
            return map.amount == 0
        case .chromaticAberrationMap(let map):
            // <+132>
            return map.amount == 0
        case .shadow(_):
            // <+480>
            return false
        case .projection(_):
            // <+480>
            return false
        case .colorMatrix(let colorMatrix):
            // <+388>
            return colorMatrix.0.isIdentity
        case .colorMultiply(let resolved):
            // <+184>
            return resolved == .white
        case .alphaMultiply(let resolved):
            // <+184>
            return resolved == .white
        case .hueRotation(let angle):
            // <+132>
            return angle.radians == 0
        case .saturation(let saturation):
            // <+156>
            return saturation == 1
        case .brightness(let brightness):
            // <+132>
            return brightness == 0
        case .contrast(let contrast):
            // <+156>
            return contrast == 1
        case .grayscale(let grayscale):
            // <+132>
            return grayscale == 0
        case .colorMonochrome(let colorMonochrome):
            // <+244>
            return colorMonochrome.amount == 0
        case .vibrantColorMatrix(_):
            // <+480>
            return false
        case .luminanceCurve(let luminanceCurve):
            // <+228>
            return luminanceCurve.amount == 0
        case .colorCurves(_):
            // <+480>
            return false
        case .shader(_):
            // <+480>
            return false
        case .alphaThreshold(_):
            // <+480>
            return false
        case .edrGainMultiply(_):
            // <+480>
            return false
        case .glassBackground(_):
            // <+480>
            return false
        case .caFilter(let provider):
            // <+432>
            return provider.isIdentity
        case .averageColor:
            // <+480>
            return false
        case .luminanceToAlpha:
            // <+480>
            return false
        case .colorInvert:
            // <+480>
            return false
        }
    }
    
    var changesDOD: Bool {
        assertUnimplemented()
    }
    
    func domainOfDefinition(for rect: CGRect) -> CGRect {
        switch self {
        case .blur(let style):
            // <+140>
            if style.isOpaque {
                return rect
            } else {
                var d0 = style.radius
                let d11 = rect.origin.x
                let d10 = rect.origin.y
                let d9 = rect.size.width
                let d8 = rect.size.height
                var d1: CGFloat = -2.8
                let d4 = d0 * d1
                d0 = d11
                d1 = d10
                let d2 = d9
                let d3 = d8
                let d5 = d4
                
                return CGRect(x: d0, y: d1, width: d2, height: d3)
                    .insetBy(dx: d4, dy: d5)
            }
        case .shadow(let style):
            // <+200>
            let d11 = rect.origin.x
            let d10 = rect.origin.y
            let d9 = rect.size.width
            let d8 = rect.size.height
            var d3: CGFloat = 0
            var d4: CGFloat = 0
            var d0: CGFloat = 0
            var d1: CGFloat = 0
            
            if !style.kind.contains(.inner) {
                d1 = style.offset.width
                d0 = style.offset.height
                var d2 = style.radius
                d3 = -2.8
                d2 = d2 * d3
                d3 = d0 + d2
                d4 = d1 + d2
                d0 = d2 - d0
                d1 = d2 - d1
            }
            
            // <+272>
            let sp = (d1, d0, d4, d3)
            let isNull = CGRect(x: d11, y: d10, width: d9, height: d8).isNull
            var d12 = d11
            var d13 = d10
            var d14 = d9
            var d15 = d8
            
            if isNull {
                // <+460>
            } else {
                // <+320>
                let standardized = CGRect(x: d11, y: d10, width: d9, height: d8).standardized
                d0 = standardized.origin.x
                d1 = standardized.origin.y
                var d2 = standardized.size.width
                d3 = standardized.size.height
                let d5 = sp.2
                let d6 = sp.0
                d4 = (d5 == d6) ? d6 : d5
                d12 = d4 + d0
                d4 = sp.3
                d13 = d4 + d1
                d0 = d5 + d6
                d14 = d2 - d0
                d0 = sp.1
                d0 = d4 + d0
                d15 = d3 - d0
                d0 = CGRect(x: d12, y: d13, width: d14, height: d15).width
                
                if d0 < 0 {
                    // <+444>
                    let nullRect = CGRect.null
                    d12 = nullRect.origin.x
                    d13 = nullRect.origin.y
                    d14 = nullRect.size.width
                    d15 = nullRect.size.height
                    // <+460>
                } else {
                    d0 = CGRect(x: d12, y: d13, width: d14, height: d15).height
                    
                    if !(d0 < 0.0) {
                        // <+460>
                    }  else {
                        // <+444>
                        let nullRect = CGRect.null
                        d12 = nullRect.origin.x
                        d13 = nullRect.origin.y
                        d14 = nullRect.size.width
                        d15 = nullRect.size.height
                        // <+460>
                    }
                    
                    // <+460>
                }
                
                // <+460>
            }
            
            // <+460>
            if style.kind.contains(.only) {
                // <+616>
                return CGRect(x: d12, y: d13, width: d14, height: d15)
            } else {
                // <+464>
                return CGRect(x: d12, y: d13, width: d14, height: d15)
                    .union(CGRect(x: d11, y: d10, width: d9, height: d8))
            }
        case .shader(let filter):
            // <+504>
            var d0 = filter.size.width
            let d1 = filter.size.height
            d0 = abs(d0)
            let d4 = -d0
            d0 = abs(d1)
            let d5 = -d0
            
            return rect.insetBy(dx: d4, dy: d5)
        default:
            return rect
        }
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
        fileprivate private(set) var amount: CGFloat
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
        private(set) var shader: Shader.ResolvedShader
        private(set) var size: CGSize
        
        init(shader: Shader.ResolvedShader, size: CGSize) {
            self.shader = shader
            self.size = size
        }
    }
    
    package struct AlphaThreshold {
        private(set) var color: Color.ResolvedHDR
        private(set) var amount: Float
        
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
    private(set) var radius: CGFloat
    private(set) var isOpaque: Bool
    private(set) var dither: Bool
    private(set) var mask: VariableBlurStyle.Mask
    
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
