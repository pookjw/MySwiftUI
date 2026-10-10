// 4075E3A4E56336DD739D990E781CBB12
package import Foundation

public struct Material : Sendable {
    package var id: Material.ID
    var flags: Material.ResolvedMaterial.Flags
    
    init(_ id: Material.ID) {
        self.id = id
        self.flags = []
    }
}

extension Material {
    public static let regular: Material = { assertUnimplemented() }()
    public static let thick: Material = { assertUnimplemented() }()
    public static let thin: Material = { assertUnimplemented() }()
    public static let ultraThin: Material = { assertUnimplemented() }()
    public static let ultraThick: Material = { assertUnimplemented() }()
    public static let bar: Material = { assertUnimplemented() }()
}

extension Material {
    package init<T : MaterialProvider>(provider: T) {
        assertUnimplemented()
    }
    
    package func provider<T : MaterialProvider>(ofType type: T.Type) -> T? {
        if case .provider(let provider) = self.id {
            return provider.as(T.self)
        } else {
            return nil
        }
    }
}

extension Material {
    enum Substrate {
        case caLayer
        case graphicsContext
        case archive
    }
    
    struct ResolvedMaterial {
        private(set) var id: Material.ID
        private(set) var flags: Material.ResolvedMaterial.Flags
        var styieID: ContentStyle.ID?
        
        func prefersRenderingBackgroundWithStyle(in environment: EnvironmentValues) -> Bool {
            assertUnimplemented()
        }
    }
}

extension Material.ResolvedMaterial {
    struct Flags : OptionSet {
        let rawValue: UInt32
        
        init(rawValue: UInt32) {
            self.rawValue = rawValue
        }
        
        init(environment: EnvironmentValues) {
            assertUnimplemented()
        }
    }
}

extension Material : ShapeStyle {
    public typealias Resolved = Never
    
    @available(*, deprecated, message: "obsolete")
    nonisolated public static func _makeView<S>(view: _GraphValue<_ShapeView<S, Material>>, inputs: _ViewInputs) -> _ViewOutputs where S : Shape {
        assertUnimplemented()
    }
    
    public func _apply(to shape: inout _ShapeStyle_Shape) {
        assertUnimplemented()
    }
    
    public static func _apply(to type: inout _ShapeStyle_ShapeType) {
        assertUnimplemented()
    }
}

extension Material {
    //    public func materialActiveAppearance(_ appearance: MaterialActiveAppearance) -> Material
}

extension Material {
    package enum ID : @unchecked Sendable {
        case coreMaterial(light: String, dark: String, bundle: Bundle?)
        case provider(MaterialProviderBoxBase)
        case layers(Material.Layers)
        case ultraThin
        case thin
        case regular
        case thick
        case ultraThick
        case systemBars
        case intelligenceLightSource_Unreactive
        case intelligenceLightSource_AudioReactive
        case pinched
        case selected
        case disabled
        case vibrantGlassContent // 0xb, 0x3
        case darkerGlass
        case lighterGlass
        case ultraDarkerGlass
    }
}

extension Material {
    package struct Layers {
        private var layers: [Material.Layer]
    }
    
    package struct Layer {
        private var storage: Material.Layer.Storage
        private var _opacity: Float
        private var _blendMode: GraphicsBlendMode
    }
    
    package struct Context {
        private var environment: EnvironmentValues
        private var role: ShapeRole? = nil
        var substrate: Material.Substrate? = nil
        private var shapeDimensions: ClosedRange<CGFloat>? = nil
        private var shapeMetrics: Material.ShapeMetrics? = nil
        
        init(environment: EnvironmentValues) {
            self.environment = environment
        }
    }
    
    package struct ForegroundStyle {
        private var storage: Material.ForegroundStyle.Storage
    }
    
    struct ShapeMetrics {
        private var minimumDistance: CGFloat
        private var minimumDistanceOfLargestArea: CGFloat
        private var maximumDistance: CGFloat
    }
    
    struct StatefulContext {
        // TODO
    }
}

extension Material.ForegroundStyle {
    fileprivate enum Storage {
        case color(Color.Resolved)
        case colorBlend(Color.Resolved, GraphicsContext.BlendMode)
        case colorMatrix(GraphicsFilter.VibrantColorMatrix)
    }
}

extension Material.Layer {
    enum Storage {
        case color(Color.ResolvedHDR)
        case backdropSwiftUI(BackdropEffect)
        case sdfLayer(Material.Layer.SDFLayer)
        case intelligenceLightSource(IntelligenceLightSourceLayer)
    }
    
    package struct SDFLayer {
        // TODO
    }
}

package protocol MaterialProvider {
    func resolveLayers(in context: Material.Context) -> [Material.Layer]
    func resolveForegroundStyle(level: Int, in context: Material.Context) -> Material.ForegroundStyle?
    func resolveAdaptiveColor(_ color: Color.ResolvedHDR, in context: Material.Context) -> Material.ForegroundStyle
    func foregroundEnvironment(_ environment: inout EnvironmentValues, for: Material)
    func resolveBackgroundStyle(level: Int, in context: Material.Context) -> Material.ForegroundStyle?
}

extension EnvironmentValues {
    var systemMaterialDefinition: (any SystemMaterialDefinition.Type)? {
        get {
            return self[SystemMaterialDefinitionKey.self]?.type
        }
        set {
            if let newValue {
                self[SystemMaterialDefinitionKey.self] = SystemMaterialDefinitionKey.Wrapper(type: newValue)
            } else {
                self[SystemMaterialDefinitionKey.self] = nil
            }
        }
    }
    
    func materialProvider(for material: Material) -> MaterialProviderBoxBase? {
        assertUnimplemented()
    }
}

protocol SystemMaterialDefinition : AnyObject {
    static func provider(for: Material) -> MaterialProvider?
}

fileprivate struct SystemMaterialDefinitionKey : EnvironmentKey {
    static var defaultValue: SystemMaterialDefinitionKey.Wrapper? {
        return nil
    }
}

extension SystemMaterialDefinitionKey {
    struct Wrapper : Equatable {
        static func == (lhs: SystemMaterialDefinitionKey.Wrapper, rhs: SystemMaterialDefinitionKey.Wrapper) -> Bool {
            return lhs.type == rhs.type
        }
        
        private(set) var type: any SystemMaterialDefinition.Type
    }
}

package class MaterialProviderBoxBase {
    func resolveLayers(in context: Material.Context) -> Material.Layers {
        fatalError() // abstract
    }
    
    func applyForegroundStyle(to shape: inout _ShapeStyle_Shape) {
        fatalError() // abstract
    }
    
    func applyBackgroundStyle(to shape: inout _ShapeStyle_Shape) -> Bool {
        fatalError() // abstract
    }
    
    func apply(color: Color, to shape: inout _ShapeStyle_Shape) {
        fatalError() // abstract
    }
    
    func foregroundEnvironment(_ environment: inout EnvironmentValues, for material: Material) {
        fatalError() // abstract
    }
    
    var hasState: Bool {
        return false
    }
    
    func updateState(_ state: AnyEquatable?, in context: inout Material.StatefulContext) -> AnyEquatable? {
        fatalError() // abstract
    }
    
    func applyingState(_ state: AnyEquatable?) -> Material {
        fatalError() // abstract
    }
    
    var animatableData: _AnyAnimatableData? {
        return nil
    }
    
    func setAnimatableData(_ newValue: _AnyAnimatableData) -> MaterialProviderBoxBase {
        return self
    }
    
    func `as`<T>(_ type: T.Type) -> T? {
        fatalError() // abstract
    }
    
    func isEqual(to other: MaterialProviderBoxBase) -> Bool {
        fatalError() // abstract
    }
    
    func hash(into hasher: inout Hasher) {
        fatalError() // abstract
    }
    
    var hashValue: Int {
        var hasher = Hasher()
        self.hash(into: &hasher)
        return hasher.finalize()
    }
    
    init() {
    }
}

fileprivate final class MaterialProviderBox<U : MaterialProvider> : MaterialProviderBoxBase {
    let provider: U
    
    init(_ provider: U) {
        self.provider = provider
    }
    
    override func resolveLayers(in context: Material.Context) -> Material.Layers {
        assertUnimplemented()
    }
    
    override func applyForegroundStyle(to shape: inout _ShapeStyle_Shape) {
        assertUnimplemented()
    }
    
    override func applyBackgroundStyle(to shape: inout _ShapeStyle_Shape) -> Bool {
        assertUnimplemented()
    }
    
    override func apply(color: Color, to shape: inout _ShapeStyle_Shape) {
        assertUnimplemented()
    }
    
    override func foregroundEnvironment(_ environment: inout EnvironmentValues, for material: Material) {
        assertUnimplemented()
    }
    
    override func isEqual(to other: MaterialProviderBoxBase) -> Bool {
        assertUnimplemented()
    }
    
    override func `as`<T>(_ type: T.Type) -> T? {
        assertUnimplemented()
    }
    
    override func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
}

extension ShapeStyle where Self == Material {
    @_alwaysEmitIntoClient public static var regularMaterial: Material {
        return .regular
    }
    
    @_alwaysEmitIntoClient public static var thickMaterial: Material {
        return .thick
    }
    
    @_alwaysEmitIntoClient public static var thinMaterial: Material {
        return .thin
    }
    
    @_alwaysEmitIntoClient public static var ultraThinMaterial: Material {
        return .ultraThin
    }
    
    @_alwaysEmitIntoClient public static var ultraThickMaterial: Material {
        return .ultraThick
    }
    
    @_alwaysEmitIntoClient public static var bar: Material {
        return .bar
    }
}

extension Material {
    package static var experimentalGlassMaterial: Material {
        fatalError()
    }
    
    package static var vibrantGlassContent: Material {
        return Material(.vibrantGlassContent)
    }
    
    package static var darkerGlass: Material {
        fatalError()
    }
    
    package static var lighterGlass: Material {
        fatalError()
    }
    
    package static var ultraDarkerGlass: Material {
        fatalError()
    }
    
    package static var modal: Material {
        fatalError()
    }
    
    package static var toolbarButton: Material {
        fatalError()
    }
    
    package static func _intelligenceLightSource(prefersAudioReactivity: Bool) -> Material {
        fatalError()
    }
}

extension _ViewInputs {
    var materialSubstrate: Material.Substrate? {
        if self[UsingGraphicsRenderer.self] {
            return .graphicsContext
        }
        
        let inputValue = self[ArchivedViewInput.self]
        
        if inputValue.isArchived {
            return .archive
        } else {
            return .caLayer
        }
    }
}

struct UsingGraphicsRenderer : ViewInput {
    static var defaultValue: Bool {
        return false
    }
}

struct ForegroundMaterialStyle : ShapeStyle, PrimitiveShapeStyle {
    var material: Material
    
    init(material: Material) {
        self.material = material
    }
    
    func _apply(to shape: inout _ShapeStyle_Shape) {
        /*
         self -> x20
         shape -> x0 -> x19
         */
        if case .provider(let provider) = self.material.id {
            // <+188>
            provider.applyForegroundStyle(to: &shape)
        } else {
            // <+64>
            if
                let definition = shape.environment.systemMaterialDefinition,
                let materialProvider = definition.provider(for: self.material)
            {
                func project<T : MaterialProvider>(provider: T) -> MaterialProviderBoxBase {
                    return MaterialProviderBox<T>(provider)
                }
                
                let provider = _openExistential(materialProvider, do: project(provider:))
                provider.applyForegroundStyle(to: &shape)
            } else {
                // <+252>
                switch shape.operation {
                case .prepareText(_):
                    // <+308>
                    shape.result = .preparedText(.foregroundKeyColor)
                case .resolveStyle(let name, let levels):
                    // <+276>
                    guard !levels.isEmpty else {
                        return
                    }
                    
                    let style = shape.resolveStyle(level: levels.lowerBound, material: self.material)
                    
                    var pack: _ShapeStyle_Pack
                    if case .pack(let _pack) = shape.result {
                        pack = _pack
                        shape.result = .none
                    } else {
                        pack = _ShapeStyle_Pack()
                    }
                    
                    pack[name, levels.lowerBound] = style
                    shape.result = .pack(pack)
                case .fallbackColor(_):
                    // <+332>
                    SystemColorsStyle()._apply(to: &shape)
                case .copyStyle(_):
                    break
                case .modifyBackground(_):
                    break
                case .multiLevel:
                    break
                case .primaryStyle:
                    break
                }
            }
        }
    }
    
    static func _apply(to type: inout _ShapeStyle_ShapeType) {
        // noop
    }
}
