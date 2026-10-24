public import CoreGraphics

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
@frozen public struct GraphicsContext {
    @_hasMissingDesignatedInitializers @usableFromInline
    final internal class Storage {
        deinit {
            assertUnimplemented()
        }
    }

    @usableFromInline
    internal var storage: GraphicsContext.Storage

    @frozen public struct BlendMode : RawRepresentable, Equatable {
        public let rawValue: Int32

        @inlinable public init(rawValue: Int32) { self.rawValue = rawValue }

        @inlinable public static var normal: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.normal.rawValue)
            }
        }

        @inlinable public static var multiply: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.multiply.rawValue)
            }
        }

        @inlinable public static var screen: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.screen.rawValue)
            }
        }

        @inlinable public static var overlay: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.overlay.rawValue)
            }
        }

        @inlinable public static var darken: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.darken.rawValue)
            }
        }

        @inlinable public static var lighten: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.lighten.rawValue)
            }
        }

        @inlinable public static var colorDodge: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.colorDodge.rawValue)
            }
        }

        @inlinable public static var colorBurn: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.colorBurn.rawValue)
            }
        }

        @inlinable public static var softLight: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.softLight.rawValue)
            }
        }

        @inlinable public static var hardLight: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.hardLight.rawValue)
            }
        }

        @inlinable public static var difference: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.difference.rawValue)
            }
        }

        @inlinable public static var exclusion: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.exclusion.rawValue)
            }
        }

        @inlinable public static var hue: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.hue.rawValue)
            }
        }

        @inlinable public static var saturation: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.saturation.rawValue)
            }
        }

        @inlinable public static var color: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.color.rawValue)
            }
        }

        @inlinable public static var luminosity: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.luminosity.rawValue)
            }
        }

        @inlinable public static var clear: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.clear.rawValue)
            }
        }

        @inlinable public static var copy: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.copy.rawValue)
            }
        }

        @inlinable public static var sourceIn: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.sourceIn.rawValue)
            }
        }

        @inlinable public static var sourceOut: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.sourceOut.rawValue)
            }
        }

        @inlinable public static var sourceAtop: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.sourceAtop.rawValue)
            }
        }

        @inlinable public static var destinationOver: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.destinationOver.rawValue)
            }
        }

        @inlinable public static var destinationIn: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.destinationIn.rawValue)
            }
        }

        @inlinable public static var destinationOut: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.destinationOut.rawValue)
            }
        }

        @inlinable public static var destinationAtop: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.destinationAtop.rawValue)
            }
        }

        @inlinable public static var xor: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.xor.rawValue)
            }
        }

        @inlinable public static var plusDarker: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.plusDarker.rawValue)
            }
        }

        @inlinable public static var plusLighter: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.plusLighter.rawValue)
            }
        }

        @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
        public typealias RawValue = Int32
    }

    public var opacity: Double {
        get {
            assertUnimplemented()
        }

        set {
            assertUnimplemented()
        }
    }

    public var blendMode: GraphicsContext.BlendMode {
        get {
            assertUnimplemented()
        }

        set {
            assertUnimplemented()
        }
    }

    public var environment: EnvironmentValues {
        get {
            assertUnimplemented()
        }
    }

    public var transform: CGAffineTransform {
        get {
            assertUnimplemented()
        }

        set {
            assertUnimplemented()
        }
    }

    public mutating func scaleBy(x: CGFloat, y: CGFloat) {
        assertUnimplemented()
    }

    public mutating func translateBy(x: CGFloat, y: CGFloat) {
        assertUnimplemented()
    }

    public mutating func rotate(by angle: Angle) {
        assertUnimplemented()
    }

    public mutating func concatenate(_ matrix: CGAffineTransform) {
        assertUnimplemented()
    }

    @frozen public struct ClipOptions : OptionSet {
        public let rawValue: UInt32

        @inlinable public init(rawValue: UInt32) { self.rawValue = rawValue }

        @inlinable public static var inverse: GraphicsContext.ClipOptions {
            get { Self(rawValue: 1 << 0) }
        }

        @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
        public typealias ArrayLiteralElement = GraphicsContext.ClipOptions

        @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
        public typealias Element = GraphicsContext.ClipOptions

        @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
        public typealias RawValue = UInt32
    }

    public var clipBoundingRect: CGRect {
        get {
            assertUnimplemented()
        }
    }

    public mutating func clip(to path: Path, style: FillStyle = FillStyle(), options: GraphicsContext.ClipOptions = ClipOptions()) {
        assertUnimplemented()
    }

    public mutating func clipToLayer(opacity: Double = 1, options: GraphicsContext.ClipOptions = ClipOptions(), content: (inout GraphicsContext) throws -> Void) rethrows {
        assertUnimplemented()
    }

    public struct Filter : Sendable {
        public static func projectionTransform(_ matrix: ProjectionTransform) -> GraphicsContext.Filter {
            assertUnimplemented()
        }

        public static func shadow(color: Color = Color(.sRGBLinear, white: 0, opacity: 0.33), radius: CGFloat, x: CGFloat = 0, y: CGFloat = 0, blendMode: GraphicsContext.BlendMode = .normal, options: GraphicsContext.ShadowOptions = ShadowOptions()) -> GraphicsContext.Filter {
            assertUnimplemented()
        }

        public static func colorMultiply(_ color: Color) -> GraphicsContext.Filter {
            assertUnimplemented()
        }

        public static func colorMatrix(_ matrix: ColorMatrix) -> GraphicsContext.Filter {
            assertUnimplemented()
        }

        public static func hueRotation(_ angle: Angle) -> GraphicsContext.Filter {
            assertUnimplemented()
        }

        public static func saturation(_ amount: Double) -> GraphicsContext.Filter {
            assertUnimplemented()
        }

        public static func brightness(_ amount: Double) -> GraphicsContext.Filter {
            assertUnimplemented()
        }

        public static func contrast(_ amount: Double) -> GraphicsContext.Filter {
            assertUnimplemented()
        }

        public static func colorInvert(_ amount: Double = 1) -> GraphicsContext.Filter {
            assertUnimplemented()
        }

        public static func grayscale(_ amount: Double) -> GraphicsContext.Filter {
            assertUnimplemented()
        }

        public static var luminanceToAlpha: GraphicsContext.Filter {
            get {
                assertUnimplemented()
            }
        }

        public static func blur(radius: CGFloat, options: GraphicsContext.BlurOptions = BlurOptions()) -> GraphicsContext.Filter {
            assertUnimplemented()
        }

        public static func alphaThreshold(min: Double, max: Double = 1, color: Color = Color.black) -> GraphicsContext.Filter {
            assertUnimplemented()
        }

        @available(iOS 17.0, macOS 14.0, tvOS 17.0, *)
        @available(watchOS, unavailable)
        public static func colorShader(_ shader: Shader) -> GraphicsContext.Filter {
            assertUnimplemented()
        }

        @available(iOS 17.0, macOS 14.0, tvOS 17.0, *)
        @available(watchOS, unavailable)
        public static func distortionShader(_ shader: Shader, maxSampleOffset: CGSize) -> GraphicsContext.Filter {
            assertUnimplemented()
        }

        @available(iOS 17.0, macOS 14.0, tvOS 17.0, *)
        @available(watchOS, unavailable)
        public static func layerShader(_ shader: Shader, maxSampleOffset: CGSize) -> GraphicsContext.Filter {
            assertUnimplemented()
        }
    }

    @frozen public struct ShadowOptions : OptionSet {
        public let rawValue: UInt32

        @inlinable public init(rawValue: UInt32) { self.rawValue = rawValue }

        @inlinable public static var shadowAbove: GraphicsContext.ShadowOptions {
            get { Self(rawValue: 1 << 0) }
        }

        @inlinable public static var shadowOnly: GraphicsContext.ShadowOptions {
            get { Self(rawValue: 1 << 1) }
        }

        @inlinable public static var invertsAlpha: GraphicsContext.ShadowOptions {
            get { Self(rawValue: 1 << 2) }
        }

        @inlinable public static var disablesGroup: GraphicsContext.ShadowOptions {
            get { Self(rawValue: 1 << 3) }
        }

        @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
        public typealias ArrayLiteralElement = GraphicsContext.ShadowOptions

        @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
        public typealias Element = GraphicsContext.ShadowOptions

        @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
        public typealias RawValue = UInt32
    }

    @frozen public struct BlurOptions : OptionSet {
        public let rawValue: UInt32

        @inlinable public init(rawValue: UInt32) { self.rawValue = rawValue }

        @inlinable public static var opaque: GraphicsContext.BlurOptions {
            get { Self(rawValue: 1 << 0) }
        }

        @inlinable public static var dithersResult: GraphicsContext.BlurOptions {
            get { Self(rawValue: 1 << 1) }
        }

        @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
        public typealias ArrayLiteralElement = GraphicsContext.BlurOptions

        @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
        public typealias Element = GraphicsContext.BlurOptions

        @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
        public typealias RawValue = UInt32
    }

    @frozen public struct FilterOptions : OptionSet {
        public let rawValue: UInt32

        @inlinable public init(rawValue: UInt32) {
            self.rawValue = rawValue
        }

        @inlinable public static var linearColor: GraphicsContext.FilterOptions {
            get { Self(rawValue: 1 << 0) }
        }

        @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
        public typealias ArrayLiteralElement = GraphicsContext.FilterOptions

        @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
        public typealias Element = GraphicsContext.FilterOptions

        @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
        public typealias RawValue = UInt32
    }

    public mutating func addFilter(_ filter: GraphicsContext.Filter, options: GraphicsContext.FilterOptions = FilterOptions()) {
        assertUnimplemented()
    }

    public struct Shading : Sendable {
        public static var backdrop: GraphicsContext.Shading {
            get {
                assertUnimplemented()
            }
        }

        public static var foreground: GraphicsContext.Shading {
            get {
                assertUnimplemented()
            }
        }

        public static func palette(_ array: [GraphicsContext.Shading]) -> GraphicsContext.Shading {
            assertUnimplemented()
        }

        public static func color(_ color: Color) -> GraphicsContext.Shading {
            assertUnimplemented()
        }

        public static func color(_ colorSpace: Color.RGBColorSpace = .sRGB, red: Double, green: Double, blue: Double, opacity: Double = 1) -> GraphicsContext.Shading {
            assertUnimplemented()
        }

        public static func color(_ colorSpace: Color.RGBColorSpace = .sRGB, white: Double, opacity: Double = 1) -> GraphicsContext.Shading {
            assertUnimplemented()
        }

        @available(iOS 17.0, macOS 14.0, tvOS 17.0, *)
        @available(watchOS, unavailable)
        public static func shader(_ shader: Shader, bounds: CGRect = .zero) -> GraphicsContext.Shading {
            assertUnimplemented()
        }

        @available(iOS 18.0, macOS 15.0, watchOS 11.0, tvOS 18.0, visionOS 2.0, *)
        public static func meshGradient(_ mesh: MeshGradient) -> GraphicsContext.Shading {
            assertUnimplemented()
        }

        public static func style<S>(_ style: S) -> GraphicsContext.Shading where S : ShapeStyle {
            assertUnimplemented()
        }

        public static func linearGradient(_ gradient: Gradient, startPoint: CGPoint, endPoint: CGPoint, options: GraphicsContext.GradientOptions = GradientOptions()) -> GraphicsContext.Shading {
            assertUnimplemented()
        }

        public static func radialGradient(_ gradient: Gradient, center: CGPoint, startRadius: CGFloat, endRadius: CGFloat, options: GraphicsContext.GradientOptions = GradientOptions()) -> GraphicsContext.Shading {
            assertUnimplemented()
        }

        public static func conicGradient(_ gradient: Gradient, center: CGPoint, angle: Angle = Angle(), options: GraphicsContext.GradientOptions = GradientOptions()) -> GraphicsContext.Shading {
            assertUnimplemented()
        }

        public static func tiledImage(_ image: Image, origin: CGPoint = .zero, sourceRect: CGRect = CGRect(x: 0, y: 0, width: 1, height: 1), scale: CGFloat = 1) -> GraphicsContext.Shading {
            assertUnimplemented()
        }
    }

    @frozen public struct GradientOptions : OptionSet {
        public let rawValue: UInt32

        @inlinable public init(rawValue: UInt32) { self.rawValue = rawValue }

        @inlinable public static var `repeat`: GraphicsContext.GradientOptions {
            get { Self(rawValue: 1 << 0) }
        }

        @inlinable public static var mirror: GraphicsContext.GradientOptions {
            get { Self(rawValue: 1 << 1) }
        }

        @inlinable public static var linearColor: GraphicsContext.GradientOptions {
            get { Self(rawValue: 1 << 2) }
        }

        @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
        public typealias ArrayLiteralElement = GraphicsContext.GradientOptions

        @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
        public typealias Element = GraphicsContext.GradientOptions

        @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
        public typealias RawValue = UInt32
    }

    public func resolve(_ shading: GraphicsContext.Shading) -> GraphicsContext.Shading {
        assertUnimplemented()
    }

    public func drawLayer(content: (inout GraphicsContext) throws -> Void) rethrows {
        assertUnimplemented()
    }

    public func fill(_ path: Path, with shading: GraphicsContext.Shading, style: FillStyle = FillStyle()) {
        assertUnimplemented()
    }

    public func stroke(_ path: Path, with shading: GraphicsContext.Shading, style: StrokeStyle) {
        assertUnimplemented()
    }

    public func stroke(_ path: Path, with shading: GraphicsContext.Shading, lineWidth: CGFloat = 1) {
        assertUnimplemented()
    }

    public struct ResolvedImage {
        public var size: CGSize {
            get {
                assertUnimplemented()
            }
        }

        public let baseline: CGFloat

        public var shading: GraphicsContext.Shading?
    }

    public func resolve(_ image: Image) -> GraphicsContext.ResolvedImage {
        assertUnimplemented()
    }

    public func draw(_ image: GraphicsContext.ResolvedImage, in rect: CGRect, style: FillStyle = FillStyle()) {
        assertUnimplemented()
    }

    public func draw(_ image: GraphicsContext.ResolvedImage, at point: CGPoint, anchor: UnitPoint = .center) {
        assertUnimplemented()
    }

    public func draw(_ image: Image, in rect: CGRect, style: FillStyle = FillStyle()) {
        assertUnimplemented()
    }

    public func draw(_ image: Image, at point: CGPoint, anchor: UnitPoint = .center) {
        assertUnimplemented()
    }

    public struct ResolvedText {
        public var shading: GraphicsContext.Shading

        public func measure(in size: CGSize) -> CGSize {
            assertUnimplemented()
        }

        public func firstBaseline(in size: CGSize) -> CGFloat {
            assertUnimplemented()
        }

        public func lastBaseline(in size: CGSize) -> CGFloat {
            assertUnimplemented()
        }
    }

    public func resolve(_ text: Text) -> GraphicsContext.ResolvedText {
        assertUnimplemented()
    }

    public func draw(_ text: GraphicsContext.ResolvedText, in rect: CGRect) {
        assertUnimplemented()
    }

    public func draw(_ text: GraphicsContext.ResolvedText, at point: CGPoint, anchor: UnitPoint = .center) {
        assertUnimplemented()
    }

    public func draw(_ text: Text, in rect: CGRect) {
        assertUnimplemented()
    }

    public func draw(_ text: Text, at point: CGPoint, anchor: UnitPoint = .center) {
        assertUnimplemented()
    }

    public struct ResolvedSymbol {
        public var size: CGSize {
            get {
                assertUnimplemented()
            }
        }
    }

    public func resolveSymbol<ID>(id: ID) -> GraphicsContext.ResolvedSymbol? where ID : Hashable {
        assertUnimplemented()
    }

    public func draw(_ symbol: GraphicsContext.ResolvedSymbol, in rect: CGRect) {
        assertUnimplemented()
    }

    public func draw(_ symbol: GraphicsContext.ResolvedSymbol, at point: CGPoint, anchor: UnitPoint = .center) {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension GraphicsContext.ResolvedImage : Sendable {
}

@available(*, unavailable)
extension GraphicsContext.ResolvedText : Sendable {
}

@available(*, unavailable)
extension GraphicsContext.ResolvedSymbol : Sendable {
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension GraphicsContext {
    public func withCGContext(content: (CGContext) throws -> Void) rethrows {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension GraphicsContext : Sendable {
}

@available(*, unavailable)
extension GraphicsContext.Storage : Sendable {
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension GraphicsContext {
    public func draw(_ line: Text.Layout.Line, options: Text.Layout.DrawingOptions = .init()) {
        assertUnimplemented()
    }

    public func draw(_ run: Text.Layout.Run, options: Text.Layout.DrawingOptions = .init()) {
        assertUnimplemented()
    }

    public func draw(_ slice: Text.Layout.RunSlice, options: Text.Layout.DrawingOptions = .init()) {
        assertUnimplemented()
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension GraphicsContext.BlendMode : Sendable {}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension GraphicsContext.BlendMode : BitwiseCopyable {}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension GraphicsContext.ClipOptions : Sendable {}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension GraphicsContext.ClipOptions : BitwiseCopyable {}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension GraphicsContext.ShadowOptions : Sendable {}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension GraphicsContext.ShadowOptions : BitwiseCopyable {}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension GraphicsContext.BlurOptions : Sendable {}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension GraphicsContext.BlurOptions : BitwiseCopyable {}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension GraphicsContext.FilterOptions : Sendable {}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension GraphicsContext.FilterOptions : BitwiseCopyable {}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension GraphicsContext.GradientOptions : Sendable {}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension GraphicsContext.GradientOptions : BitwiseCopyable {}
