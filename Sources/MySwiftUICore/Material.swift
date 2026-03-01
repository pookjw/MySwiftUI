// 4075E3A4E56336DD739D990E781CBB12
package import Foundation
#if SwiftUICompataibility
public import SwiftUI
#endif

public struct Material: Sendable {
    package var id: Material.ID
    private var flags: Material.ResolvedMaterial.Flags
    
    init(_ id: Material.ID) {
        self.id = id
        self.flags = []
    }
}

extension Material {
    public static let regular: Material = { fatalError("TODO") }()
    public static let thick: Material = { fatalError("TODO") }()
    public static let thin: Material = { fatalError("TODO") }()
    public static let ultraThin: Material = { fatalError("TODO") }()
    public static let ultraThick: Material = { fatalError("TODO") }()
    public static let bar: Material = { fatalError("TODO") }()
}

extension Material {
    package init<T: MaterialProvider>(provider: T) {
        fatalError("TODO")
    }
    
    package func provider<T: MaterialProvider>(ofType type: T.Type) -> T? {
        fatalError("TODO")
    }
}

extension Material {
    enum Substrate {
        case caLayer
        case graphicsContext
        case archive
    }
    
    struct ResolvedMaterial {
        private var id: Material.ID
        private var flags: Material.ResolvedMaterial.Flags
        private var styieID: ContentStyle.ID?
    }
}

extension Material.ResolvedMaterial {
    struct Flags: OptionSet {
        let rawValue: UInt32
    }
}

extension Material: ShapeStyle {
    public typealias Resolved = Never
}

extension Material {
    //    public func materialActiveAppearance(_ appearance: MaterialActiveAppearance) -> Material
}

extension Material {
    package enum ID: @unchecked Sendable {
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
        private var layers: [Layer]
    }
    
    package struct Layer {
        private var storage: Material.Layer.Storage
        private var _opacity: Float
        private var _blendMode: GraphicsBlendMode
    }
    
    package struct Context {
        private var environment: EnvironmentValues
        private var role: ShapeRole?
        private var substrate: Material.Substrate?
        private var shapeDimensions: ClosedRange<CGFloat>?
        private var shapeMetrics: Material.ShapeMetrics?
    }
    
    package struct ForegroundStyle {
        private var storage: Material.ForegroundStyle.Storage
    }
    
    struct ShapeMetrics {
        private var minimumDistance: CGFloat
        private var minimumDistanceOfLargestArea: CGFloat
        private var maximumDistance: CGFloat
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
    
    struct SDFLayer {
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

#if SwiftUICompataibility
extension EnvironmentValues {
    public var backgroundMaterial: SwiftUI.Material? {
        get {
            return self[BackgroundMaterialKey.self]
        }
        set {
            self[BackgroundMaterialKey.self] = newValue
        }
    }
}

fileprivate struct BackgroundMaterialKey: EnvironmentKey {
    static var defaultValue: SwiftUI.Material? {
        return nil
    }
}

#else
extension EnvironmentValues {
    public var backgroundMaterial: Material? {
        get {
            return self[BackgroundMaterialKey.self]
        }
        set {
            self[BackgroundMaterialKey.self] = newValue
        }
    }
}

fileprivate struct BackgroundMaterialKey: EnvironmentKey {
    static var defaultValue: Material? {
        return nil
    }
}

#endif

package class MaterialProviderBoxBase {
    
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
