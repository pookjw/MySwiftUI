// 4075E3A4E56336DD739D990E781CBB12
package import Foundation
#if SwiftUICompatibility
public import SwiftUI
internal import _SwiftUICorePrivate
#endif

public struct Material : Sendable {
    package var id: MySwiftUICore::Material.ID
    private var flags: MySwiftUICore::Material.ResolvedMaterial.Flags
    
    init(_ id: MySwiftUICore::Material.ID) {
        self.id = id
        self.flags = []
    }
}

extension MySwiftUICore::Material {
    public static let regular: MySwiftUICore::Material = { assertUnimplemented() }()
    public static let thick: MySwiftUICore::Material = { assertUnimplemented() }()
    public static let thin: MySwiftUICore::Material = { assertUnimplemented() }()
    public static let ultraThin: MySwiftUICore::Material = { assertUnimplemented() }()
    public static let ultraThick: MySwiftUICore::Material = { assertUnimplemented() }()
    public static let bar: MySwiftUICore::Material = { assertUnimplemented() }()
}

extension MySwiftUICore::Material {
    package init<T : MySwiftUICore::MaterialProvider>(provider: T) {
        assertUnimplemented()
    }
    
    package func provider<T : MySwiftUICore::MaterialProvider>(ofType type: T.Type) -> T? {
        assertUnimplemented()
    }
}

extension MySwiftUICore::Material {
    enum Substrate {
        case caLayer
        case graphicsContext
        case archive
    }
    
    struct ResolvedMaterial {
        private var id: MySwiftUICore::Material.ID
        private var flags: MySwiftUICore::Material.ResolvedMaterial.Flags
        private var styieID: ContentStyle.ID?
    }
}

extension MySwiftUICore::Material.ResolvedMaterial {
    struct Flags : OptionSet {
        let rawValue: UInt32
    }
}

extension MySwiftUICore::Material : ShapeStyle {
    public typealias Resolved = Never
    
    @available(*, deprecated, message: "obsolete")
    nonisolated public static func _makeView<S>(view: _GraphValue<_ShapeView<S, MySwiftUICore::Material>>, inputs: _ViewInputs) -> _ViewOutputs where S : Shape {
        assertUnimplemented()
    }
    
    public func _apply(to shape: inout _ShapeStyle_Shape) {
        assertUnimplemented()
    }
    
    public static func _apply(to type: inout _ShapeStyle_ShapeType) {
        assertUnimplemented()
    }
}

extension MySwiftUICore::Material {
    //    public func materialActiveAppearance(_ appearance: MaterialActiveAppearance) -> Material
}

extension MySwiftUICore::Material {
    package enum ID : @unchecked Sendable {
        case coreMaterial(light: String, dark: String, bundle: Bundle?)
        case provider(MySwiftUICore::MaterialProviderBoxBase)
        case layers(MySwiftUICore::Material.Layers)
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

extension MySwiftUICore::Material {
    package struct Layers {
        private var layers: [Layer]
    }
    
    package struct Layer {
        private var storage: MySwiftUICore::Material.Layer.Storage
        private var _opacity: Float
        private var _blendMode: GraphicsBlendMode
    }
    
    package struct Context {
        private var environment: EnvironmentValues
        private var role: ShapeRole?
        private var substrate: MySwiftUICore::Material.Substrate?
        private var shapeDimensions: ClosedRange<CGFloat>?
        private var shapeMetrics:MySwiftUICore:: Material.ShapeMetrics?
    }
    
    package struct ForegroundStyle {
        private var storage: MySwiftUICore::Material.ForegroundStyle.Storage
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

extension MySwiftUICore::Material.ForegroundStyle {
    fileprivate enum Storage {
        case color(Color.Resolved)
        case colorBlend(Color.Resolved, GraphicsContext.BlendMode)
        case colorMatrix(GraphicsFilter.VibrantColorMatrix)
    }
}

extension MySwiftUICore::Material.Layer {
    enum Storage {
        case color(Color.ResolvedHDR)
        case backdropSwiftUI(BackdropEffect)
        case sdfLayer(MySwiftUICore::Material.Layer.SDFLayer)
        case intelligenceLightSource(IntelligenceLightSourceLayer)
    }
    
    package struct SDFLayer {
        // TODO
    }
}

package protocol MaterialProvider {
    func resolveLayers(in context: MySwiftUICore::Material.Context) -> [MySwiftUICore::Material.Layer]
    func resolveForegroundStyle(level: Int, in context: MySwiftUICore::Material.Context) -> MySwiftUICore::Material.ForegroundStyle?
    func resolveAdaptiveColor(_ color: Color.ResolvedHDR, in context: MySwiftUICore::Material.Context) -> MySwiftUICore::Material.ForegroundStyle
    func foregroundEnvironment(_ environment: inout EnvironmentValues, for: MySwiftUICore::Material)
    func resolveBackgroundStyle(level: Int, in context: MySwiftUICore::Material.Context) -> MySwiftUICore::Material.ForegroundStyle?
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
}

protocol SystemMaterialDefinition : AnyObject {
#if SwiftUICompatibility
    static func provider(for: SwiftUI::Material) -> MaterialProvider?
#else
    static func provider(for: MySwiftUICore::Material) -> MaterialProvider?
#endif
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
    func resolveLayers(in context: MySwiftUICore::Material.Context) -> MySwiftUICore::Material.Layers {
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
    
    func foregroundEnvironment(_ environment: inout EnvironmentValues, for material: MySwiftUICore::Material) {
        fatalError() // abstract
    }
    
    var hasState: Bool {
        return false
    }
    
    func updateState(_ state: AnyEquatable?, in context: inout MySwiftUICore::Material.StatefulContext) -> AnyEquatable? {
        fatalError() // abstract
    }
    
    func applyingState(_ state: AnyEquatable?) -> MySwiftUICore::Material {
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
    
    func isEqual(to other: MySwiftUICore::MaterialProviderBoxBase) -> Bool {
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

fileprivate final class MaterialProviderBox<U : MySwiftUICore::MaterialProvider> : MySwiftUICore::MaterialProviderBoxBase {
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

extension ShapeStyle where Self == MySwiftUICore::Material {
    @_alwaysEmitIntoClient public static var regularMaterial: MySwiftUICore::Material {
        return .regular
    }
    
    @_alwaysEmitIntoClient public static var thickMaterial: MySwiftUICore::Material {
        return .thick
    }
    
    @_alwaysEmitIntoClient public static var thinMaterial: MySwiftUICore::Material {
        return .thin
    }
    
    @_alwaysEmitIntoClient public static var ultraThinMaterial: MySwiftUICore::Material {
        return .ultraThin
    }
    
    @_alwaysEmitIntoClient public static var ultraThickMaterial: MySwiftUICore::Material {
        return .ultraThick
    }
    
    @_alwaysEmitIntoClient public static var bar: MySwiftUICore::Material {
        return .bar
    }
}

extension MySwiftUICore::Material {
    package static var experimentalGlassMaterial: MySwiftUICore::Material {
        fatalError()
    }
    
    package static var vibrantGlassContent: MySwiftUICore::Material {
        return Material(.vibrantGlassContent)
    }
    
    package static var darkerGlass: MySwiftUICore::Material {
        fatalError()
    }
    
    package static var lighterGlass: MySwiftUICore::Material {
        fatalError()
    }
    
    package static var ultraDarkerGlass: MySwiftUICore::Material {
        fatalError()
    }
    
    package static var modal: MySwiftUICore::Material {
        fatalError()
    }
    
    package static var toolbarButton: MySwiftUICore::Material {
        fatalError()
    }
    
    package static func _intelligenceLightSource(prefersAudioReactivity: Bool) -> MySwiftUICore::Material {
        fatalError()
    }
}

extension _ViewInputs {
    var materialSubstrate: MySwiftUICore::Material.Substrate? {
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

#if SwiftUICompatibility
extension _SwiftUICorePrivate::MaterialProviderBoxBase {
    func msui_applyForegroundStyle(to shape: inout MySwiftUICore::_ShapeStyle_Shape) {
        assertUnimplemented() // TODO: MySwiftUICore::_ShapeStyle_Shape -> SwiftUICore::_ShapeStyle_Shape
    }
}
#endif

struct ForegroundMaterialStyle : ShapeStyle, PrimitiveShapeStyle {
#if SwiftUICompatibility
    var material: SwiftUI::Material
    
    init(material: SwiftUI::Material) {
        self.material = material
    }
#else
    var material: MySwiftUICore::Material
    
    init(material: MySwiftUICore::Material) {
        self.material = material
    }
#endif
    
    func _apply(to shape: inout _ShapeStyle_Shape) {
        /*
         self -> x20
         shape -> x0 -> x19
         */
        if case .provider(let provider) = self.material.id {
            // <+188>
#if SwiftUICompatibility
            provider.msui_applyForegroundStyle(to: &shape)
#else
            provider.applyForegroundStyle(to: &shape)
#endif
        } else {
            // <+64>
            if
                let definition = shape.environment.systemMaterialDefinition,
                let materialProvider = definition.provider(for: self.material)
            {
                func project<T : MySwiftUICore::MaterialProvider>(provider: T) -> MaterialProviderBoxBase {
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
