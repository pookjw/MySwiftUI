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
}

struct _ShapeStyle_RenderedShape {
    private var shape: _ShapeStyle_RenderedShape.Shape // 0x0
    private var contentSeed: DisplayList.Seed // 0x6c
    private var frame: CGRect // 0x70
    private var interpolatorData: (group: DisplayList.InterpolatorGroup, serial: UInt32)? = nil // 0x90
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
    
    func renderItem(name: _ShapeStyle_Name, styles: @autoclosure () -> _ShapeStyle_Pack, layers: inout _ShapeStyle_RenderedLayers) {
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
        let rawValue: UInt8
    }
}

struct _ShapeStyle_RenderedLayers {
    private(set) var group: _ShapeStyle_InterpolatorGroup?
    private var layers: _ShapeStyle_RenderedLayers.Layers = .empty
    
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
