// A8D9ECD380926237F7E554221FB2DE85
public import CoreGraphics
internal import RenderBox
private import AttributeGraph

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
@frozen public struct GraphicsContext {
    @_hasMissingDesignatedInitializers @usableFromInline
    final internal class Storage {
        fileprivate let shared: GraphicsContext.Storage.Shared // 0x10
        fileprivate let state: RBDrawingState // 0x18
        fileprivate private(set) var environmentOverride: EnvironmentValues? = nil // 0x20
        fileprivate var opacity: Float = 1 // 0x30
        fileprivate var blendMode: RBBlendMode = .unknown0 // 0x34
        fileprivate private(set) var shapeDistance: CGFloat = .nan // 0x38
        private let ownsState: Bool // 0x40
        
        @inline(__always) // 원래 없음
        init(
            list: RBDisplayList,
            environment: EnvironmentValues
        ) {
            self.shared = GraphicsContext.Storage.Shared(list: list, environment: environment)
            self.state = RBDisplayListGetState(list)
            self.ownsState = false
        }
        
        @inline(__always) // 원래 없음
        fileprivate init(from other: GraphicsContext.Storage) {
            let state = RBDrawingState.initialize(other.state)
            let shared = other.shared
            
            if shared.colorSpace != state.defaultColorSpace {
                self.shared = GraphicsContext.Storage.Shared(
                    list: state.displayList,
                    environment: other.environmentOverride ?? shared._environment
                )
            } else {
                self.shared = shared
            }
            
            self.state = state
            self.ownsState = true
            self.opacity = other.opacity
            self.blendMode = other.blendMode
        }
        
        deinit {
            if self.ownsState {
                self.state.destroy()
            }
        }
        
        @inline(__always) // 원래 없음
        func update(symbols: GraphicsContextSymbols?) {
            self.shared.symbols = symbols
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
            return Double(self.storage.opacity)
        }
        set {
            let converted = Float(newValue)
            
            if self.storage.opacity == converted {
            } else {
                self.copyOnWrite()
                self.storage.opacity = converted
            }
        }
    }
    
    public var blendMode: GraphicsContext.BlendMode {
        get {
            return GraphicsContext.BlendMode(rawValue: self.storage.blendMode.rawValue)
        }
        set {
            if self.storage.blendMode.rawValue == newValue.rawValue {
            } else {
                self.copyOnWrite()
                self.storage.blendMode = unsafe RBBlendMode(rawValue: newValue.rawValue).unsafelyUnwrapped
            }
        }
    }
    
    public var environment: EnvironmentValues {
        return self.storage.environmentOverride ?? self.storage.shared._environment
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
        if (x == 1) && (y == 1) {
            return
        } else {
            self.copyOnWrite()
            self.storage.state.scaleCTM(sx: x, sy: y)
        }
    }
    
    public mutating func translateBy(x: CGFloat, y: CGFloat) {
        if (x != 0) || (y != 0) {
            self.copyOnWrite()
            self.storage.state.translateCTM(tx: x, ty: y)
        } else {
            return
        }
    }
    
    public mutating func rotate(by angle: Angle) {
        if angle.radians != 0 {
            self.copyOnWrite()
            self.storage.state.rotateCTM(angle: angle.radians)
        }
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
        
        public static func shadow(
            color: Color = Color(.sRGBLinear, white: 0, opacity: 0.33),
            radius: CGFloat,
            x: CGFloat = 0,
            y: CGFloat = 0,
            blendMode: GraphicsContext.BlendMode = .normal,
            options: GraphicsContext.ShadowOptions = ShadowOptions()
        ) -> GraphicsContext.Filter {
            let shadow = GraphicsContext.Filter.Shadow(
                color: color,
                radius: radius,
                offset: CGSize(width: x, height: y),
                blend: blendMode,
                options: options
            )
            
            return GraphicsContext.Filter(storage: .shadow(shadow))
        }
        
        @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
        public static func alphaMultiply(_ color: Color) -> GraphicsContext.Filter {
            assertUnimplemented()
        }
        
        public static func colorMultiply(_ color: Color) -> GraphicsContext.Filter {
            assertUnimplemented()
        }
        
        public static func colorMatrix(_ matrix: ColorMatrix) -> GraphicsContext.Filter {
            assertUnimplemented()
        }
        
        @available(iOS 18.2, macOS 15.2, watchOS 11.2, tvOS 18.2, visionOS 2.2, *)
        public static func colorMatrix(_ matrix: ColorMatrix, isPremultiplied: Bool) -> GraphicsContext.Filter {
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
        
        fileprivate private(set) var storage: GraphicsContext.Filter.Storage
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
        /*
         x15 x22
         x19 x28
         x21 x23
         x0 x24
         x16 x17
         x6 x5
         x4 x2
         x3 x26
         x25 x10
         w27
         */
        switch filter.storage {
        case .projection(let transform):
            // <+204>
            self.copyOnWrite()
            self.storage.state.addProjectionTransform(transform)
        case .rotation(let data):
            // <+1980>
            self.copyOnWrite()
            self.storage.state.addRotationStyle(angle: data.angle.radians, anchor: data.anchor)
        case .rotation3D(let data):
            // <+1552>
            self.copyOnWrite()
            self.storage.state.addRotation3DStyle(
                angle: data.angle.radians,
                axisX: Float(data.axis.x),
                axisY: Float(data.axis.y),
                axisZ: Float(data.axis.z),
                anchorX: Float(data.anchor.x),
                anchorY: Float(data.anchor.y),
                anchorZ: Float(data.anchor.z),
                perspective: data.perspective,
                flipWidth: data.flipWidth
            )
        case .shadow(let shadow):
            // <+1808>
            self.copyOnWrite()
            let resolved = shadow.color.provider.resolve(in: self.environment)
            var rbColor = RBColor(
                red: resolved.linearRed,
                green: resolved.linearGreen,
                blue: resolved.linearBlue,
                alpha: resolved.opacity
            )
            
            if self.storage.shared.colorSpace != .unknown2 {
                rbColor = RBColor.fromLinear(
                    r: rbColor.red,
                    g: rbColor.green,
                    b: rbColor.blue,
                    a: rbColor.alpha
                )
            }
            
            let flags = RBShadowFlags(shadow.options)
            
            unsafe self.storage.state.addShadowStyle(
                blendMode: RBBlendMode(rawValue: shadow.blend.rawValue).unsafelyUnwrapped,
                flags: flags,
                radius: shadow.radius,
                offset: shadow.offset,
                color: rbColor
            )
        case .resolvedShadow(let shadow):
            // <+644>
            self.copyOnWrite()
            
            var rbColor = RBColor(
                red: shadow.color.linearRed,
                green: shadow.color.linearGreen,
                blue: shadow.color.linearBlue,
                alpha: shadow.color.opacity
            )
            
            if self.storage.shared.colorSpace != .unknown2 {
                rbColor = RBColor.fromLinear(
                    r: rbColor.red,
                    g: rbColor.green,
                    b: rbColor.blue,
                    a: rbColor.alpha
                )
            }
            
            let flags = RBShadowFlags(shadow.options)
            
            unsafe self.storage.state.addShadowStyle3(
                0,
                blendMode:RBBlendMode(rawValue: shadow.blend.rawValue).unsafelyUnwrapped,
                flags: flags,
                radius: shadow.radius,
                midpoint: shadow.midpoint,
                offset: shadow.offset,
                color: rbColor
            )
        case .pathProjection(let startPoint, let endPoint, let path, let flags):
            // <+2328>
            self.copyOnWrite()
            let rbPath = unsafe path.retainRBPath()
            
            unsafe self.storage.state.addPathProjectionStyle(
                path: rbPath,
                transform: CGAffineTransformMake(1, 0, 0, 1, 0, 0),
                flags: flags,
                startPoint: startPoint,
                endPoint: endPoint
            )
            
            unsafe rbPath.release()
        case .colorMultiply(let color):
            // <+2704>
            let resolved = color.provider.resolveHDR(in: self.environment)
            self.copyOnWrite()
            
            var rbColor = RBColor(
                red: resolved.linearRed,
                green: resolved.linearGreen,
                blue: resolved.linearBlue,
                alpha: resolved.opacity
            )
            
            if self.storage.shared.colorSpace != .unknown2 {
                rbColor = RBColor.fromLinear(
                    r: rbColor.red,
                    g: rbColor.green,
                    b: rbColor.blue,
                    a: rbColor.alpha
                )
            }
            
            let colorSpace = self.storage.shared.colorSpace
            var unknown0: UInt32 = 1
            if colorSpace != .unknown2 {
                unknown0 &+= 1
            }
            if options.contains(.linearColor) {
                unknown0 = 1;
            }
            
            let data = RBDisplayListColorMultiply(
                color: rbColor,
                colorSpace: colorSpace,
                headroom: resolved.headroom ?? 0,
                unknown0: unknown0
            )
            
            withUnsafePointer(to: data) { pointer in
                unsafe self.storage.state.addStyle(style: .unknown5, data: pointer)
            }
        case .colorMultiplyResolved(let resolved):
            // <+1904>
            self.copyOnWrite()
            
            var rbColor = RBColor(
                red: resolved.linearRed,
                green: resolved.linearGreen,
                blue: resolved.linearBlue,
                alpha: resolved.opacity
            )
            
            if self.storage.shared.colorSpace != .unknown2 {
                rbColor = RBColor.fromLinear(
                    r: rbColor.red,
                    g: rbColor.green,
                    b: rbColor.blue,
                    a: rbColor.alpha
                )
            }
            
            let colorSpace = self.storage.shared.colorSpace
            var unknown0: UInt32 = 1
            if colorSpace != .unknown2 {
                unknown0 &+= 1
            }
            if options.contains(.linearColor) {
                unknown0 = 1;
            }
            
            let data = RBDisplayListColorMultiply(
                color: rbColor,
                colorSpace: colorSpace,
                headroom: resolved.headroom ?? 0,
                unknown0: unknown0
            )
            
            withUnsafePointer(to: data) { pointer in
                unsafe self.storage.state.addStyle(style: .unknown5, data: pointer)
            }
        case .alphaMultiply(let color):
            // <+2896>
            let resolved = color.provider.resolveHDR(in: self.environment)
            self.copyOnWrite()
            
            var rbColor = RBColor(
                red: resolved.linearRed,
                green: resolved.linearGreen,
                blue: resolved.linearBlue,
                alpha: resolved.opacity
            )
            
            var colorSpace = self.storage.shared.colorSpace
            var unknown0: UInt32
            
            if colorSpace != .unknown2 {
                rbColor = RBColor.fromLinear(
                    r: rbColor.red,
                    g: rbColor.green,
                    b: rbColor.blue,
                    a: rbColor.alpha
                )
                
                colorSpace = self.storage.shared.colorSpace
                
                unknown0 = 1
                if colorSpace != .unknown2 {
                    unknown0 &+= 1
                }
                
                if options.contains(.linearColor) {
                    unknown0 = 1;
                }
            } else {
                unknown0 = 1
            }
            
            let data = RBColorStyleAlphaMultiply(
                color: rbColor,
                colorSpace: colorSpace,
                headroom: resolved.headroom ?? 0,
                unknown0: unknown0
            )
            
            withUnsafePointer(to: data) { pointer in
                unsafe self.storage.state.addStyle(style: .unknown6, data: pointer)
            }
        case .alphaMultiplyResolved(let resolved):
            // <+1036>
            self.copyOnWrite()
            
            var rbColor = RBColor(
                red: resolved.linearRed,
                green: resolved.linearGreen,
                blue: resolved.linearBlue,
                alpha: resolved.opacity
            )
            
            var colorSpace = self.storage.shared.colorSpace
            var unknown0: UInt32
            
            if colorSpace != .unknown2 {
                rbColor = RBColor.fromLinear(
                    r: rbColor.red,
                    g: rbColor.green,
                    b: rbColor.blue,
                    a: rbColor.alpha
                )
                
                colorSpace = self.storage.shared.colorSpace
                
                unknown0 = 1
                if colorSpace != .unknown2 {
                    unknown0 &+= 1
                }
                
                if options.contains(.linearColor) {
                    unknown0 = 1;
                }
            } else {
                unknown0 = 1
            }
            
            let data = RBColorStyleAlphaMultiply(
                color: rbColor,
                colorSpace: colorSpace,
                headroom: resolved.headroom ?? 0,
                unknown0: unknown0
            )
            
            withUnsafePointer(to: data) { pointer in
                unsafe self.storage.state.addStyle(style: .unknown6, data: pointer)
            }
        case .colorMatrix(let matrix, let premultiplied):
            // <+2824>
            self.copyOnWrite()
            
            var flags: RBColorMatrixFlags
            if options.contains(.linearColor) {
                // <+4088>
                flags = [.unknown0]
                
                if premultiplied {
                    flags.formUnion(.unknown2)
                }
            } else {
                // <+2868>
                flags = [.unknown0]
                
                if self.storage.shared.colorSpace != .unknown2 {
                    flags = [.unknown1]
                }
                
                if premultiplied {
                    flags.formUnion(.unknown2)
                }
            }
            
            let values = RBColorMatrixFilter(
                m11: matrix.m11, m12: matrix.m12, m13: matrix.m13, m14: matrix.m14, m15: matrix.m15,
                m21: matrix.m21, m22: matrix.m22, m23: matrix.m23, m24: matrix.m24, m25: matrix.m25,
                m31: matrix.m31, m32: matrix.m32, m33: matrix.m33, m34: matrix.m34, m35: matrix.m35,
                m41: matrix.m41, m42: matrix.m42, m43: matrix.m43, m44: matrix.m44, m45: matrix.m45,
            )
            
            withUnsafePointer(to: values) { pointer in
                unsafe self.storage.state.addColorMatrixFilter(matrix: pointer, flags: flags)
            }
        case .hueRotate(let angle):
            // <+512>
            self.copyOnWrite()
            
            var flags: RBHueRotationFlags = [.unknown0]
            
            if !options.contains(.linearColor) {
                if self.storage.shared.colorSpace != .unknown2 {
                    flags = [.unknown1]
                }
            }
            
            self.storage.state.addHueRotationFilter(flags: flags, angle: angle.radians)
        case .saturate(let amount):
            // <+908>
            self.copyOnWrite()
            
            var flags: RBSaturationFlags = [.unknown0]
            
            if !options.contains(.linearColor) {
                if self.storage.shared.colorSpace != .unknown2 {
                    flags = [.unknown1]
                }
            }
            
            self.storage.state.addSaturationFilter(flags: flags, amount: amount)
        case .brightness(let amount):
            // <+2576>
            self.copyOnWrite()
            
            var flags: RBBrightnessFlags = [.unknown0]
            
            if !options.contains(.linearColor) {
                if self.storage.shared.colorSpace != .unknown2 {
                    flags = [.unknown1]
                }
            }
            
            self.storage.state.addBrightnessFilter(flags: flags, amount: amount)
        case .contrast(let amount):
            // <+384>
            self.copyOnWrite()
            
            var flags: RBContrastFlags = [.unknown0]
            
            if !options.contains(.linearColor) {
                if self.storage.shared.colorSpace != .unknown2 {
                    flags = [.unknown1]
                }
            }
            
            self.storage.state.addContrastFilter(flags: flags, amount: amount)
        case .invert(let amount):
            // <+1680>
            self.copyOnWrite()
            
            var flags: RBColorInvertFlags = [.unknown0]
            
            if !options.contains(.linearColor) {
                if self.storage.shared.colorSpace != .unknown2 {
                    flags = [.unknown1]
                }
            }
            
            self.storage.state.addColorInvertFilter(flags: flags, amount: amount)
        case .grayscale(let amount):
            // <+256>
            self.copyOnWrite()
            
            var flags: RBGrayscaleFlags = [.unknown0]
            
            if !options.contains(.linearColor) {
                if self.storage.shared.colorSpace != .unknown2 {
                    flags = [.unknown1]
                }
            }
            
            self.storage.state.addGrayscaleFilter(flags: flags, amount: amount)
        case .blur(let radius, let flags):
            // <+2100>
            if radius <= 0 {
                return
            }
            
            self.copyOnWrite()
            
            let flags = RBBlurFlags(rawValue: flags.rawValue | ((options.rawValue & 1) << 1))
            
            self.storage.state.addBlurFilter(
                flags: flags,
                radius: radius,
                CGFloat(bitPattern: 0xffdfffffffffffff),
                CGFloat(bitPattern: 0xffdfffffffffffff),
                CGFloat(bitPattern: 0x7fefffffffffffff),
                CGFloat(bitPattern: 0x7fefffffffffffff)
            )
        case .variableBlur(let radius, let shading, let flags):
            // <+2760>
            if radius <= 0 {
                return
            }
            
            let flags = RBBlurFlags(rawValue: flags.rawValue | ((options.rawValue & 1) << 1))
            
            self.addVariableBlurFilter(radius: radius, mask: shading, flags: flags)
        case .alphaThreshold(let value_1, let value_2, let color):
            // <+3044>
            let resolved = color.provider.resolveHDR(in: self.environment)
            self.copyOnWrite()
            
            var rbColor = RBColor(
                red: resolved.linearRed,
                green: resolved.linearGreen,
                blue: resolved.linearBlue,
                alpha: resolved.opacity
            )
            
            var colorSpace = self.storage.shared.colorSpace
            if colorSpace != .unknown2 {
                rbColor = RBColor.fromLinear(
                    r: rbColor.red,
                    g: rbColor.green,
                    b: rbColor.blue,
                    a: rbColor.alpha
                )
                
                colorSpace = self.storage.shared.colorSpace
            }
            
            let data = RBAlphaThresholdEffect(
                unknown0: 3,
                unknown1: value_1,
                unknown2: (value_2 >= 1) ? .infinity : value_2,
                color: rbColor,
                colorSpace: colorSpace,
                headroom: resolved.headroom ?? 0
            )
            
            withUnsafePointer(to: data) { pointer in
                unsafe self.storage.state.addStyle(style: .unknown0, data: pointer)
            }
        case .alphaGradient(let gradient):
            // <+2240>
            self.copyOnWrite()
            
            switch gradient {
            case .gradient(let gradient):
                // <+2284>
                let color: Color?
                
                if gradient.stops.count == 1 {
                    // <+4632>
                    color = gradient.stops[0].color
                } else if !gradient.stops.isEmpty {
                    // <+3196>
                    color = nil
                } else {
                    // <+2300>
                    color = .clear
                }
                
                if let color {
                    // <+4640>
                    let resolved = color.provider.resolveHDR(in: self.environment)
                    
                    var rbColor = RBColor(
                        red: resolved.linearRed,
                        green: resolved.linearGreen,
                        blue: resolved.linearBlue,
                        alpha: resolved.opacity
                    )
                    
                    var colorSpace = self.storage.shared.colorSpace
                    if colorSpace != .unknown2 {
                        rbColor = RBColor.fromLinear(
                            r: rbColor.red,
                            g: rbColor.green,
                            b: rbColor.blue,
                            a: rbColor.alpha
                        )
                        
                        colorSpace = self.storage.shared.colorSpace
                    }
                    
                    withUnsafePointer(to: (rbColor, rbColor)) { pointer in
                        let data = unsafe RBAlphaGradientEffect(
                            unknown0: 3,
                            lowerBound: 0,
                            upperBound: 1,
                            count: 2,
                            colors: UnsafeRawPointer(pointer).assumingMemoryBound(to: RBColor.self),
                            colorSpace: colorSpace,
                            headroom: resolved.headroom ?? 0,
                            locations: nil,
                            flags: []
                        )
                        
                        withUnsafePointer(to: data) { pointer in
                            unsafe self.storage.state.addStyle(style: .unknown1, data: pointer)
                        }
                    }
                    
                    return
                } else {
                    // <+3196>
                }
            case .anyGradient(_):
                // <+3196>
                break
            }
            
            // <+3196>
            unsafe withGradient(
                gradient,
                in: self.environment,
                colorSpace: self.storage.shared.colorSpace
            ) { count, colors, headroom, locations, flags in
                // $s7SwiftUI15GraphicsContextV9addFilter_7optionsyAC0F0V_AC0F7OptionsVtFySi_SPySo7RBColoraGSfSgSPy04CoreC07CGFloatVGSgSo15RBGradientFlagsVtXEfU1_
                var flags = flags
                
                if options.contains(.linearColor) {
                    flags.formUnion(.unknown6)
                }
                
                let data = unsafe RBAlphaGradientEffect(
                    unknown0: 3,
                    lowerBound: 0,
                    upperBound: 1,
                    count: count,
                    colors: colors,
                    colorSpace: self.storage.shared.colorSpace,
                    headroom: headroom ?? 0,
                    locations: locations,
                    flags: flags
                )
                
                withUnsafePointer(to: data) { pointer in
                    unsafe self.storage.state.addStyle(style: .unknown1, data: pointer)
                }
            }
        case .colorMonochrome(let monochrome):
            // <+2496>
            self.copyOnWrite()
            
            var rbColor = RBColor(
                red: monochrome.color.linearRed,
                green: monochrome.color.linearGreen,
                blue: monochrome.color.linearBlue,
                alpha: monochrome.color.opacity
            )
            
            var unknown0: UInt32
            var colorSpace = self.storage.shared.colorSpace
            
            if colorSpace != .unknown2 {
                rbColor = RBColor.fromLinear(
                    r: rbColor.red,
                    g: rbColor.green,
                    b: rbColor.blue,
                    a: rbColor.alpha
                )
                
                colorSpace = self.storage.shared.colorSpace
                
                unknown0 = 1
                if colorSpace != .unknown2 {
                    unknown0 &+= 1
                }
            } else {
                unknown0 = 1
            }
            
            // <+3820>
            if options.contains(.linearColor) {
                unknown0 = 1;
            }
            
            let data = RBDisplayListColorMonochrome(
                amount: monochrome.amount,
                bias: monochrome.bias,
                color: rbColor,
                colorSpace: colorSpace,
                headroom: monochrome.color.headroom ?? 0,
                unknown0: unknown0
            )
            
            withUnsafePointer(to: data) { pointer in
                unsafe self.storage.state.addStyle(style: .unknown7, data: pointer)
            }
        case .luminanceCurve(let curve):
            // <+2952>
            self.copyOnWrite()
            
            var flags: RBLuminanceCurveFlags = [.unknown0]
            if !options.contains(.linearColor) {
                if self.storage.shared.colorSpace != .unknown2 {
                    flags = [.unknown1]
                }
            }
            
            withUnsafePointer(to: curve.curve.values) { pointer in
                unsafe self.storage.state.addLuminanceCurveFilter(
                    curve: UnsafeRawPointer(pointer).assumingMemoryBound(to: Float.self),
                    flags: flags,
                    1,
                    1,
                    1,
                    curve.amount
                )
            }
        case .colorCurves(let curves):
            // <+3104>
            self.copyOnWrite()
            
            let values = (
                curves.redCurve.values,
                curves.greenCurve.values,
                curves.blueCurve.values,
                curves.opacityCurve.values,
            )
            
            var flags: RBRCurvesFlags = [.unknown0]
            
            if !options.contains(.linearColor) {
                if self.storage.shared.colorSpace != .unknown2 {
                    flags = [.unknown1]
                }
            }
            
            withUnsafePointer(to: values) { pointer in
                unsafe self.storage.state
                    .addRGBACurvesFilter(
                        curves: UnsafeRawPointer(pointer).assumingMemoryBound(to: Float.self),
                        flags: flags
                    )
            }
        case .shader(let shader, let border, let size):
            // <+1232>
            guard let rbShader = shader.rbShader(in: self.environment) else {
                return
            }
            
            self.copyOnWrite()
            
            let resolvedShader = Shader.ResolvedShader(
                rbShader: rbShader,
                maxSampleOffset: border,
                options: shader.options
            )
            
            let flags = resolvedShader.rbFilterFlags
            let rect = CGRect(origin: .zero, size: size)
            
            withUnsafePointer(to: rect) { rect in
                unsafe self.storage.state.addShaderFilter(
                    shader: rbShader,
                    rect: rect ,
                    filterFlags: flags,
                    size: border
                )
            }
        case .luminanceToAlpha:
            // <+1112>
            self.copyOnWrite()
            
            var flags: RBLuminanceToAlphaFlags = [.unknown0]
            if !options.contains(.linearColor) {
                if self.storage.shared.colorSpace != .unknown2 {
                    flags = [.unknown1]
                }
            }
            
            self.storage.state.addLuminanceToAlphaFilter(flags: flags)
        }
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
            return GraphicsContext.Shading(storage: .color(color))
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
            return GraphicsContext.Shading(
                storage: .gradient(
                    .gradient(gradient),
                    geometry: .axial(startPoint, endPoint),
                    options: options
                )
            )
        }
        
        public static func radialGradient(_ gradient: Gradient, center: CGPoint, startRadius: CGFloat, endRadius: CGFloat, options: GraphicsContext.GradientOptions = GradientOptions()) -> GraphicsContext.Shading {
            return GraphicsContext.Shading(
                storage: .gradient(
                    .gradient(gradient),
                    geometry: .radial(center, startRadius, endRadius),
                    options: options
                )
            )
        }
        
        @available(iOS 18.2, macOS 15.2, watchOS 11.2, tvOS 18.2, visionOS 2.2, *)
        public static func radialGradient(_ gradient: Gradient, startCenter: CGPoint, startRadius: CGFloat, endCenter: CGPoint, endRadius: CGFloat, options: GraphicsContext.GradientOptions = GradientOptions()) -> GraphicsContext.Shading {
            assertUnimplemented()
        }
        
        public static func conicGradient(_ gradient: Gradient, center: CGPoint, angle: Angle = Angle(), options: GraphicsContext.GradientOptions = GradientOptions()) -> GraphicsContext.Shading {
            assertUnimplemented()
        }
        
        @available(iOS 18.0, macOS 15.0, watchOS 11.0, tvOS 18.0, visionOS 2.0, *)
        public static func linearGradient(_ gradient: AnyGradient, startPoint: CGPoint, endPoint: CGPoint, options: GraphicsContext.GradientOptions = GradientOptions()) -> GraphicsContext.Shading {
            assertUnimplemented()
        }
        
        @available(iOS 18.0, macOS 15.0, watchOS 11.0, tvOS 18.0, visionOS 2.0, *)
        public static func radialGradient(_ gradient: AnyGradient, center: CGPoint, startRadius: CGFloat, endRadius: CGFloat, options: GraphicsContext.GradientOptions = GradientOptions()) -> GraphicsContext.Shading {
            assertUnimplemented()
        }
        
        @available(iOS 18.2, macOS 15.2, watchOS 11.2, tvOS 18.2, visionOS 2.2, *)
        public static func radialGradient(_ gradient: AnyGradient, startCenter: CGPoint, startRadius: CGFloat, endCenter: CGPoint, endRadius: CGFloat, options: GraphicsContext.GradientOptions = GradientOptions()) -> GraphicsContext.Shading {
            assertUnimplemented()
        }
        
        @available(iOS 18.0, macOS 15.0, watchOS 11.0, tvOS 18.0, visionOS 2.0, *)
        public static func conicGradient(_ gradient: AnyGradient, center: CGPoint, angle: Angle = Angle(), options: GraphicsContext.GradientOptions = GradientOptions()) -> GraphicsContext.Shading {
            assertUnimplemented()
        }
        
        public static func tiledImage(_ image: Image, origin: CGPoint = .zero, sourceRect: CGRect = CGRect(x: 0, y: 0, width: 1, height: 1), scale: CGFloat = 1) -> GraphicsContext.Shading {
            assertUnimplemented()
        }
        
        fileprivate private(set) var storage: GraphicsContext.Shading.Storage
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
        self.draw(path, with: shading, style: .fill(style))
    }
    
    public func stroke(_ path: Path, with shading: GraphicsContext.Shading, style: StrokeStyle) {
        self.draw(path, with: shading, style: .stroke(style))
    }
    
    public func stroke(_ path: Path, with shading: GraphicsContext.Shading, lineWidth: CGFloat = 1) {
        let style = StrokeStyle(
            lineWidth: lineWidth,
            lineCap: .butt,
            lineJoin: .miter,
            miterLimit: 10,
            dash: [],
            dashPhase: 0
        )
        
        self.draw(path, with: shading, style: .stroke(style))
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

extension GraphicsContext {
    fileprivate mutating func copyOnWrite() {
        guard !isKnownUniquelyReferenced(&self.storage) else {
            return
        }
        
        self.storage = GraphicsContext.Storage(from: self.storage)
    }
    
    func draw(_ path: Path, with shading: GraphicsContext.Shading, style: PathDrawingStyle) {
        /*
         path -> x0
         shading -> x1
         style -> x2
         */
        switch shading.storage {
        case .backdrop(let resolved):
            // <+892>
            switch style {
            case .fill(let fillStyle):
                // <+1204>
                self.storage.shared.shape.setPath(
                    path,
                    style: fillStyle,
                    shapeDistance: self.storage.shapeDistance
                )
            case .stroke(let strokeStyle):
                self.storage.shared.shape.setStrokedPath(
                    path,
                    style: strokeStyle
                )
            }
            
            // <+1244>
            let drawingState_1 = RBDrawingState.initialize(self.storage.state)
            drawingState_1.clipShape(self.storage.shared.shape, renderingMode: .unknown0)
            let drawingState_2 = drawingState_1.beginLayer(1)
            
            if resolved.opacity != 0 {
                self.storage.shared.shape.setInfinite()
                self.storage.shared.setColor(resolved)
                
                drawingState_2.drawShape(
                    shape: self.storage.shared.shape,
                    fill: self.storage.shared.fill,
                    blendMode: .unknown0,
                    opacity: 1
                )
            }
            
            // <+1344>
            drawingState_1.drawLayer(
                drawingState_2,
                blendMode: self.storage.blendMode,
                opacity: self.storage.opacity
            )
            
            drawingState_1.destroy()
        case .color, .sRGBColor, .shader, .gradient, .meshGradient, .tiledImage:
            // <+516>
            switch style {
            case .fill(let fillStyle):
                // <+984>
                self.storage.shared.shape.setPath(
                    path,
                    style: fillStyle,
                    shapeDistance: self.storage.shapeDistance
                )
            case .stroke(let strokeStyle):
                self.storage.shared.shape.setStrokedPath(
                    path,
                    style: strokeStyle
                )
            }
            
            // <+1024>
            self.storage.shared.setShading(shading, in: self.environment)
            
            self.storage.state.drawShape(
                shape: self.storage.shared.shape,
                fill: self.storage.shared.fill,
                blendMode: self.storage.blendMode,
                opacity: self.storage.opacity
            )
        case .style(let _style):
            // <+312>
            // sp + 0xd0
            var shape = _ShapeStyle_Shape(
                operation: .resolveStyle(name: .foreground, levels: 0..<1),
                result: .none,
                environment: self.environment,
                foregroundStyle: nil,
                bounds: nil,
                role: .fill,
                substrate: .graphicsContext
            )
            
            _style._apply(to: &shape)
            
            var pack: _ShapeStyle_Pack
            switch shape.result {
            case .pack(let _pack):
                pack = _pack
            default:
                pack = _ShapeStyle_Pack()
            }
            
            // <+1412>
            let __style = pack[.foreground, 0]
            
            __style.draw(
                path,
                style: style,
                in: self,
                bounds: shape.bounds
            )
        case .levels(let levels):
            // <+592>
            self.draw(path, with: levels.first!, style: style)
        case .resolved(let shading):
            // <+712>
            self.draw(path, with: shading, style: style)
        case .foreground:
            // <+148>
            let shading = self.storage.shared.resolvedForeground(in: self.environment)
            self.draw(path, with: shading, style: style)
        }
    }
    
    func draw(_ path: Path, with shading: GraphicsContext.ResolvedShading, style: PathDrawingStyle) {
        assertUnimplemented()
    }
    
    func addVariableBlurFilter(radius: CGFloat, mask: GraphicsContext.Shading, flags: RBBlurFlags) {
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

class GraphicsContextSymbols {
    // TODO
}

extension GraphicsContext {
    enum ResolvedShading {
        case backdrop(Color.ResolvedHDR)
        case color(Color.ResolvedHDR)
        case sRGBColor(RBColor)
        case shader(Shader.ResolvedShader, CGRect)
        case style(_ShapeStyle_Pack.Style)
        case gradient(ResolvedGradient, GraphicsContext.GradientGeometry, GraphicsContext.GradientOptions)
        case meshGradient(MeshGradient._Paint, CGRect)
        case tiledImage(GraphicsImage, origin: CGPoint, sourceRect: CGRect, scale: CGFloat)
        case levels([GraphicsContext.ResolvedShading])
    }
    
    enum GradientGeometry {
        case axial(CGPoint, CGPoint)
        case radial(CGPoint, CGFloat, CGFloat)
        case radial2(CGPoint, CGFloat, CGPoint, CGFloat)
        case elliptical(CGRect, CGFloat, CGFloat)
        case conic(CGPoint, Angle)
        case angular(CGPoint, Angle, Angle)
    }
}

extension GraphicsContext.Storage {
    fileprivate final class Shared {
        private let list: RBDisplayList // 0x10
        fileprivate var symbols: GraphicsContextSymbols? = nil // 0x18
        let shape = RBShape() // 0x20
        let fill = RBFill() // 0x28
        let _environment: EnvironmentValues // 0x30, 0x38
        let colorSpace: RBColorSpace // 0x40
        @IndirectOptional private var textProperties: TextLayoutProperties? = nil // 0x48
        private var _resolvedForeground: GraphicsContext.ResolvedShading? = nil // 0x50
        private var _foregroundIsMultiLevel: Bool? = nil // 0xf8
        private var _sharedPredicate: RBDisplayListPredicate? = nil // 0x100
        private var _sharedTransform: RBDisplayListTransform? = nil // 0x108
        private var _fillStyle: AnyShapeStyleBox? = nil // 0x110
        
        init(list: RBDisplayList, environment: EnvironmentValues) {
            self.list = list
            self._environment = environment
            self.colorSpace = list.defaultColorSpace
        }
        
        func resolvedForeground(in environment: EnvironmentValues?) -> GraphicsContext.ResolvedShading {
            assertUnimplemented()
        }
    }
}

extension GraphicsContext.Storage.Shared {
    func setShading(_ shading: GraphicsContext.Shading, in environment: EnvironmentValues) {
        /*
         self -> x20 -> x21
         shading -> x0 -> x25
         environment -> x1 -> x20
         */
        switch shading.storage {
        case .color(let color):
            // <+284>
            if let fillStyle = self._fillStyle, fillStyle === color.provider {
                // <+1464>
                return
            } else {
                // <+304>
                let resolved = color.provider.resolveHDR(in: environment)
                
                var rbColor = RBColor(
                    red: resolved.linearRed,
                    green: resolved.linearGreen,
                    blue: resolved.linearBlue,
                    alpha: resolved.opacity
                )
                
                if self.colorSpace != .unknown2 {
                    rbColor = .fromLinear(r: rbColor.red, g: rbColor.green, b: rbColor.blue, a: rbColor.alpha)
                }
                
                self.fill.setColor(rbColor)
                
                if let headroom = resolved.headroom {
                    self.fill.headroom = headroom
                }
                
                self._fillStyle = color.provider
            }
        case .sRGBColor(let color):
            // <+828>
            self.fill.setColor(color, colorSpace: .unknown1)
            self._fillStyle = nil
        case .shader(let shader, let bounds):
            // <+600>
            let rbShader = shader.rbShader(in: environment)
            
            withUnsafePointer(to: bounds) { bounds in
                unsafe self.fill.setShader(
                    rbShader,
                    bounds: bounds,
                    flags: RBShaderFlags(rawValue: shader.options.rawValue & 1)
                )
            }
        case .gradient(let gradient, let geometry, options: let options):
            // <+728>
            switch gradient {
            case .gradient(let gradient):
                // <+768>
                if gradient.stops.count == 1 {
                    // <+1408>
                    self.setColor(gradient.stops[0].color, in: environment)
                    return
                } else if !gradient.stops.isEmpty {
                    // <+1348>
                } else {
                    // <+784>
                    self.setColor(.clear, in: environment)
                    return
                }
            case .anyGradient(_):
                // <+1348>
                break
            }
            
            unsafe withGradient(
                gradient,
                in: environment,
                colorSpace: self.colorSpace
            ) { count, colors, headroom, locations, flags in
                // $s7SwiftUI15GraphicsContextV7StorageC6Shared33_A8D9ECD380926237F7E554221FB2DE85LLCAAE11setGradient_8geometry7options2in10colorSpaceyAA06EitherO0O_AC0O8GeometryOAC0O7OptionsVAA17EnvironmentValuesVSo07RBColorT0VtFySi_SPySo0Z0aGSfSgSPy04CoreC07CGFloatVGSgSo15RBGradientFlagsVtXEfU_Tm
                /*
                 index -> x0
                 color -> x1
                 unknown -> x2
                 locations -> x3
                 flags -> x4
                 */
                let newFlags = flags.union(options)
                
                switch geometry {
                case .axial(let startPoint, let endPoint):
                    // <+192>
                    unsafe self.fill.setAxialGradientStart(
                        startPoint,
                        end: endPoint,
                        stopCount: count,
                        colors: colors,
                        locations: locations,
                        flags: newFlags
                    )
                    
                    // <+360>
                case .radial(let center, let startRadius, let endRadius):
                    // <+140>
                    unsafe self.fill.setRadialGradientCenter(
                        center,
                        startRadius: startRadius,
                        endRadius: endRadius,
                        stopCount: count,
                        colors: colors,
                        locations: locations,
                        flags: newFlags
                    )
                    
                    // <+360>
                case .radial2(let startCenter, let startRadius, let endCenter, let endRadius):
                    // <+328>
                    unsafe self.fill.setRadialGradientStartCenter(
                        startCenter,
                        startRadius: startRadius,
                        endCenter: endCenter,
                        endRadius: endRadius,
                        stopCount: count,
                        colors: colors,
                        locations: locations,
                        flags: newFlags
                    )
                    
                    // <+360>
                case .elliptical(let rect, let startRadius, let endRadius):
                    // <+200>
                    unsafe self.fill.setRadialGradientCenter(
                        .zero,
                        startRadius: startRadius,
                        endRadius: endRadius,
                        stopCount: count,
                        colors: colors,
                        locations: locations,
                        flags: newFlags
                    )
                    
                    let transform = CGAffineTransform(rect.width, 0, 0, rect.height, rect.origin.x, rect.origin.y)
                    self.fill.concat(transform)
                    
                    // <+360>
                case .conic(let center, let angle):
                    // <+168>
                    unsafe self.fill.setConicGradientCenter(
                        center,
                        angle: angle.radians,
                        stopCount: count,
                        colors: colors,
                        locations: locations,
                        flags: newFlags
                    )
                    
                    // <+360>
                case .angular(let center, let startAngle, let endAngle):
                    // <+336>
                    unsafe self.fill.setAngularGradientCenter(
                        center,
                        startAngle: startAngle.radians,
                        endAngle: endAngle.radians,
                        stopCount: count,
                        colors: colors,
                        colorSpace: .unknown0,
                        locations: locations,
                        flags: newFlags
                    )
                    
                    // <+360>
                }
                
                // <+360>
                if let headroom {
                    self.fill.headroom = headroom
                }
                
                self._fillStyle = nil
            }
        case .meshGradient(let mesh):
            // <+440>
            let resolved = mesh.background.provider.resolveHDR(in: environment)
            
            unsafe mesh.withResolvedColors(in: environment) { colors, headroom in
                let block: (RBMeshGradientType, UnsafePointer<Float>) -> Void = { meshGradientType, positions in
                    let _headroom: Float
                    if let __headroom = resolved.headroom {
                        if let headroom {
                            _headroom = (__headroom <= headroom) ? headroom : __headroom
                        } else {
                            _headroom = __headroom
                        }
                    } else {
                        if let headroom {
                            _headroom = headroom
                        } else {
                            _headroom = .nan
                        }
                    }
                    
                    let flags: RBMeshGradientFlags
                    let w8 = mesh.smoothsColors
                    let w9 = mesh.colorSpace
                    
                    if w9 == .device {
                        // <+292>
                        if w8 {
                            flags = [.unknown4]
                        } else {
                            flags = []
                        }
                    } else if w9 == .linear {
                        // <+280>
                        if w8 {
                            flags = [.unknown0, .unknown4]
                        } else {
                            flags = [.unknown0]
                        }
                    } else {
                        // <+304>
                        if w8 {
                            flags = [.unknown0, .unknown1, .unknown4]
                        } else {
                            flags = [.unknown0, .unknown1]
                        }
                    }
                    
                    unsafe self.fill.setMeshGradientType(
                        meshGradientType,
                        positions: positions,
                        colors: UnsafeRawPointer(colors.baseAddress.unsafelyUnwrapped)
                            .assumingMemoryBound(to: RBColor.self),
                        count: UInt(bitPattern: mesh.height * mesh.width),
                        width: UInt(bitPattern: mesh.width),
                        background: RBColor(
                            red: resolved.linearRed,
                            green: resolved.linearGreen,
                            blue: resolved.linearBlue,
                            alpha: resolved.opacity
                        ),
                        colorSpace: .unknown2,
                        flags: flags
                    )
                    
                    if !_headroom.isNaN {
                        self.fill.headroom = _headroom
                    }
                    
                    self._fillStyle = nil
                }
                
                switch mesh.locations {
                case .points(let array):
                    array.withUnsafeBufferPointer { pointer in
                        unsafe block(
                            .unknown1,
                            UnsafeRawPointer(pointer.baseAddress.unsafelyUnwrapped)
                                .assumingMemoryBound(to: Float.self),
                        )
                    }
                case .bezierPoints(let array):
                    array.withUnsafeBufferPointer { pointer in
                        unsafe block(
                            .unknown2,
                            UnsafeRawPointer(pointer.baseAddress.unsafelyUnwrapped)
                                .assumingMemoryBound(to: Float.self),
                        )
                    }
                }
            }
        case .tiledImage(let image, origin: let origin, sourceRect: let sourceRect, scale: let scale):
            // <+944>
            var context = ImageResolutionContext(
                environment: environment,
                textStyle: nil,
                transaction: OptionalAttribute()
            )
            context.options = []
            
            let resolved = image.provider.resolve(in: context)
            
            self.fill.setRepeatedImage(
                resolved.image,
                origin: origin,
                scale: scale,
                sourceRect: sourceRect,
                in: self.colorSpace
            )
            
            self._fillStyle = nil
        case .backdrop, .style, .levels, .resolved, .foreground:
            // <+1564>
            fatalError("not reached")
        }
    }
    
    func setShading(_ shading: GraphicsContext.ResolvedShading) {
        assertUnimplemented()
    }
    
    func setColor(_ color: Color.ResolvedHDR) {
        assertUnimplemented()
    }
    
    func setColor(_ color: Color, in environment: EnvironmentValues) {
        assertUnimplemented()
    }
    
    func setMeshGradient(_ paint: MeshGradient._Paint, in rect: CGRect) {
        assertUnimplemented()
    }
}

extension GraphicsContext.Shading {
    enum Storage : @unchecked Sendable {
        case backdrop(Color.ResolvedHDR)
        case color(Color)
        case sRGBColor(RBColor)
        case shader(Shader, CGRect)
        case style(AnyShapeStyle)
        case gradient(EitherGradient, geometry: GraphicsContext.GradientGeometry, options: GraphicsContext.GradientOptions)
        case meshGradient(MeshGradient)
        case tiledImage(Image, origin: CGPoint, sourceRect: CGRect, scale: CGFloat)
        case levels([GraphicsContext.Shading])
        case resolved(GraphicsContext.ResolvedShading)
        case foreground // 10
    }
}

extension RBShape {
    fileprivate func setPath(_ path: Path, style: FillStyle, shapeDistance: CGFloat) {
        switch path.storage {
        case .empty:
            // <+392>
            self.setEmpty()
        case .rect(let rect):
            // <+224>
            self.setRect(rect)
        case .ellipse(let rect):
            // <+76>
            self.setEllipseIn(rect)
        case .roundedRect(let roundedRect):
            // <+252>
            let d9 = roundedRect.rect.origin.x
            let d10 = roundedRect.rect.origin.y
            let d11 = roundedRect.rect.size.width
            let d12 = roundedRect.rect.size.height
            let d13 = roundedRect.cornerSize.width
            let d14 = roundedRect.cornerSize.height
            var d0 = abs(roundedRect.rect.width)
            var d1: CGFloat = 0.5
            let d15 = d0 * d1
            d0 = abs(roundedRect.rect.height)
            d1 = 0.5
            d0 = d0 * d1
            d0 = (d0 < d15) ? d0 : d15
            let d4 = (d0 < d13) ? d0 : d13
            let d5 = (d0 < d14) ? d0 : d14
            let cornerStyle: RBPathRoundedCornerStyle = (roundedRect.style == .circular) ? .circular : .continuous
            
            self.setRoundedRect(
                CGRect(x: d9, y: d10, width: d11, height: d12),
                cornerSize: CGSize(width: d4, height: d5),
                cornerStyle: cornerStyle
            )
        case .stroked, .trimmed, .path:
            // <+136>
            let rbPath = unsafe path.retainRBPath()
            let transform = CGAffineTransform(1, 0, 0, 1, 0, 0)
            unsafe self.setRBPath(rbPath, transform: transform)
            self.eoFill = style.isEOFilled
            unsafe rbPath.release()
        }
        
        // <+400>
        self.setRenderingMode(
            style: style,
            shapeDistance: shapeDistance
        )
    }
    
    fileprivate func setStrokedPath(_ path: Path, style: StrokeStyle) {
        /*
         self -> x20 -> x19
         path -> x0 -> x20
         style -> x1 -> x21
         */
        if style.dash.isEmpty {
            // <+188>
            switch path.storage {
            case .empty:
                // <+460>
                self.setEmpty()
                return
            case .rect(let rect):
                // <+504>
                switch style.lineJoin {
                case .miter:
                    // <+512>
                    let d0 = style.miterLimit
                    let d1: CGFloat = 1.4142
                    
                    if !(d1 <= d0) {
                        // <+64>
                    } else {
                        self.setStrokedRect(rect, lineWidth: style.lineWidth)
                        return
                    }
                default:
                    // <+64>
                    break
                }
            case .ellipse(let rect):
                // <+220>
                if rect.width != rect.height {
                    // <+64>
                } else {
                    // <+288>
                    var d0 = rect.width
                    let d14: CGFloat = 0.5
                    d0 = d0 * d14
                    let d12 = d0 + rect.origin.x
                    d0 = rect.height
                    d0 = d0 * d14
                    let d13 = d0 + rect.origin.y
                    d0 = rect.width
                    let d2 = d0 * d14
                    
                    self.setStrokedCircleAt(
                        CGPoint(x: d12, y: d13),
                        radius: d2,
                        lineWidth: style.lineWidth
                    )
                    return
                }
            case .roundedRect(let rect):
                // <+608>
                let d13 = rect.cornerSize.width
                var d0 = rect.cornerSize.height
                let cmp = (d13 != d0)
                d0 = abs(d13 - d0)
                var d1: CGFloat = 0.001
                
                if cmp && !(d0 < d1) {
                    // <+64>
                } else {
                    // <+648>
                    let d12 = rect.rect.width
                    d0 = rect.rect.height
                    d0 = (d0 < d12) ? d0 : d12
                    d1 = 0.5
                    d0 = d0 * d1
                    let d4 = (d0 < d13) ? d0 : d13
                    
                    self.setStrokedRoundedRect(
                        rect.rect,
                        cornerRadius: d4,
                        cornerStyle: (rect.style == .circular) ? .circular : .continuous,
                        lineWidth: style.lineWidth
                    )
                    
                    return
                }
            case .stroked, .trimmed, .path:
                // <+64>
                break
            }
        }
        
        // <+64>
        style.dash.withUnsafeBufferPointer { pointer in
            let rbPath = unsafe path.retainRBPath()
            let transform = CGAffineTransform(1, 0, 0, 1, 0, 0)
            
            unsafe self.setStrokedRBPath(
                rbPath,
                transform: transform,
                lineWidth: style.lineWidth,
                lineCap: style.lineCap,
                lineJoin: style.lineJoin,
                miterLimit: style.miterLimit,
                dashPhase: style.dashPhase,
                dashPattern: pointer.baseAddress.unsafelyUnwrapped,
                dashCount: pointer.count
            )
            
            unsafe rbPath.release()
        }
    }
    
    fileprivate func setRenderingMode(style: FillStyle, shapeDistance: CGFloat) {
        if shapeDistance.isNaN {
            self.renderingMode = style.isAntialiased ? .unknown0 : .unknown1
        } else {
            self.renderingMode = (shapeDistance >= 0) ? .unknown2 : .unknown3
            self.renderingModeArgument = abs(shapeDistance)
        }
    } 
}

extension RBFill {
    fileprivate func setRepeatedImage(_: GraphicsImage, origin: CGPoint, scale: CGFloat, sourceRect: CGRect, in: RBColorSpace) {
        assertUnimplemented()
    }
}

fileprivate func withGradient(
    _ gradient: EitherGradient,
    in environment: EnvironmentValues,
    colorSpace: RBColorSpace,
    do block: (Int, UnsafePointer<RBColor>, Float?, UnsafePointer<CGFloat>?, RBGradientFlags) -> Void
) {
    switch gradient {
    case .gradient(let gradient):
        var headroom: Float? = nil
        let count = gradient.stops.count
        
        guard count != 0 else {
            return
        }
        
        unsafe withGradientStorage(
            count: count,
            valuesPerLocation: 1,
            element: { index, color, value in
                // $s7SwiftUI12withGradient33_A8D9ECD380926237F7E554221FB2DE85LL_2in10colorSpace2doyAA06EitherD0O_AA17EnvironmentValuesVSo07RBColorN0VySi_SPySo0S0aGSfSgSPy12CoreGraphics7CGFloatVGSgSo15RBGradientFlagsVtXEtFySi_ANzSpyASGtXEfU_TA
                let stop = gradient.stops[index]
                let resolved = stop.color.resolveHDR(in: environment)
                var rbColor = RBColor(
                    red: resolved.linearRed,
                    green: resolved.linearGreen,
                    blue: resolved.linearBlue,
                    alpha: resolved.opacity
                )
                
                if colorSpace != .unknown2 {
                    rbColor = RBColor.fromLinear(
                        r: rbColor.red,
                        g: rbColor.green,
                        b: rbColor.blue,
                        a: rbColor.alpha
                    )
                }
                
                color = rbColor
                
                if let _headroom = headroom {
                    if let __headroom = resolved.headroom {
                        headroom = (_headroom <= __headroom) ? __headroom : _headroom
                    }
                } else {
                    headroom = resolved.headroom
                }
                
                unsafe value.initialize(to: stop.location)
            },
            do: { colors, values in
                // $s7SwiftUI12withGradient33_A8D9ECD380926237F7E554221FB2DE85LL_2in10colorSpace2doyAA06EitherD0O_AA17EnvironmentValuesVSo07RBColorN0VySi_SPySo0S0aGSfSgSPy12CoreGraphics7CGFloatVGSgSo15RBGradientFlagsVtXEtFyAO_ATtXEfU0_TA
                unsafe block(count, colors, headroom, values, [])
            }
        )
    case .anyGradient(let gradient):
        let resolved = gradient.provider.resolve(in: environment)
        let hasInterpolations = resolved.hasInterpolations
        let count = resolved.stops.count
        
        guard count != 0 else {
            return
        }
        
        unsafe withGradientStorage(
            count: count,
            valuesPerLocation: hasInterpolations ? 5 : 1,
            element: { index, color, value in
                // $s7SwiftUI12withGradient33_A8D9ECD380926237F7E554221FB2DE85LL_2in2doyAA08ResolvedD0V_So12RBColorSpaceVySi_SPySo0O0aGSfSgSPy12CoreGraphics7CGFloatVGSgSo15RBGradientFlagsVtXEtFySi_AKzSpyAPGtXEfU_TA
                let stop = resolved.stops[index]
                var rbColor = RBColor(
                    red: stop.color.linearRed,
                    green: stop.color.linearGreen,
                    blue: stop.color.linearBlue,
                    alpha: stop.color.opacity
                )
                
                if colorSpace != .unknown2 {
                    rbColor = RBColor.fromLinear(
                        r: rbColor.red,
                        g: rbColor.green,
                        b: rbColor.blue,
                        a: rbColor.alpha
                    )
                }
                
                color = rbColor
                unsafe value.initialize(to: stop.location)
                
                if hasInterpolations {
                    if let interpolation = stop.interpolation {
                        unsafe value.advanced(by: 1).initialize(to: CGFloat(interpolation.p1x))
                        unsafe value.advanced(by: 2).initialize(to: CGFloat(interpolation.p1y))
                        unsafe value.advanced(by: 3).initialize(to: CGFloat(interpolation.p2x))
                        unsafe value.advanced(by: 4).initialize(to: CGFloat(interpolation.p2y))
                    } else {
                        unsafe value.advanced(by: 1).initialize(to: 0)
                        unsafe value.advanced(by: 2).initialize(to: 0)
                        unsafe value.advanced(by: 3).initialize(to: 1)
                        unsafe value.advanced(by: 4).initialize(to: 1)
                    }
                }
            },
            do: { colors, values in
                // $s7SwiftUI12withGradient33_A8D9ECD380926237F7E554221FB2DE85LL_2in2doyAA08ResolvedD0V_So12RBColorSpaceVySi_SPySo0O0aGSfSgSPy12CoreGraphics7CGFloatVGSgSo15RBGradientFlagsVtXEtFyAL_AQtXEfU0_TA
                let headroom = resolved.headroom
                let colorspace = resolved.colorSpace
                
                let flags: RBGradientFlags
                if colorspace == .device {
                    // <+72>
                    if hasInterpolations {
                        flags = [.unknown7, .unknown9]
                    } else {
                        flags = [.unknown7]
                    }
                } else if colorspace == .linear {
                    // <+60>
                    if hasInterpolations {
                        flags = [.unknown6, .unknown9]
                    } else {
                        flags = [.unknown6]
                    }
                } else {
                    // <+84>
                    if hasInterpolations {
                        flags = [.unknown6, .unknown7, .unknown9]
                    } else {
                        flags = [.unknown6, .unknown7]
                    }
                }
                
                unsafe block(count, colors, headroom, values, flags)
            }
        )
    }
} 

fileprivate func withGradient(
    _: ResolvedGradient,
    in: RBColorSpace,
    do: (Int, UnsafePointer<RBColor>, Float?, UnsafePointer<CGFloat>?, RBGradientFlags) -> Void
) {
    assertUnimplemented()
}

fileprivate func withGradientStorage(
    count: Int,
    valuesPerLocation: Int,
    element: (Int, inout RBColor, UnsafeMutablePointer<CGFloat>) -> Void,
    do block: (UnsafePointer<RBColor>, UnsafePointer<CGFloat>) -> Void
) {
    withUnsafeTemporaryAllocation(of: RBColor.self, capacity: count) { colorsBuffer in
        // $s7SwiftUI19withGradientStorage33_A8D9ECD380926237F7E554221FB2DE85LL5count17valuesPerLocation7element2doySi_SiySi_So7RBColorazSpy12CoreGraphics7CGFloatVGtXEySPyAIG_SPyALGtXEtFySryAIGXEfU_
        withUnsafeTemporaryAllocation(of: CGFloat.self, capacity: count * valuesPerLocation) { buffer in
            // $s7SwiftUI19withGradientStorage33_A8D9ECD380926237F7E554221FB2DE85LL5count17valuesPerLocation7element2doySi_SiySi_So7RBColorazSpy12CoreGraphics7CGFloatVGtXEySPyAIG_SPyALGtXEtFySryAIGXEfU_ySryALGXEfU_
            for i in 0..<count {
                unsafe element(i, &colorsBuffer[i], &buffer[i * valuesPerLocation])
            }
            
            unsafe block(
                UnsafePointer(colorsBuffer.baseAddress.unsafelyUnwrapped),
                UnsafePointer(buffer.baseAddress.unsafelyUnwrapped)
            )
        }
    }
}

extension GraphicsContext.Filter {
    struct Shadow {
        private(set) var color: Color
        private(set) var radius: CGFloat
        private(set) var offset: CGSize
        private(set) var blend: GraphicsContext.BlendMode
        private(set) var options: GraphicsContext.ShadowOptions
    }

    struct ResolvedShadow {
        private(set) var color: Color.ResolvedHDR
        private(set) var radius: CGFloat
        private(set) var offset: CGSize
        private(set) var midpoint: Float
        private(set) var blend: GraphicsContext.BlendMode
        private(set) var options: GraphicsContext.ShadowOptions
    }
    
    enum Storage {
        case projection(ProjectionTransform)
        case rotation(_RotationEffect.Data)
        case rotation3D(_Rotation3DEffect.Data)
        case shadow(GraphicsContext.Filter.Shadow) // 0x18000000
        case resolvedShadow(GraphicsContext.Filter.ResolvedShadow)
        case pathProjection(CGPoint, CGPoint, Path, RBPathProjectionFlags)
        case colorMultiply(Color)
        case colorMultiplyResolved(Color.ResolvedHDR)
        case alphaMultiply(Color)
        case alphaMultiplyResolved(Color.ResolvedHDR)
        case colorMatrix(_ColorMatrix, premultiplied: Bool)
        case hueRotate(Angle)
        case saturate(Float)
        case brightness(Float)
        case contrast(Float)
        case invert(Float)
        case grayscale(Float)
        case blur(CGFloat, RBBlurFlags)
        case variableBlur(CGFloat, GraphicsContext.Shading, RBBlurFlags)
        case alphaThreshold(Float, Float, Color)
        case alphaGradient(EitherGradient)
        case colorMonochrome(GraphicsFilter.ColorMonochrome)
        case luminanceCurve(GraphicsFilter.LuminanceCurve)
        case colorCurves(GraphicsFilter.ColorCurves)
        case shader(Shader, border: CGSize, size: CGSize)
        case luminanceToAlpha
    }
}

extension RBDrawingState {
    fileprivate func addProjectionTransform(_ transform: ProjectionTransform) {
        assertUnimplemented()
    }
}
