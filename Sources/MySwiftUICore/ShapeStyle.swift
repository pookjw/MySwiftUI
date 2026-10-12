// 3890C65F12EA82A4BC5FBD33046B67FA
internal import CoreGraphics
internal import AttributeGraph

public protocol ShapeStyle : Sendable {
    @available(*, deprecated, message: "obsolete")
    static func _makeView<S>(view: _GraphValue<_ShapeView<S, Self>>, inputs: _ViewInputs) -> _ViewOutputs where S : Shape
    
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    func _apply(to shape: inout _ShapeStyle_Shape)
    
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    static func _apply(to type: inout _ShapeStyle_ShapeType)
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    @_weakLinked associatedtype Resolved : ShapeStyle = Never
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    func resolve(in environment: EnvironmentValues) -> Self.Resolved
}

extension ShapeStyle {
    nonisolated public static func _makeView<S>(view: _GraphValue<_ShapeView<S, Self>>, inputs: _ViewInputs) -> _ViewOutputs where S : Shape {
        assertUnimplemented()
    }
    
    public func _apply(to shape: inout _ShapeStyle_Shape) {
        guard Self.Resolved.self != Never.self else {
            return
        }
        
        let resolved = self.resolve(in: shape.environment)
        resolved._apply(to: &shape)
    }
    
    public static func _apply(to type: inout _ShapeStyle_ShapeType) {
        assertUnimplemented()
    }
    
    func primaryStyle(in environment: EnvironmentValues) -> AnyShapeStyle? {
        assertUnimplemented()
    }
}

extension ShapeStyle where Self.Resolved == Never {
    public func resolve(in environment: EnvironmentValues) -> Never {
        assertUnimplemented()
    }
    
    public static func _apply(to type: inout _ShapeStyle_ShapeType) {
        assertUnimplemented()
    }
}

extension Never : ShapeStyle {
    public typealias Resolved = Never
    
    nonisolated public static func _makeView<S>(view: _GraphValue<_ShapeView<S, Never>>, inputs: _ViewInputs) -> _ViewOutputs where S : Shape {
        assertUnimplemented()
    }
}

public struct _ShapeStyle_Shape {
    var operation: _ShapeStyle_Shape.Operation // 0x0
    var result: _ShapeStyle_Shape.Result // 0x20
    private(set) var environment: EnvironmentValues // 0x30
    private(set) var foregroundStyle: AnyShapeStyle? // 0x40
    private(set) var bounds: CGRect? // 0x48
    var role: ShapeRole // 0x69
    private(set) var substrate: Material.Substrate? // 0x6a
    var activeRecursiveStyles: _ShapeStyle_Shape.RecursiveStyles // 0x6b
    
    init(
        operation: _ShapeStyle_Shape.Operation,
        result: _ShapeStyle_Shape.Result = .none,
        environment: EnvironmentValues = EnvironmentValues(),
        foregroundStyle: AnyShapeStyle?,
        bounds: CGRect?,
        role: ShapeRole = .fill,
        substrate: Material.Substrate?
    ) {
        self.operation = operation
        self.result = result
        self.environment = environment
        self.foregroundStyle = foregroundStyle
        self.bounds = bounds
        self.role = role
        self.substrate = substrate
        self.activeRecursiveStyles = []
    }
}

extension _ShapeStyle_Shape {
    enum Operation {
        case prepareText(level: Int)
        case resolveStyle(name: _ShapeStyle_Name, levels: Range<Int>)
        case fallbackColor(level: Int)
        case copyStyle(name: _ShapeStyle_Name)
        case modifyBackground(level: Int)
        case multiLevel // 0, 0, 0, 5
        case primaryStyle // 1, 0, 0, 5
    }
    
    enum Result {
        case preparedText(_ShapeStyle_Shape.PreparedTextResult)
        case pack(_ShapeStyle_Pack)
        case style(AnyShapeStyle)
        case color(Color)
        case bool(Bool)
        case none
    }
    
    enum PreparedTextResult {
        case foregroundColor(Color)
        case foregroundKeyColor
    }
    
    struct RecursiveStyles : OptionSet {
        static var content: _ShapeStyle_Shape.RecursiveStyles {
            return _ShapeStyle_Shape.RecursiveStyles(rawValue: 1 << 0)
        }
        
        static var foreground: _ShapeStyle_Shape.RecursiveStyles {
            return _ShapeStyle_Shape.RecursiveStyles(rawValue: 1 << 1)
        }
        
        static var background: _ShapeStyle_Shape.RecursiveStyles {
            return _ShapeStyle_Shape.RecursiveStyles(rawValue: 1 << 2)
        }
        
        static var materialProvider: _ShapeStyle_Shape.RecursiveStyles {
            return _ShapeStyle_Shape.RecursiveStyles(rawValue: 1 << 3)
        }
        
        let rawValue: UInt8
    }
}

public struct _ShapeStyle_ShapeType {
    // TODO
}

@available(*, unavailable)
extension _ShapeStyle_ShapeType : Sendable {}

protocol PrimitiveShapeStyle : ShapeStyle {
}

final class _ShapeStyle_InterpolatorGroup : DisplayList.InterpolatorGroup {
    private var layers: [_ShapeStyle_InterpolatorGroup.Layer]
    private var contentsScale: Float
    private var rasterizationOptions: RasterizationOptions
    private var serial: UInt32
    private var cursor: Int32
    
    fileprivate func addLayer(id: _ShapeStyle_LayerID, style: _ShapeStyle_Pack.Style?) -> _ShapeStyle_InterpolatorGroup.AddLayerResult {
        assertUnimplemented()
    }
    
    override func reset() {
        assertUnimplemented()
    }
    
    override func nextUpdate(after time: Time) -> Time {
        assertUnimplemented()
    }
    
    override var features: DisplayList.Features {
        assertUnimplemented()
    }
    
    override var properties: DisplayList.Properties {
        assertUnimplemented()
    }
    
    override func update(contentSeed: DisplayList.Seed, transition: ContentTransition, animation: Animation?, listener: AnimationListener?, contentsScale: Float, rasterizationOptions: RasterizationOptions, supportsVFD: Bool) {
        assertUnimplemented()
    }
    
    override func rewriteInterpolation(serial: UInt32, list: inout DisplayList, time: Attribute<Time>, frame: CGRect, contentOrigin: CGPoint, contentOffset: CGSize, version: DisplayList.Version) -> Bool {
        assertUnimplemented()
    }
    
    override init() {
        assertUnimplemented()
    }
}

extension _ShapeStyle_InterpolatorGroup {
    fileprivate struct Layer {
        // TODO
    }
    
    // nominal type descriptor가 없음
    fileprivate enum AddLayerResult {
        case unknown0((group: DisplayList.InterpolatorGroup, serial: UInt32)?)
        case unknown1(style: _ShapeStyle_Pack.Style?, interpolatorData: (group: DisplayList.InterpolatorGroup, serial: UInt32)?)
    }
}

struct _ShapeStyle_RenderedShape {
    var shape: _ShapeStyle_RenderedShape.Shape // 0x0
    private var contentSeed: DisplayList.Seed // 0x6c
    private var frame: CGRect // 0x70
    var interpolatorData: (group: DisplayList.InterpolatorGroup, serial: UInt32)? = nil // 0x90
    private var item: DisplayList.Item // 0xa0
    private var options: DisplayList.Options // 0xec
    @Attribute private var environment: EnvironmentValues // 0xf0
    private var blendMode: GraphicsBlendMode = .normal // 0xf8
    private var opacity: Float = 1 // 0x104
    private var layerNeeds: _ShapeStyle_RenderedShape.LayerNeeds = [] // 0x108
    
    init(
        _ shape: _ShapeStyle_RenderedShape.Shape,
        frame: CGRect,
        identity: _DisplayList_Identity,
        version: DisplayList.Version,
        contentSeed: DisplayList.Seed,
        options: DisplayList.Options,
        environment: Attribute<EnvironmentValues>
    ) {
        self.shape = shape
        self.contentSeed = contentSeed
        self.frame = frame
        self.item = DisplayList.Item(
            .empty,
            frame: frame,
            identity: identity,
            version: version
        )
        self.options = options
        self._environment = environment
    }
    
    mutating func renderItem(
        name: _ShapeStyle_Name,
        styles: @autoclosure () -> _ShapeStyle_Pack,
        layers: inout _ShapeStyle_RenderedLayers
    ) {
        /*
         self -> x20 -> x19
         name -> x0 -> w24
         styles -> x1/x2
         layers -> x3 -> x21
         */
        switch self.shape {
        case .path(_, _):
            // <+576>
            break
        case .pathSet(_):
            // <+576>
            break
        case .text(let contentView):
            // <+324>
            if contentView.needsStyledRendering {
                let style = styles()[name, 0]
                self.renderKeyedText(contentView, style: style, name: name, layers: &layers)
            } else {
                self.renderUnstyledText(contentView, layers: &layers)
            }
            
            return
        case .image(let image):
            // <+216>
            if image.maskColor != nil {
                // <+484>
                if let contents = image.contents {
                    if case .vectorGlyph(let glyph) = contents {
                        // <+864>
                        self.renderVectorGlyph(
                            glyph,
                            size: image.uprotatedPixelSize,
                            orientation: image.orientation,
                            name: name,
                            styles: styles(),
                            layers: &layers
                        )
                        
                        return
                    }
                } else {
                    // <+504>
                }
                
                // <+576>
            } else {
                // <+228>
                self.renderUnstyledImage(image, layers: &layers)
                return
            }
        case .alphaMask(_, _):
            // <+576>
            break
        case .empty:
            // <+144>
            return
        }
        
        // <+576>
        let style = styles()[name, 0]
        
        layers.beginLayer(
            id: .styled(name, 0),
            style: style,
            shape: &self
        )
        
        self.render(style: style)
        layers.endLayer(shape: &self)
    }
    
    fileprivate func renderUnstyledText(
        _: StyledTextContentView,
        layers: inout _ShapeStyle_RenderedLayers
    ) {
        assertUnimplemented()
    }
    
    fileprivate func renderKeyedText(
        _: StyledTextContentView,
        style: _ShapeStyle_Pack.Style,
        name: _ShapeStyle_Name,
        layers: inout _ShapeStyle_RenderedLayers
    ) {
        assertUnimplemented()
    }
    
    fileprivate func renderUnstyledImage(
        _: GraphicsImage,
        layers: inout _ShapeStyle_RenderedLayers
    ) {
        assertUnimplemented()
    }
    
    fileprivate func renderVectorGlyph(
        _: ResolvedVectorGlyph,
        size: CGSize,
        orientation: Image.Orientation,
        name: _ShapeStyle_Name,
        styles: _ShapeStyle_Pack,
        layers: inout _ShapeStyle_RenderedLayers
    ) {
        assertUnimplemented()
    }
    
    fileprivate mutating func render(style: _ShapeStyle_Pack.Style) {
        /*
         self -> x20 -> x19
         style -> x0 -> x23
         */
        // sp + 0x3b0
        let copy_1 = style
        // sp + 0x20 / sp + 0x1c
        let blend = copy_1._blend ?? .normal
        // <+176>
        self.blendMode = blend
        // <+208>
        self.opacity = self.opacity * copy_1.opacity
        
        // <+224>
        switch copy_1.fill {
        case .color(let resolved):
            // <+696>
            assertUnimplemented()
        case .paint(let paint):
            // <+344>
            assertUnimplemented()
        case .foregroundMaterial(let resolvedColor, let materialResolved):
            // <+760>
            // inlined
            // x28
            let effects = materialResolved.effects
            
            // <+1232>
            if !effects.isEmpty {
                var hasFilter = false
                
                for effect in effects {
                    if
                        case .filter(let matrix) = effect,
                        case .vibrantColorMatrix(_) = matrix
                    {
                        hasFilter = true
                        break
                    }
                }
                
                if hasFilter {
                    self.render(color: .white)
                } else {
                    self.render(color: resolvedColor)
                }
                
                // <+1456>
                for effect in effects {
                    switch effect {
                    case .opacity(let opacity):
                        // <+1564>
                        self.opacity = self.opacity * opacity
                    case .blendMode(let blendMode):
                        self.blendMode = blendMode
                    case .filter(let graphicsFilter):
                        // <+1584>
                        if case .vibrantColorMatrix(_) = graphicsFilter {
                            if self.layerNeeds.contains(.unknown0) {
                                self.item.addDrawingGroup(contentSeed: self.contentSeed)
                                self.layerNeeds.subtract(.unknown0)
                            }
                            
                            self.layerNeeds.formUnion(.unknown1)
                        }
                        
                        self.item.addEffect(effect)
                        self.item.canonicalize(options: self.options)
                    case .identity:
                        break
                    default:
                        // <+1376>
                        self.item.addEffect(effect)
                        self.item.canonicalize(options: self.options)
                    }
                }
                
                // <+1692>
            } else {
                // <+1656>
                self.render(color: resolvedColor)
            }
            
            // <+1692>
            // <+1708>
        case .backgroundMaterial(let resolved):
            // <+820>
            assertUnimplemented()
        case .duotoneColor(let resolved):
            // <+300>
            assertUnimplemented()
        case .vibrantMatrix(let matrix):
            // <+380>
            assertUnimplemented()
        case .multicolor(_):
            // <+1708>
            break
        }
        
        // <+1708>
        assertUnimplemented()
    }
    
    fileprivate func render(color: Color.ResolvedHDR) {
        assertUnimplemented()
    }
}

extension _ShapeStyle_RenderedShape {
    enum Shape {
        case path(Path, FillStyle)
        case pathSet(PathSet)
        case text(StyledTextContentView)
        case image(GraphicsImage)
        case alphaMask(DisplayList.Item, alphaOnly: Bool)
        case empty
    }
    
    fileprivate struct LayerNeeds : OptionSet {
        static var unknown0: _ShapeStyle_RenderedShape.LayerNeeds {
            return _ShapeStyle_RenderedShape.LayerNeeds(rawValue: 1 << 0)
        }
        
        static var unknown1: _ShapeStyle_RenderedShape.LayerNeeds {
            return _ShapeStyle_RenderedShape.LayerNeeds(rawValue: 1 << 1)
        }
        
        let rawValue: UInt8
    }
}

struct _ShapeStyle_RenderedLayers {
    private(set) var group: _ShapeStyle_InterpolatorGroup?
    private var layers: _ShapeStyle_RenderedLayers.Layers = .empty
    
    func beginLayer(id: _ShapeStyle_LayerID, style: _ShapeStyle_Pack.Style?, shape: inout _ShapeStyle_RenderedShape) {
        guard let group else {
            return
        }
        
        while true {
            // sp + 0x168
            let result = group.addLayer(id: id, style: style)
            
            switch result {
            case .unknown0(let interpolatorData):
                shape.interpolatorData = interpolatorData
                return
            case .unknown1(let _style, let interpolatorData):
                // <+356>
                let oldShape = shape.shape
                
                shape.shape = .empty
                shape.interpolatorData = interpolatorData
                
                if let _style {
                    shape.render(style: _style)
                }
                
                // <+204>
                self.endLayer(shape: &shape)
                shape.shape = oldShape
            }
        }
    }
    
    func endLayer(shape: inout _ShapeStyle_RenderedShape) {
        assertUnimplemented()
    }
    
    func commit(shape: inout _ShapeStyle_RenderedShape, options: DisplayList.Options) -> DisplayList {
        assertUnimplemented()
    }
}

extension _ShapeStyle_RenderedLayers {
    fileprivate enum Layers {
        case item(DisplayList.Item)
        case items([DisplayList.Item])
        case empty
    }
    
    fileprivate struct LayerNeeds {
        let rawValue: UInt8
    }
}

enum _ShapeStyle_LayerID {
    case styled(_ShapeStyle_Name, UInt16)
    case customStyle(UInt32)
    case named(String?)
    case unstyled
}
