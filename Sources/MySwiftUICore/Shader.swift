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
        return self.rbLibrary
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
        fileprivate private(set) var storage: Shader.Argument.Storage
        
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
        /*
         self -> x20
         environment -> x0 -> x21
         */
        let rbShader = RBShader(
            library: self.function.library.rbShaderLibrary,
            function: self.function.name
        )
        
        for (index, argument) in self.arguments.enumerated() {
            switch argument.storage {
            case .float(let float):
                // <+484>
                withUnsafePointer(to: float) { pointer in
                    unsafe rbShader.setArgumentBytes(
                        pointer,
                        at: UInt(bitPattern: index),
                        type: .unknown1,
                        count: 1,
                        flags: []
                    )
                }
            case .float2(let float, let float2):
                // <+832>
                withUnsafePointer(to: (float, float2)) { pointer in
                    unsafe rbShader.setArgumentBytes(
                        pointer,
                        at: UInt(bitPattern: index),
                        type: .unknown2,
                        count: 1,
                        flags: []
                    )
                }
            case .float3(let float, let float2, let float3):
                // <+568>
                withUnsafePointer(to: (float, float2, float3)) { pointer in
                    unsafe rbShader.setArgumentBytes(
                        pointer,
                        at: UInt(bitPattern: index),
                        type: .unknown3,
                        count: 1,
                        flags: []
                    )
                }
            case .float4(let float, let float2, let float3, let float4):
                // <+636>
                withUnsafePointer(to: (float, float2, float3, float4)) { pointer in
                    unsafe rbShader.setArgumentBytes(
                        pointer,
                        at: UInt(bitPattern: index),
                        type: .unknown4,
                        count: 1,
                        flags: []
                    )
                }
            case .floatArray(let array):
                // <+332>
                array.withUnsafeBufferPointer { pointer in
                    unsafe rbShader.setArgumentBytes(
                        pointer.baseAddress.unsafelyUnwrapped,
                        at: UInt(bitPattern: index),
                        type: .unknown1,
                        count: UInt(bitPattern: pointer.count),
                        flags: [.unknown0, .unknown1]
                    )
                }
            case .color(let color):
                // <+888>
                let resolved: Color.ResolvedHDR
                if let environment {
                    resolved = color.provider.resolveHDR(in: environment)
                } else {
                    resolved = .clear
                }
                
                withUnsafePointer(to: resolved.base) { pointer in
                    unsafe rbShader.setArgumentBytes(
                        pointer,
                        at: UInt(bitPattern: index),
                        type: .unknown5,
                        count: 1,
                        flags: []
                    )
                }
                
                rbShader.setArgumentColorSpace(.unknown2, at: UInt(bitPattern: index))
                
                if let headroom = resolved.headroom {
                    rbShader.setArgumentHeadroom(headroom, at: UInt(bitPattern: index))
                }
            case .colorArray(let array):
                // <+940>
                if let environment {
                    // <+1348>
                    withUnsafeTemporaryAllocation(of: Color.Resolved.self, capacity: array.count) { pointer in
                        // $s7SwiftUI6ShaderV12makeRBShader33_2BFAEFF753052DBF4DEF07051FF899A7LL2inSo0E0CAA17EnvironmentValuesVSg_tFySRyAA5ColorVGXEfU1_ySryAM8ResolvedVGXEfU_
                        for (index, color) in array.enumerated() {
                            let resolved = color.provider.resolve(in: environment)
                            
                            unsafe pointer
                                .baseAddress
                                .unsafelyUnwrapped
                                .advanced(by: index)
                                .initialize(to: resolved)
                        }
                        
                        unsafe rbShader.setArgumentBytes(
                            pointer.baseAddress.unsafelyUnwrapped,
                            at: UInt(bitPattern: index),
                            type: .unknown5,
                            count: UInt(bitPattern: array.count),
                            flags: [.unknown0, .unknown1]
                        )
                        
                        rbShader.setArgumentColorSpace(.unknown2, at: UInt(bitPattern: index))
                    }
                } else {
                    // <+952>
                    withUnsafeTemporaryAllocation(of: Void.self, capacity: 0) { pointer in
                        unsafe rbShader.setArgumentBytes(
                            pointer.baseAddress.unsafelyUnwrapped,
                            at: UInt(bitPattern: index),
                            type: .unknown5,
                            count: 0,
                            flags: [.unknown0, .unknown1]
                        )
                    }
                }
            case .resolvedColor(let resolved):
                // <+712>
                withUnsafePointer(to: resolved.base) { pointer in
                    unsafe rbShader.setArgumentBytes(
                        pointer,
                        at: UInt(bitPattern: index),
                        type: .unknown5,
                        count: 1,
                        flags: []
                    )
                }
                
                rbShader.setArgumentColorSpace(.unknown2, at: UInt(bitPattern: index))
                
                if let headroom = resolved.headroom {
                    rbShader.setArgumentHeadroom(headroom, at: UInt(bitPattern: index))
                }
            case .image(let image):
                // <+1024>
                if let environment {
                    // <+1696>
                    let context = ImageResolutionContext(
                        environment: environment,
                        textStyle: nil,
                        transaction: OptionalAttribute()
                    )
                    
                    // x19 + 0xa0
                    let resolved = image.provider.resolve(in: context)
                    
                    // x19 + 0x160
                    switch resolved.image.contents {
                    case .cgImage(let cgImage):
                        // <+2280>
                        let rbImage = unsafe RBImage(cgImage: cgImage)
                        
                        withUnsafePointer(to: rbImage) { pointer in
                            unsafe rbShader.setArgumentBytes(
                                pointer,
                                at: UInt(bitPattern: index),
                                type: .unknown7,
                                count: 1,
                                flags: []
                            )
                        }
                    case .ioSurface(let ioSurface):
                        // <+2040>
                        let rbImage = unsafe RBImage(ioSurface: ioSurface)
                        
                        withUnsafePointer(to: rbImage) { pointer in
                            unsafe rbShader.setArgumentBytes(
                                pointer,
                                at: UInt(bitPattern: index),
                                type: .unknown7,
                                count: 1,
                                flags: []
                            )
                        }
                    case .vectorGlyph, .vectorLayer, .named:
                        // <+2116>
                        let d2 = resolved.image.scale
                        var d0: CGFloat = 0
                        var d1: CGFloat = 0
                        
                        if d2 == 0 {
                        } else {
                            do {
                                let size = resolved.image.unrotatedPixelSize
                                d0 = size.width
                                d1 = size.height
                            }
                            
                            let d3: CGFloat
                            switch resolved.image.orientation {
                            case .up, .upMirrored, .down, .downMirrored:
                                d3 = d1
                            case .left, .leftMirrored, .right, .rightMirrored:
                                d3 = d0
                                d0 = d1
                            }
                            
                            d1 = 1.0 / d2
                            d0 = d1 * d0
                            d1 = d1 * d3
                        }
                        
                        let cgImage = resolved
                            .image
                            .render(at: CGSize(width: d0, height: d1), prefersMask: false)
                        
                        if let cgImage {
                            let rbImage = unsafe RBImage(cgImage: cgImage)
                            
                            withUnsafePointer(to: rbImage) { pointer in
                                unsafe rbShader.setArgumentBytes(
                                    pointer,
                                    at: UInt(bitPattern: index),
                                    type: .unknown7,
                                    count: 1,
                                    flags: []
                                )
                            }
                        }
                    case .color(_):
                        // <+2416>
                        break
                    case nil:
                        // <+2232>
                        break
                    }
                } else {
                    // <+1036>
                    unsafe withUnsafePointer(to: RBImage(type: 0, data: nil)) { pointer in
                        unsafe rbShader.setArgumentBytes(
                            pointer,
                            at: UInt(bitPattern: index),
                            type: .unknown7,
                            count: 1,
                            flags: []
                        )
                    }
                }
            case .data(let data):
                // <+540>
                if environment != nil {
                    // <+1076>
                    rbShader.setArgumentData(
                        data,
                        at: UInt(bitPattern: index),
                        type: .unknown0,
                        flags: [.unknown0, .unknown1]
                    )
                } else {
                    withUnsafeTemporaryAllocation(of: Void.self, capacity: 0) { pointer in
                        unsafe rbShader.setArgumentBytes(
                            pointer.baseAddress.unsafelyUnwrapped,
                            at: UInt(bitPattern: index),
                            type: .unknown0,
                            count: 0,
                            flags: [.unknown0, .unknown1]
                        )
                    }
                }
            case .boundsRect:
                // <+976>
                withUnsafeTemporaryAllocation(of: Void.self, capacity: 0) { pointer in
                    unsafe rbShader.setArgumentBytes(
                        pointer.baseAddress.unsafelyUnwrapped,
                        at: UInt(bitPattern: index),
                        type: .unknown6,
                        count: 1,
                        flags: []
                    )
                }
            }
        }
        
        return rbShader
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
                return ShaderVectorData(rbShader: self.rbShader)
            }
            set {
                self.rbShader = newValue.updating(rbShader: self.rbShader)
            }
        }
        
        func draw(path: Path, style: PathDrawingStyle, in context: GraphicsContext, bounds: CGRect?) {
            assertUnimplemented()
        }
        
        nonisolated func effectValue(size: CGSize) -> DisplayList.Effect {
            let filter = GraphicsFilter.ShaderFilter(shader: self, size: size)
            return .filter(.shader(filter))
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
    private var shader: Shader
    private var maxSampleOffset: CGSize
    private var enabled: Bool
    
    init(shader: Shader, maxSampleOffset: CGSize, enabled: Bool) {
        self.shader = shader
        self.maxSampleOffset = maxSampleOffset
        self.enabled = enabled
    }
    
    nonisolated public static func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        /*
         modifier -> x0 -> w23
         inputs -> x1 -> x21
         body -> x2/x3 -> x22/x25
         */
        let effect = Attribute(
            _ShaderFilterEffect.ResolvedEffect(
                modifier: modifier.value,
                env: inputs.environment,
                tracker: PropertyList.Tracker()
            )
        )
        
        var copy_1 = inputs
        
        if !inputs[UsingGraphicsRenderer.self] {
            copy_1[UsingGraphicsRenderer.self] = true
        }
        
        return Shader.ResolvedShader.makeDebuggableView(
            modifier: _GraphValue(effect),
            inputs: copy_1,
            body: body
        )
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
        @Attribute private(set) var modifier: _ShaderFilterEffect
        @Attribute private(set) var env: EnvironmentValues
        let tracker: PropertyList.Tracker
        
        typealias Value = Shader.ResolvedShader
        
        mutating func updateValue() {
            let (modifier, modifierChanged) = self.$modifier.changedValue(options: [])
            
            if modifierChanged {
                // <+216>
            } else {
                let environment = self.env
                
                if self.tracker.hasDifferentUsedValues(environment.plist) {
                    // <+228>
                } else {
                    return
                }
            }
            
            // <+228>
            self.tracker.reset()
            
            let environment = self.env
            self.tracker.initializeValues(from: environment.plist)
            
            if modifier.enabled {
                // <+392>
                self.value = Shader.ResolvedShader(
                    rbShader: modifier.shader.makeRBShader(in: environment),
                    maxSampleOffset: modifier.maxSampleOffset,
                    options: modifier.shader.options
                )
            } else {
                // <+468>
                self.value = Shader.ResolvedShader(
                    rbShader: nil,
                    maxSampleOffset: .zero,
                    options: []
                )
            }
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
