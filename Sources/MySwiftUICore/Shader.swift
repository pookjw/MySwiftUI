// 2BFAEFF753052DBF4DEF07051FF899A7
public import CoreGraphics
public import Foundation
internal import RenderBox
private import AttributeGraph

@available(iOS 17.0, macOS 14.0, tvOS 17.0, *)
@available(watchOS, unavailable)
@dynamicMemberLookup public struct ShaderLibrary : Equatable, @unchecked Sendable {
    public static let `default` = ShaderLibrary(rbShaderLibrary: RBShaderLibrary.default())
    
    public static func bundle(_ bundle: Bundle) -> ShaderLibrary {
        return ShaderLibrary(rbShaderLibrary: RBShaderLibrary.defaultLibrary(with: bundle))
    }
    
    private var rbLibrary: RBShaderLibrary
    
    public init(data: Data) {
        assertUnimplemented()
    }
    
    public init(url: URL) {
        assertUnimplemented()
    }
    
    public static subscript(dynamicMember name: String) -> ShaderFunction {
        assertUnimplemented()
    }
    
    public subscript(dynamicMember name: String) -> ShaderFunction {
        return ShaderFunction(library: self, name: name)
    }
    
    public static func == (lhs: ShaderLibrary, rhs: ShaderLibrary) -> Bool {
        assertUnimplemented()
    }
}

extension ShaderLibrary {
    static var system: ShaderLibrary {
        assertUnimplemented()
    }
    
    init(rbShaderLibrary: RBShaderLibrary) {
        self.rbLibrary = rbShaderLibrary
    }
    
    var rbShaderLibrary: RBShaderLibrary? {
        assertUnimplemented()
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, *)
@available(watchOS, unavailable)
@dynamicCallable public struct ShaderFunction : Equatable, Sendable {
    public var library: ShaderLibrary
    public var name: String
    
    public init(library: ShaderLibrary, name: String) {
        self.library = library
        self.name = name
    }
    
    public func dynamicallyCall(withArguments args: [Shader.Argument]) -> Shader {
        return Shader(function: self, arguments: args)
    }
    
    public static func == (a: ShaderFunction, b: ShaderFunction) -> Bool {
        assertUnimplemented()
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, *)
@available(watchOS, unavailable)
public struct Shader : Equatable, Sendable {
    public struct Argument : Equatable, Sendable {
        private var storage: Storage
        
        @usableFromInline
        internal static func _float(_ x: Float) -> Shader.Argument {
            return Shader.Argument(storage: .float(x))
        }
        
        @usableFromInline
        internal static func _float2(_ x: Float, _ y: Float) -> Shader.Argument {
            return Shader.Argument(storage: .float2(x, y))
        }
        
        @usableFromInline
        internal static func _float3(_ x: Float, _ y: Float, _ z: Float) -> Shader.Argument {
            return Shader.Argument(storage: .float3(x, y, z))
        }
        
        @usableFromInline
        internal static func _float4(_ x: Float, _ y: Float, _ z: Float, _ w: Float) -> Shader.Argument {
            return Shader.Argument(storage: .float4(x, y, z, w))
        }
        
        @_alwaysEmitIntoClient
        public static func float<T : BinaryFloatingPoint>(_ x: T) -> Shader.Argument {
            return _float(Float(x))
        }
        
        @_alwaysEmitIntoClient
        public static func float2<T : BinaryFloatingPoint>(_ x: T, _ y: T) -> Shader.Argument {
            return _float2(Float(x), Float(y))
        }
        
        @_alwaysEmitIntoClient
        public static func float3<T : BinaryFloatingPoint>(_ x: T, _ y: T, _ z: T) -> Shader.Argument {
            return _float3(Float(x), Float(y), Float(z))
        }
        
        @_alwaysEmitIntoClient
        public static func float4<T : BinaryFloatingPoint>(_ x: T, _ y: T, _ z: T, _ w: T) -> Shader.Argument {
            return _float4(Float(x), Float(y), Float(z), Float(w))
        }
        
        @_alwaysEmitIntoClient
        public static func float2(_ point: CGPoint) -> Shader.Argument {
            return _float2(Float(point.x), Float(point.y))
        }
        
        @_alwaysEmitIntoClient
        public static func float2(_ size: CGSize) -> Shader.Argument {
            return _float2(Float(size.width), Float(size.height))
        }
        
        @_alwaysEmitIntoClient
        public static func float2(_ vector: CGVector) -> Shader.Argument {
            return _float2(Float(vector.dx), Float(vector.dy))
        }
        
        public static func floatArray(_ array: [Float]) -> Shader.Argument {
            return Shader.Argument(storage: .floatArray(array))
        }
        
        public static var boundingRect: Shader.Argument {
            return Shader.Argument(storage: .boundsRect)
        }
        
        public static func color(_ color: Color) -> Shader.Argument {
            return Shader.Argument(storage: .color(color))
        }
        
        public static func colorArray(_ array: [Color]) -> Shader.Argument {
            return Shader.Argument(storage: .colorArray(array))
        }
        
        public static func image(_ image: Image) -> Shader.Argument {
            return Shader.Argument(storage: .image(image))
        }
        
        public static func data(_ data: Data) -> Shader.Argument {
            return Shader.Argument(storage: .data(data))
        }
        
        public static func == (a: Shader.Argument, b: Shader.Argument) -> Bool {
            assertUnimplemented()
        }
        
        enum Storage {
            case float(Float)
            case float2(Float, Float)
            case float3(Float, Float, Float)
            case float4(Float, Float, Float, Float)
            case floatArray([Float])
            case color(Color)
            case colorArray([Color])
            case resolvedColor(Color.ResolvedHDR)
            case image(Image)
            case data(Data)
            case boundsRect
        }
    }
    
    public var function: ShaderFunction
    public var arguments: [Shader.Argument]
    var options: Shader.Options // 0x20
    
    public var dithersColor: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    var alphaOnlyLayer: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    var ignoresSecondaryDOD: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public init(function: ShaderFunction, arguments: [Shader.Argument]) {
        self.options = []
        self.function = function
        self.arguments = arguments
    }
    
    func rbShader(in environment: EnvironmentValues) -> RBShader? {
        return self.makeRBShader(in: environment)
    }
    
    fileprivate func makeRBShader(in environment: EnvironmentValues?) -> RBShader {
        assertUnimplemented()
    }
    
    public static func == (a: Shader, b: Shader) -> Bool {
        assertUnimplemented()
    }
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, *)
@available(watchOS, unavailable)
extension Shader {
    public func compile(as type: Shader.UsageType) async throws {
        assertUnimplemented()
    }
    
    public struct UsageType : Hashable, Sendable {
        private var value: UInt32
        
        public static let shapeStyle: Shader.UsageType = {
            assertUnimplemented()
        }()
        
        public static let colorEffect: Shader.UsageType = {
            assertUnimplemented()
        }()
        
        public static let distortionEffect: Shader.UsageType = {
            assertUnimplemented()
        }()
        
        public static let layerEffect: Shader.UsageType = {
            assertUnimplemented()
        }()
        
        public static func == (a: Shader.UsageType, b: Shader.UsageType) -> Bool {
            assertUnimplemented()
        }
        
        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        public var hashValue: Int {
            assertUnimplemented()
        }
    }
}

extension Shader {
    struct Options : OptionSet {
        let rawValue: UInt32
        
        init(rawValue: UInt32) {
            self.rawValue = rawValue
        }
        
        static let dithersColor = Options(rawValue: 1 << 0)
        static let colorFilter = Options(rawValue: 1 << 1)
        static let distortionFilter = Options(rawValue: 1 << 2)
        static let alphaOnlyLayer = Options(rawValue: 1 << 3)
        static let ignoresSecondaryDOD = Options(rawValue: 1 << 4)
    }
}

extension Shader {
    struct ResolvedShader : ResolvedPaint, @MainActor RendererEffect, ViewModifier, ProtobufEncodableMessage, ProtobufDecodableMessage {
        @safe nonisolated(unsafe) var rbShader: RBShader?
        var maxSampleOffset: CGSize
        var options: Shader.Options
        
        nonisolated init(rbShader: RBShader?, maxSampleOffset: CGSize, options: Shader.Options) {
            self.rbShader = rbShader
            self.maxSampleOffset = maxSampleOffset
            self.options = options
        }
        
        static func == (lhs: Shader.ResolvedShader, rhs: Shader.ResolvedShader) -> Bool {
            assertUnimplemented()
        }
        
        var animatableData: ShaderVectorData {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        func draw(path: Path, style: PathDrawingStyle, in context: GraphicsContext, bounds: CGRect?) {
            assertUnimplemented()
        }
        
        nonisolated func effectValue(size: CGSize) -> DisplayList.Effect {
            assertUnimplemented()
        }
        
        var isCALayerCompatible: Bool {
            assertUnimplemented()
        }
        
        nonisolated var rbFillFlags: RBShaderFillFlags {
            assertUnimplemented()
        }

        nonisolated var rbFilterFlags: RBShaderFilterFlags {
            assertUnimplemented()
        }
        
        func encode(to encoder: inout ProtobufEncoder) throws {
            assertUnimplemented()
        }
        
        init(from decoder: inout ProtobufDecoder) throws {
            assertUnimplemented()
        }
        
        typealias Body = Never
    }
}

extension Shader : ShapeStyle {
    public typealias Resolved = Never
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, *)
@available(watchOS, unavailable)
public struct _ShaderFilterEffect : ViewModifier, VisualEffect, Sendable {
    var shader: Shader
    var maxSampleOffset: CGSize
    var enabled: Bool
    
    init(shader: Shader, maxSampleOffset: CGSize, enabled: Bool) {
        self.shader = shader
        self.maxSampleOffset = maxSampleOffset
        self.enabled = enabled
    }
    
    nonisolated public static func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    nonisolated public static func _makeVisualEffect(effect: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    public typealias Body = Never
    public typealias AnimatableData = EmptyAnimatableData
}

extension _ShaderFilterEffect : MultiViewModifier, PrimitiveViewModifier {}

extension _ShaderFilterEffect {
    fileprivate struct ResolvedEffect : AsyncAttribute, StatefulRule {
        typealias Value = Shader.ResolvedShader?
        
        mutating func updateValue() {
            assertUnimplemented()
        }
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension View {
    nonisolated public func colorEffect(_ shader: Shader, isEnabled: Bool = true) -> some View {
        var shader = shader
        shader.options.formUnion(.colorFilter)
        return self.layerEffect(shader, maxSampleOffset: .zero, isEnabled: isEnabled)
    }
    
    nonisolated public func distortionEffect(_ shader: Shader, maxSampleOffset: CGSize, isEnabled: Bool = true) -> some View {
        var shader = shader
        shader.options.formUnion(.distortionFilter)
        return self.layerEffect(shader, maxSampleOffset: maxSampleOffset, isEnabled: isEnabled)
    }
    
    nonisolated public func layerEffect(_ shader: Shader, maxSampleOffset: CGSize, isEnabled: Bool = true) -> some View {
        let modifier = _ShaderFilterEffect(shader: shader, maxSampleOffset: maxSampleOffset, enabled: isEnabled)
        return self.modifier(modifier)
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension VisualEffect {
    public func colorEffect(_ shader: Shader, isEnabled: Bool = true) -> some VisualEffect {
        __MSUI_UnimplementedVisualEffecte()
    }
    
    public func distortionEffect(_ shader: Shader, maxSampleOffset: CGSize, isEnabled: Bool = true) -> some VisualEffect {
        __MSUI_UnimplementedVisualEffecte()
    }
    
    public func layerEffect(_ shader: Shader, maxSampleOffset: CGSize, isEnabled: Bool = true) -> some VisualEffect {
        __MSUI_UnimplementedVisualEffecte()
    }
}
