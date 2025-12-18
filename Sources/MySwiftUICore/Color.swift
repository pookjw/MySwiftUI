
package import Foundation
public import CoreGraphics

public struct Color: View, Hashable, CustomStringConvertible, Sendable {
    public static nonisolated func == (lhs: Color, rhs: Color) -> Bool {
        if ObjectIdentifier(lhs.provider) == ObjectIdentifier(rhs.provider) {
            return true
        }
        return lhs.provider.isEqual(to: rhs.provider)
    }
    
    package var provider: AnyColorBox
    
    package nonisolated init(_platformColor: NSObject & NSSecureCoding, definition: PlatformColorDefinition.Type) {
        self.provider = ColorBox(UIKitPlatformColorProvider(platformColor: _platformColor))
    }
    
    package nonisolated init(box: AnyColorBox) {
        self.provider = box
    }
    
    package nonisolated init(_ resolved: Color.ResolvedHDR) {
        self.provider = ColorBox(ResolvedColorProvider(color: resolved))
    }
    
    package init(_ resolved: Color.Resolved) {
        fatalError("TODO")
    }
    
    public nonisolated var description: String {
        fatalError("TODO")
    }
    
    public nonisolated func hash(into hasher: inout Hasher) {
        provider.hash(into: &hasher)
    }
}

extension Color: ShapeStyle {
    public nonisolated func resolve(in environment: EnvironmentValues) -> Color.Resolved {
        fatalError("TODO")
    }
    
    @_alwaysEmitIntoClient public static nonisolated func _makeView<S>(view: _GraphValue<_ShapeView<S, Color>>, inputs: _ViewInputs) -> _ViewOutputs where S : Shape {
        _ShapeView<S, Self>._makeView(view: view, inputs: inputs)
    }
}

extension Color: EnvironmentalView {
    func body(environment: EnvironmentValues) -> ColorView {
        let resolvedHDR = provider.resolveHDR(in: environment)
        let dynamicRange: Image.DynamicRange
        if let headroom = resolvedHDR.headroom, headroom > 1 {
            dynamicRange = environment.effectiveAllowedDynamicRange(explicitRange: nil)
        } else {
            dynamicRange = Image.DynamicRange(storage: .standard)
        }
        
        return ColorView(resolvedHDR, allowedDynamicRange: dynamicRange)
    }
}

extension Color: Paint {
    typealias ResolvedPaintType = Never // TODO
}

extension Color: Serializable {}

@usableFromInline
package class AnyColorBox : AnyShapeStyleBox, @unchecked Sendable {
    package func hash(into hasher: inout Hasher) {
        fatalError() // abstract
    }
    
    package func resolveHDR(in environment: EnvironmentValues) -> Color.ResolvedHDR {
        fatalError() // abstract
    }
}

final class ColorBox<T: ColorProvider>: AnyColorBox, @unchecked Sendable {
    private let base: T
    
    init(_ base: T) {
        self.base = base
    }
    
    override func resolveHDR(in environment: EnvironmentValues) -> Color.ResolvedHDR {
        return base.resolveHDR(in: environment)
    }
}

struct ResolvedColorProvider: Hashable, ColorProvider {
    private var color: Color.ResolvedHDR
    
    init(color: Color.ResolvedHDR) {
        self.color = color
    }
    
    var tag: Color.ProviderTag {
        return .accent
    }
    
    func resolve(in: EnvironmentValues) -> Color.Resolved {
        return color.base
    }
    
    func resolveHDR(in: EnvironmentValues) -> Color.ResolvedHDR {
        return color
    }
    
    func apply(color: Color, to: inout _ShapeStyle_Shape) {
        fatalError("TODO")
    }
    
    var staticColor: CGColor? {
        fatalError("TODO")
    }
    
    var kitColor: AnyObject? {
        fatalError("TODO")
    }
    
    var colorDescription: String {
        fatalError("TODO")
    }
    
    func opacity(at: Int, environment: EnvironmentValues) -> Float {
        fatalError("TODO")
    }
}

protocol ColorProvider: Serializable {
    var tag: Color.ProviderTag { get }
    func resolve(in: EnvironmentValues) -> Color.Resolved
    func resolveHDR(in: EnvironmentValues) -> Color.ResolvedHDR
    func apply(color: Color, to: inout _ShapeStyle_Shape)
    var staticColor: CGColor? { get }
    var kitColor: AnyObject? { get }
    var colorDescription: String { get }
    func opacity(at: Int, environment: EnvironmentValues) -> Float
}

protocol PlatformColorProvider: ColorProvider {}

extension Color {
    enum ProviderTag {
        case platform(Color.ProviderTag.PlatformTag)
        case custom
        case customHDR
        case foreground
        case _background
        case accent
        case constant
        case p3
        case _contentStyle
        case system
        case _keyColor
        case _customKeyColor
        case _tintAdjustment
        case _desaturation
        case gradient
        case named
        case opacity
        case _settingOpacity
        case _hierarchicalOpacity
        case _destinationOver
        case mix
        case coreGraphics
        case uiKitColor
        case appKitColor
        case _destructive
        case headroom
        case linearScale
        
        // TODO: CodingKeys
    }
}

extension Color.ProviderTag {
    struct PlatformTag {
        var tag: Color.ProviderTag.AnyPlatformTag
    }
    
    class AnyPlatformTag {}
}

extension Color {
    public struct Resolved: Hashable, ShapeStyle, CustomStringConvertible, Animatable, Codable {
        @safe static nonisolated(unsafe) var legacyInterpolation = !isLinkedOnOrAfter(.v6)
        
        public var linearRed: Float
        public var linearGreen: Float
        public var linearBlue: Float
        public var opacity: Float
        
        public init(_ resolved: Color.Resolved) {
            fatalError("TODO")
        }
        
        init(linearRed: Float, linearGreen: Float, linearBlue: Float, opacity: Float) {
            self.linearRed = linearRed
            self.linearGreen = linearGreen
            self.linearBlue = linearBlue
            self.opacity = opacity
        }
        
        public var description: String {
            fatalError("TODO")
        }
        
        public var animatableData: AnimatablePair<Float, AnimatablePair<Float, AnimatablePair<Float, Float>>> {
            get {
                var r: Float
                var g: Float
                var b: Float
                var a: Float
                if Color.Resolved.legacyInterpolation {
                    r = linearRed
                    g = linearGreen
                    b = linearBlue
                    a = opacity
                } else {
                    let color = ResolvedGradient.ColorSpace.perceptual.convertIn(self)
                    r = color.r
                    g = color.g
                    b = color.b
                    a = color.a
                }
                
                r.applyUnitScale()
                g.applyUnitScale()
                b.applyUnitScale()
                a.applyUnitScale()
                
                return AnimatablePair(r, AnimatablePair(g, AnimatablePair(b, a)))
            }
            set {
                var r = newValue.first
                var g = newValue.second.first
                var b = newValue.second.second.first
                var a = newValue.second.second.second
                
                r.unapplyUnitScale()
                g.unapplyUnitScale()
                b.unapplyUnitScale()
                a.unapplyUnitScale()
                
                if Color.Resolved.legacyInterpolation {
                    self.linearRed = r
                    self.linearGreen = g
                    self.linearBlue = b
                    self.opacity = a
                } else {
                    let color = ResolvedGradient.ColorSpace.InterpolatableColor(r: r, g: g, b: b, a: a)
                    self = ResolvedGradient.ColorSpace.perceptual.convertOut(color)
                }
            }
        }
        
        public init(colorSpace: Color.RGBColorSpace = .sRGB, red: Float, green: Float, blue: Float, opacity: Float = 1) {
            fatalError("TODO")
        }
        
        public init(_ colorSpace: Color.RGBColorSpace = .sRGB, white: Double, opacity: Double = 1) {
            fatalError("TODO")
        }
        
        public init(hue: Double, saturation: Double, brightness: Double, opacity: Double = 1) {
            fatalError("TODO")
        }
        
        public var red: Float {
            get {
                fatalError("TODO")
            }
            set {
                fatalError("TODO")
            }
        }
        
        public var green: Float {
            get {
                fatalError("TODO")
            }
            set {
                fatalError("TODO")
            }
        }
        
        public var blue: Float {
            get {
                fatalError("TODO")
            }
            set {
                fatalError("TODO")
            }
        }
    }
}

extension Color.Resolved: BitwiseCopyable {}

extension Color {
    @frozen public struct ResolvedHDR: Hashable, Sendable {
        @usableFromInline var base: Color.Resolved
        @usableFromInline var _headroom: Float
        
        @_alwaysEmitIntoClient public init(_ color: Color.Resolved, headroom: Float? = nil) {
            base = color
            _headroom = headroom ?? .nan
        }
        
        static var clear: Color.ResolvedHDR {
            return Color.ResolvedHDR(
                Color.Resolved(linearRed: 0, linearGreen: 0, linearBlue: 0, opacity: 0),
                headroom: 0
            )
        }
        
        static var black: Color.ResolvedHDR {
            return Color.ResolvedHDR(
                Color.Resolved(linearRed: 0, linearGreen: 0, linearBlue: 0, opacity: 1),
                headroom: .nan
            )
        }
        
        static var white: Color.ResolvedHDR {
            return Color.ResolvedHDR(
                Color.Resolved(linearRed: 1, linearGreen: 1, linearBlue: 1, opacity: 1),
                headroom: .nan
            )
        }
        
        @_alwaysEmitIntoClient public var linearRed: Float {
            get {
                return base.linearRed
            }
            set {
                base.linearRed = newValue
            }
        }
        
        @_alwaysEmitIntoClient public var linearGreen: Float {
            get {
                return base.linearGreen
            }
            set {
                base.linearGreen = newValue
            }
        }
        
        @_alwaysEmitIntoClient public var linearBlue: Float {
            get {
                return base.linearBlue
            }
            set {
                base.linearBlue = newValue
            }
        }
        
        @_alwaysEmitIntoClient public var red: Float {
            get {
                return base.red
            }
            set {
                base.red = newValue
            }
        }
        
        @_alwaysEmitIntoClient public var green: Float {
            get {
                return base.green
            }
            set {
                base.green = newValue
            }
        }
        
        @_alwaysEmitIntoClient public var blue: Float {
            get {
                return base.blue
            }
            set {
                base.blue = newValue
            }
        }
        
        @_alwaysEmitIntoClient public var opacity: Float {
            get {
                return base.opacity
            }
            set {
                base.opacity = newValue
            }
        }
        
        public var cgColor: CGColor? {
            fatalError("TODO")
        }
        
        @_alwaysEmitIntoClient public var headroom: Float? {
            get {
                return _headroom == _headroom ? _headroom : nil
            }
            set {
                _headroom = newValue ?? .nan
            }
        }
    }
}

extension Color.ResolvedHDR: BitwiseCopyable, ShapeStyle {}

extension Color {
    public static nonisolated let red: Color = {
        fatalError("TODO")
    }()
    
    public static nonisolated let orange: Color = {
        fatalError("TODO")
    }()
    
    public static nonisolated let yellow: Color = {
        fatalError("TODO")
    }()
    
    public static nonisolated let green: Color = {
        fatalError("TODO")
    }()
    
    public static nonisolated let mint: Color = {
        fatalError("TODO")
    }()
    
    public static nonisolated let teal: Color = {
        fatalError("TODO")
    }()
    
    public static nonisolated let cyan: Color = {
        fatalError("TODO")
    }()
    
    public static nonisolated let blue = Color(box: ColorBox(SystemColorType.blue))
    
    public static nonisolated let indigo: Color = {
        fatalError("TODO")
    }()
    
    public static nonisolated let purple: Color = {
        fatalError("TODO")
    }()
    
    public static nonisolated let pink: Color = {
        fatalError("TODO")
    }()
    
    public static nonisolated let brown: Color = {
        fatalError("TODO")
    }()
    
    public static nonisolated let white = Color(.white)
    
    public static nonisolated let gray: Color = {
        fatalError("TODO")
    }()
    
    public static nonisolated let black = Color(.black)
    
    public static nonisolated let clear = Color(.clear)
    
    public static nonisolated let primary: Color = {
        fatalError("TODO")
    }()
    
    public static nonisolated let secondary: Color = {
        fatalError("TODO")
    }()
    
    package static nonisolated let _background: Color = {
        fatalError("TODO")
    }()
}

enum SystemColorType: CodableSerializable, Hashable, ColorProvider, Codable {
    case red
    case orange
    case yellow
    case green
    case teal
    case mint
    case cyan
    case blue
    case indigo
    case purple
    case pink
    case brown
    case gray
    case primary
    case secondary
    case tertiary
    case quaternary
    case quinary
    case primaryFill
    case secondaryFill
    case tertiaryFill
    case quaternaryFill
    
    var tag: Color.ProviderTag {
        fatalError("TODO")
    }
    
    func resolve(in: EnvironmentValues) -> Color.Resolved {
        fatalError("TODO")
    }
    
    func resolveHDR(in: EnvironmentValues) -> Color.ResolvedHDR {
        fatalError("TODO")
    }
    
    func apply(color: Color, to: inout _ShapeStyle_Shape) {
        fatalError("TODO")
    }
    
    var staticColor: CGColor? {
        fatalError("TODO")
    }
    
    var kitColor: AnyObject? {
        fatalError("TODO")
    }
    
    var colorDescription: String {
        fatalError("TODO")
    }
    
    func opacity(at: Int, environment: EnvironmentValues) -> Float {
        fatalError("TODO")
    }
    
    // TODO: CodingKeys
    
    
}

struct UIKitPlatformColorProvider: PlatformColorProvider, Hashable, Serializable {
    private var platformColor: (NSObject & NSSecureCoding)
    
    init(platformColor: NSObject & NSSecureCoding) {
        self.platformColor = platformColor
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(platformColor)
    }
    
    static func == (lhs: UIKitPlatformColorProvider, rhs: UIKitPlatformColorProvider) -> Bool {
        return lhs.platformColor.isEqual(rhs.platformColor)
    }
    
    var tag: Color.ProviderTag {
        fatalError("TODO")
    }
    
    func resolve(in: EnvironmentValues) -> Color.Resolved {
        fatalError("TODO")
    }
    
    func resolveHDR(in: EnvironmentValues) -> Color.ResolvedHDR {
        fatalError("TODO")
    }
    
    func apply(color: Color, to: inout _ShapeStyle_Shape) {
        fatalError("TODO")
    }
    
    var staticColor: CGColor? {
        fatalError("TODO")
    }
    
    var kitColor: AnyObject? {
        fatalError("TODO")
    }
    
    var colorDescription: String {
        fatalError("TODO")
    }
    
    func opacity(at: Int, environment: EnvironmentValues) -> Float {
        fatalError("TODO")
    }
}

extension ShapeStyle where Self == Color {
    @_alwaysEmitIntoClient public static var red: Color {
        return .red
    }
    
    @_alwaysEmitIntoClient public static var orange: Color {
        return .orange
    }
    
    @_alwaysEmitIntoClient public static var yellow: Color {
        return .yellow
    }
    
    @_alwaysEmitIntoClient public static var green: Color {
        return .green
    }
    
    @_alwaysEmitIntoClient public static var mint: Color {
        return .mint
    }
    
    @_alwaysEmitIntoClient public static var teal: Color {
        return .teal
    }
    
    @_alwaysEmitIntoClient public static var cyan: Color {
        return .cyan
    }
    
    @_alwaysEmitIntoClient public static var blue: Color {
        return .blue
    }
    
    @_alwaysEmitIntoClient public static var indigo: Color {
        return .indigo
    }
    
    @_alwaysEmitIntoClient public static var purple: Color {
        return .purple
    }
    
    @_alwaysEmitIntoClient public static var pink: Color {
        return .pink
    }
    
    @_alwaysEmitIntoClient public static var brown: Color {
        return .brown
    }
    
    @_alwaysEmitIntoClient public static var white: Color {
        return .white
    }
    
    @_alwaysEmitIntoClient public static var gray: Color {
        return .gray
    }
    
    @_alwaysEmitIntoClient public static var black: Color {
        return .black
    }
    
    @_alwaysEmitIntoClient public static var clear: Color {
        return .clear
    }
}

struct ColorView: ResolvedPaint, RendererLeafView {
    private(set) var color: Color.ResolvedHDR
    private(set) var isAntialiased: Bool
    @safe private(set) nonisolated(unsafe) var allowedDynamicRange: Image.DynamicRange
    
    static nonisolated func == (lhs: ColorView, rhs: ColorView) -> Bool {
        fatalError("TODO")
    }
    
    static nonisolated func _makeView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        /*
         $s7SwiftUI9ColorViewV05_makeD04view6inputsAA01_D7OutputsVAA11_GraphValueVyACG_AA01_D6InputsVtFZ
         inlined
         */
        let view = makeAnimatable(value: view, inputs: inputs.base)
        return makeLeafView(view: _GraphValue(view), inputs: inputs)
    }
    
    fileprivate init(_ color: Color.ResolvedHDR, isAntialiased: Bool = true, allowedDynamicRange: Image.DynamicRange = Image.DynamicRange(storage: .standard)) {
        self.color = color
        self.isAntialiased = isAntialiased
        self.allowedDynamicRange = allowedDynamicRange
    }
    
    nonisolated var animatableData: Color.ResolvedHDR._Animatable {
        get {
            let animatableData = color.base.animatableData
            return Color.ResolvedHDR._Animatable(color: animatableData, headroom: color._headroom)
        }
        set {
            color.base.animatableData = newValue.color
            color._headroom = newValue.headroom
        }
    }
    
    static var requiresMainThread: Bool {
        fatalError("TODO")
    }
    
    func content() -> DisplayList.Content.Value {
        return .color(self)
    }
}

extension EnvironmentValues {
    func effectiveAllowedDynamicRange(hdrContent: Bool, explicitRange: Image.DynamicRange?) -> Image.DynamicRange {
        fatalError("TODO")
    }
    
    func effectiveAllowedDynamicRange(explicitRange: Image.DynamicRange?) -> Image.DynamicRange {
        fatalError("TODO")
    }
}

extension Color {
    public enum RGBColorSpace: Sendable, Hashable {
        case sRGB
        case sRGBLinear
        case displayP3
    }
}

extension Color.ResolvedHDR {
    struct _Animatable: VectorArithmetic, Equatable {
        static func += (lhs: inout Color.ResolvedHDR._Animatable, rhs: Color.ResolvedHDR._Animatable) {
            fatalError("TODO")
        }
        
        static func + (lhs: Color.ResolvedHDR._Animatable, rhs: Color.ResolvedHDR._Animatable) -> Color.ResolvedHDR._Animatable {
            fatalError("TODO")
        }
        
        static func -= (lhs: inout Color.ResolvedHDR._Animatable, rhs: Color.ResolvedHDR._Animatable) {
            fatalError("TODO")
        }
        
        static func - (lhs: Color.ResolvedHDR._Animatable, rhs: Color.ResolvedHDR._Animatable) -> Color.ResolvedHDR._Animatable {
            fatalError("TODO")
        }
        
        static var zero: Color.ResolvedHDR._Animatable {
            fatalError("TODO")
        }
        
        fileprivate private(set) var color: AnimatablePair<Float, AnimatablePair<Float, AnimatablePair<Float, Float>>>
        fileprivate private(set) var headroom: Float
        
        fileprivate init(color: AnimatablePair<Float, AnimatablePair<Float, AnimatablePair<Float, Float>>>, headroom: Float) {
            self.color = color
            self.headroom = headroom
        }
        
        mutating func scale(by rhs: Double) {
            fatalError("TODO")
        }
        
        var magnitudeSquared: Double {
            get {
                fatalError("TODO")
            }
            set {
                fatalError("TODO")
            }
        }
    }
}
