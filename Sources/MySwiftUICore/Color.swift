#warning("TODO")
// protocol conformance descriptor for SwiftUI.Color :
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
    
    package init(_platformColor: NSObject & NSSecureCoding, definition: PlatformColorDefinition.Type) {
        self.provider = ColorBox(UIKitPlatformColorProvider(platformColor: _platformColor))
    }
    
    package init(box: AnyColorBox) {
        self.provider = box
    }
    
    package init(_ resolved: Color.ResolvedHDR) {
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
    @_alwaysEmitIntoClient public static nonisolated func _makeView<S>(view: _GraphValue<_ShapeView<S, Color>>, inputs: _ViewInputs) -> _ViewOutputs where S : Shape {
        _ShapeView<S, Self>._makeView(view: view, inputs: inputs)
    }
}

extension Color: EnvironmentalView {
    func body(environment: EnvironmentValues) -> ColorView {
        fatalError("TODO")
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
}

final class ColorBox<T>: AnyColorBox {
    private let base: T
    
    init(_ base: T) {
        self.base = base
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
    public struct Resolved: Hashable, BitwiseCopyable, ShapeStyle, CustomStringConvertible, Animatable, Codable {
        private var linearRed: Float
        private var linearGreen: Float
        private var linearBlue: Float
        private var opacity: Float
        
        init(linearRed: Float, linearGreen: Float, linearBlue: Float, opacity: Float) {
            self.linearRed = linearRed
            self.linearGreen = linearGreen
            self.linearBlue = linearBlue
            self.opacity = opacity
        }
        
        public var description: String {
            fatalError("TODO")
        }
        
        public var animatableData: Double {
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
        fileprivate private(set) var base: Color.Resolved
        private var _headroom: Float
        
        static var clear: Color.ResolvedHDR {
            return Color.ResolvedHDR(
                base: Color.Resolved(linearRed: 0, linearGreen: 0, linearBlue: 0, opacity: 0),
                _headroom: 0
            )
        }
        
        static var black: Color.ResolvedHDR {
            return Color.ResolvedHDR(
                base: Color.Resolved(linearRed: 0, linearGreen: 0, linearBlue: 0, opacity: 1),
                _headroom: .nan
            )
        }
        
        static var white: Color.ResolvedHDR {
            return Color.ResolvedHDR(
                base: Color.Resolved(linearRed: 0, linearGreen: 0, linearBlue: 0, opacity: 0),
                _headroom: .nan
            )
        }
        
        public var cgColor: CGColor? {
            fatalError("TODO")
        }
    }
}

extension Color.ResolvedHDR: BitwiseCopyable, ShapeStyle {}

extension Color {
    public static let red: Color = {
        fatalError("TODO")
    }()
    
    public static let orange: Color = {
        fatalError("TODO")
    }()
    
    public static let yellow: Color = {
        fatalError("TODO")
    }()
    
    public static let green: Color = {
        fatalError("TODO")
    }()
    
    public static let mint: Color = {
        fatalError("TODO")
    }()
    
    public static let teal: Color = {
        fatalError("TODO")
    }()
    
    public static let cyan: Color = {
        fatalError("TODO")
    }()
    
    public static let blue = Color(box: ColorBox(SystemColorType.blue))
    
    public static let indigo: Color = {
        fatalError("TODO")
    }()
    
    public static let purple: Color = {
        fatalError("TODO")
    }()
    
    public static let pink: Color = {
        fatalError("TODO")
    }()
    
    public static let brown: Color = {
        fatalError("TODO")
    }()
    
    public static let white = Color(.white)
    
    public static let gray: Color = {
        fatalError("TODO")
    }()
    
    public static let black = Color(.black)
    
    public static let clear = Color(.clear)
    
    public static let primary: Color = {
        fatalError("TODO")
    }()
    
    public static let secondary: Color = {
        fatalError("TODO")
    }()
    
    package static let _background: Color = {
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
    
    var hashValue: Int {
        return platformColor.hashValue
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
    private var color: Color.ResolvedHDR
    private var isAntialiased: Bool
    private var allowedDynamicRange: Image.DynamicRange
    
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
    
    nonisolated var animatableData: Double {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
    }
    
    static var requiresMainThread: Bool {
        fatalError("TODO")
    }
    
    // $s7SwiftUI9ColorViewVAA012RendererLeafD0A2aDP7contentAA11DisplayListV7ContentV5ValueOyFTW
    func content() -> DisplayList.Content.Value {
        fatalError("TODO")
    }
}
