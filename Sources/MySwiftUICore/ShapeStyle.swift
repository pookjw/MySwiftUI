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
    fileprivate private(set) var frame: CGRect // 0x70
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
        let s8 = self.opacity
        self.opacity = s8 * copy_1.opacity
        
        // <+224>
        switch copy_1.fill {
        case .color(var resolved):
            // <+696>
            if style.effects.isEmpty {
                resolved.opacity = self.opacity * resolved.opacity
                self.opacity = 1
            }
            
            self.render(color: resolved)
            // <+1708>
        case .paint(let paint):
            // <+344>
            self.render(paint: paint)
            // <+1708>
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
            // <+300>
            self.render(material: resolved)
            // <+1708>
        case .duotoneColor(let resolved):
            // <+820>
            self.render(color: .white)
            let colorMatrix = resolved.colorMatrix
            let filter = GraphicsFilter.vibrantColorMatrix(
                GraphicsFilter.VibrantColorMatrix(
                    matrix: colorMatrix,
                    maxColorComponent: .infinity,
                    options: []
                )
            )
            
            if case .vibrantColorMatrix(_) = filter {
                if self.layerNeeds.contains(.unknown0) {
                    self.item.addDrawingGroup(contentSeed: self.contentSeed)
                    self.layerNeeds.subtract(.unknown0)
                }
                
                self.layerNeeds.formUnion(.unknown1)
            }
            
            self.item.addEffect(.filter(filter))
            self.item.canonicalize(options: self.options)
            // <+1708>
        case .vibrantMatrix(let matrix):
            // <+380>
            self.render(color: .white)
            let filter = GraphicsFilter.vibrantColorMatrix(matrix)
            
            if case .vibrantColorMatrix(_) = filter {
                if self.layerNeeds.contains(.unknown0) {
                    self.item.addDrawingGroup(contentSeed: self.contentSeed)
                    self.layerNeeds.subtract(.unknown0)
                }
                
                self.layerNeeds.formUnion(.unknown1)
            }
            
            self.item.addEffect(.filter(filter))
            self.item.canonicalize(options: self.options)
            // <+1708>
        case .multicolor(_):
            // <+1708>
            break
        }
        
        // <+1708>
        if !copy_1.effects.isEmpty {
            // <+1720>
            // sp + 0x330
            var below = CompositedItemAccumulator(
                version: self.item.version,
                contentSeed: self.contentSeed,
                options: self.options,
                items: [],
                pendingItems: [],
                currentBlend: .normal,
                hasBlending: false,
                drawingGroup: false
            )
            
            // sp + 0x300
            var above = below
            
            // sp + 0x2ff
            var mayAdjustItem = (self.blendMode == GraphicsBlendMode.normal)
            
            for effect in copy_1.effects {
                // <+2128>
                // effect -> sp + 0x270
                guard case .shadow(let shadowStyle) = effect.kind else {
                    continue
                }
                
                // <+2196>
                // sp + 0x30
                var copy_2 = copy_1
                
                if shadowStyle.kind.contains(.ignoresFill) {
                    copy_2.opacity = s8 * effect.opacity
                } else {
                    copy_2.opacity = self.opacity
                }
                
                // <+2264>
                copy_2._blend = effect._blend

                let opaqueFill: Bool
                if (self.opacity != 1) {
                    // <+2572>
                    opaqueFill = false
                } else if (copy_1.opacity != 1) {
                    // <+2572>
                    opaqueFill = false
                } else {
                    let flag: Bool
                    
                    if let blend = copy_1._blend {
                        if blend == .normal {
                            flag = true
                        } else {
                            flag = false
                        }
                    } else {
                        // <+2660>
                        if GraphicsBlendMode.normal == GraphicsBlendMode.normal {
                            flag = true
                        } else {
                            flag = false
                        }
                    }
                    
                    if flag {
                        // <+2848>
                        switch copy_1.fill {
                        case .color(let resolvedHDR):
                            // <+2884>
                            opaqueFill = (resolvedHDR.opacity == 1)
                        case .paint(let paint):
                            // <+2900>
                            opaqueFill = paint.isOpaque
                        case .foregroundMaterial(_, _):
                            // <+2584>
                            opaqueFill = false
                        case .backgroundMaterial(_):
                            // <+2584>
                            opaqueFill = false
                        case .duotoneColor(_):
                            // <+2584>
                            opaqueFill = false
                        case .vibrantMatrix(_):
                            // <+2584>
                            opaqueFill = false
                        case .multicolor(_):
                            // <+2588>
                            opaqueFill = true
                        }
                    } else {
                        // <+2584>
                        opaqueFill = false
                    }
                }
                
                self.render(
                    shadow: shadowStyle,
                    style: copy_2,
                    above: &above,
                    below: &below,
                    opaqueFill: opaqueFill,
                    mayAdjustItem: &mayAdjustItem
                )
            }
            
            // <+2940>
            if !below.items.isEmpty || !below.pendingItems.isEmpty || !above.items.isEmpty || !above.pendingItems.isEmpty {
                // <+2996>
                let w26: Bool
                let flag_1: Bool
                switch self.blendMode {
                case .blendMode(let blendMode):
                    w26 = (blendMode.rawValue != 0)
                    flag_1 = (blendMode.rawValue == 0)
                case .caFilter(_):
                    w26 = true
                    flag_1 = false
                }
                
                func push(layers: inout [DisplayList.Item], above: Bool) {
                    /*
                     layers -> x0
                     above -> w1
                     self -> x2
                     */
                    guard !layers.isEmpty else {
                        return
                    }
                    
                    let list = DisplayList(layers)
                    
                    // sp + 0x10
                    var item = DisplayList.Item(
                        .effect(.identity, list),
                        frame: self.frame,
                        identity: .none,
                        version: self.item.version
                    )
                    
                    item.canonicalize(options: self.options)
                    self.item.composite(item, above: above)
                }
                
                if !flag_1 {
                    // <+3020>
                    self.item.addEffect(.blendMode(self.blendMode))
                    self.item.canonicalize(options: self.options)
                    self.blendMode = .normal
                    // <+3144>
                } else {
                    // <+3164>
                }
                
                let flag_2: Bool
                if self.opacity == 1 {
                    if flag_1 {
                        // <+3240>
                        flag_2 = true
                    } else {
                        // <+3260>
                        flag_2 = false
                    }
                } else {
                    // <+3184>
                    self.item.addEffect(.opacity(self.opacity))
                    self.item.canonicalize(options: self.options)
                    self.opacity = 1
                    
                    if w26 {
                        // <+3260>
                        flag_2 = false
                    } else {
                        // <+3240>
                        flag_2 = true
                    }
                }
                
                if flag_2 {
                    var w8 = below.hasBlending
                    let w20 = self.layerNeeds
                    
                    if w20.contains(.unknown1) {
                        w8 = w8 || true
                    }
                    
                    w8 = w8 || above.hasBlending
                    
                    if w8 {
                        // <+3260>
                    } else {
                        // <+3404>
                        push(layers: &below.pendingItems, above: false)
                        push(layers: &above.pendingItems, above: true)
                        
                        // <+3444>
                        if below.drawingGroup || above.drawingGroup {
                            // <+3460>
                            self.layerNeeds = w20.union(.unknown0)
                        }
                        
                        return
                    }
                }
                
                // <+3260>
                if self.layerNeeds.contains(.unknown0) {
                    self.item.addDrawingGroup(contentSeed: self.contentSeed)
                    self.layerNeeds.subtract(.unknown0)
                }
                
                // <+3288>
                below.commitPendingItems()
                above.commitPendingItems()
                
                push(layers: &below.items, above: false)
                push(layers: &above.items, above: true)
            }
        }
    }
    
    fileprivate mutating func render(color: Color.ResolvedHDR) {
        // self -> x20 -> x19
        if color.opacity == 0 {
            // <+1440>
        } else {
            // <+64>
            // sp + 0x250
            let copy_1 = self.shape
            
            switch copy_1 {
            case .path(let path, let fillStyle):
                // <+676>
                let environment = self.environment
                
                var dynamicRange = Image.DynamicRange.standard
                if
                    let headroom = color.headroom,
                    !(headroom <= 1)
                {
                    dynamicRange = environment.effectiveAllowedDynamicRange(explicitRange: nil)
                }
                
                // <+784>
                switch path.storage {
                case .rect(let rect):
                    // <+1332>
                    let colorView = ColorView(
                        color,
                        isAntialiased: fillStyle.isAntialiased,
                        allowedDynamicRange: dynamicRange
                    )
                    
                    self.item.frame = CGRect(
                        origin: self.item.frame.origin + rect.origin,
                        size: rect.size
                    )
                    
                    self.item.value = .content(
                        DisplayList.Content(
                            .color(colorView),
                            seed: self.contentSeed
                        )
                    )
                    
                    // <+1440>
                default:
                    // <+788>
                    let colorView = ColorView(
                        color,
                        isAntialiased: true,
                        allowedDynamicRange: dynamicRange
                    )
                    
                    let paint = _AnyResolvedPaint(colorView)
                    
                    self.item.value = .content(
                        DisplayList.Content(
                            .shape(path, paint, fillStyle),
                            seed: self.contentSeed
                        )
                    )
                    
                    // <+1440>
                }
                
                // <+1440>
            case .pathSet(let pathSet):
                // <+168>
                let shape = SDFShape(
                    origin: .zero,
                    path: pathSet,
                    style: .fill(SDFStyle.Fill(inset: 0, color: color)),
                    ovalization: 0,
                    options: [],
                    backdropObserver: nil
                )
                
                self.item.value = .content(
                    DisplayList.Content(
                        .sdfShape(shape),
                        seed: self.contentSeed
                    )
                )
                
                // <+1440>
            case .text(_):
                // <+1252>
                let colorView = ColorView(
                    .clear,
                    isAntialiased: true,
                    allowedDynamicRange: .standard
                )
                
                self.item.value = .content(
                    DisplayList.Content(
                        .color(colorView),
                        seed: self.contentSeed
                    )
                )
            case .image(var graphicsImage):
                // <+932>
                graphicsImage.maskColor = color
                
                self.item.value = .content(
                    DisplayList.Content(
                        .image(graphicsImage),
                        seed: self.contentSeed)
                )
            case .alphaMask(let item, let alphaOnly):
                // <+308>
                self.item.frame = item.frame.offsetBy(
                    dx: self.item.frame.origin.x,
                    dy: self.item.frame.origin.y
                )
                
                self.item.value = item.value
                
                let graphicsFilter: GraphicsFilter
                if alphaOnly {
                    // <+628>
                    if color == .white {
                        break
                    } else {
                        // <+1568>
                        graphicsFilter = .colorMultiply(color)
                    }
                } else {
                    // <+1300>
                    graphicsFilter = .alphaMultiply(color)
                }
                
                // <+1592>
                self.item.addEffect(.filter(graphicsFilter))
                self.item.canonicalize(options: self.options)
            case .empty:
                // <+1440>
                break
            }
        }
        
        // <+1440>
        guard let interpolatorData else {
            return
        }
        
        let effect = DisplayList.Effect.interpolatorLayer(interpolatorData.group, serial: interpolatorData.serial)
        self.item.addEffect(effect)
        self.item.canonicalize(options: self.options)
        self.interpolatorData = nil
    }
    
    fileprivate func render(paint: AnyResolvedPaint) {
        assertUnimplemented()
    }
    
    fileprivate func render(material: Material.ResolvedMaterial) {
        assertUnimplemented()
    }
    
    fileprivate func render(shadow: ResolvedShadowStyle, style: _ShapeStyle_Pack.Style, above: inout CompositedItemAccumulator, below: inout CompositedItemAccumulator, opaqueFill: Bool, mayAdjustItem: inout Bool) {
        assertUnimplemented()
    }
    
    func commitItem() -> DisplayList.Item {
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
    
    mutating func beginLayer(id: _ShapeStyle_LayerID, style: _ShapeStyle_Pack.Style?, shape: inout _ShapeStyle_RenderedShape) {
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
    
    mutating func endLayer(shape: inout _ShapeStyle_RenderedShape) {
        /*
         self -> x20 -> x19
         shape -> x0 -> x21
         */
        // x29 - 0xe0
        var newItem = shape.commitItem()
        
        switch self.layers {
        case .item(let item):
            // <+264>
            // item -> x29 - 0x90
            // d8, d9
            let origin = CGPoint(
                x: item.frame.origin.x - shape.frame.origin.x,
                y: item.frame.origin.y - shape.frame.origin.y
            )
            
            newItem.frame.origin = CGPoint(
                x: newItem.frame.origin.x - shape.frame.origin.x,
                y: newItem.frame.origin.y - shape.frame.origin.y
            )
            
            newItem.identity = .none
            
            var copy = item
            copy.frame.origin = origin
            copy.identity = .none
            
            let items: [DisplayList.Item] = [copy, newItem]
            self.layers = .items(items)
        case .items(var items):
            // <+108>
            newItem.frame.origin = CGPoint(
                x: newItem.frame.origin.x - shape.frame.origin.x,
                y: newItem.frame.origin.y - shape.frame.origin.y
            )
            
            newItem.identity = .none
            
            items.append(newItem)
            self.layers = .items(items)
        case .empty:
            // <+536>
            self.layers = .item(newItem)
        }
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

fileprivate struct CompositedItemAccumulator {
    private(set) var version: DisplayList.Version // 0x0
    private(set) var contentSeed: DisplayList.Seed // 0x8
    private(set) var options: DisplayList.Options // 0xa
    var items: [DisplayList.Item] // 0x10
    var pendingItems: [DisplayList.Item] // 0x18
    private(set) var currentBlend: GraphicsBlendMode // 0x20
    private(set) var hasBlending: Bool // 0x29
    private(set) var drawingGroup: Bool // 0x2a
    
    func commitPendingItems() {
        assertUnimplemented()
    }
    
    func add(item: DisplayList.Item, blend: GraphicsBlendMode, needsDrawingGroup: Bool) {
        assertUnimplemented()
    }
}
