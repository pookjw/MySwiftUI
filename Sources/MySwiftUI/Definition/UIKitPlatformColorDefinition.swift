// 005A2BB2D44F4D559B7E508DC5B95FFB
@_spi(Internal) internal import MySwiftUICore
internal import UIKit
@_spi(Internal) internal import _UIKitShims
internal import MRUIKit

final class UIKitPlatformColorDefinition: PlatformColorDefinition {
    override class var system: PlatformSystemDefinition {
        return .uiKit
    }
    
    override class func resolvedColor(_ color: AnyObject, environment: EnvironmentValues) -> Color.Resolved? {
        /*
         color -> x0 -> x19
         environment -> x1 -> x21
         */
        // x24
        let wrapper = ViewGraphHostEnvironmentWrapper()
        // x23
        let removed = environment.removingTracker()
        // x29 - 0x58
        let inheritedTraitCollection = removed[InheritedTraitCollectionKey.self]
        // x26
        let traitCollection: UITraitCollection
        if let inheritedTraitCollection {
            traitCollection = inheritedTraitCollection
        } else {
            traitCollection = .current
        }
        
        // <+228>
        
        fatalError("TODO")
    }
}

extension UITraitCollection {
    func resolvedEnvironment(base: EnvironmentValues) -> EnvironmentValues {
        // base -> x23
        var resolved = self.resolvedPreEnvironment(base: base)
        resolved = self.coreResolvedBaseEnvironment(base: resolved)
        resolved = self.resolvedPostEnvironment(base: resolved)
        resolved = self.coreResolvedGlassMaterialEnvironment(base: resolved)
        return resolved
    }
    
    fileprivate func resolvedPreEnvironment(base: EnvironmentValues) -> EnvironmentValues {
        /*
         self = x25
         base = x24
         */
        
        var environmentValues = base
        environmentValues.bridgedEnvironmentKeys = []
        environmentValues[InheritedTraitCollectionKey.self] = self._traitCollectionByRemovingEnvironmentWrapper()
        
        if let placementTarget = mrui_placementTarget {
            switch placementTarget.anchoredPlane() {
            case .vertical:
                environmentValues._anchoredPlane = .vertical
                break
            case .horizontal:
                environmentValues._anchoredPlane = .horizontal
                break
            default:
                // <+940>
                break
            }
        }
        
        // <+940>
        if self._platterGroundingShadowVisibility() != .automatic {
            environmentValues.platterGroundingShadowVisibility = Visibility(rawValue: self._platterGroundingShadowVisibility().rawValue)!
        }
        
        // <+992>
        environmentValues.isInOrnament = self.mrui_ornamentStatus
        
        if self.userInterfaceIdiom == .vision {
            let material: MySwiftUICore.Material?
            switch _containerVibrancy() {
            case .lighterGlass:
                material = .lighterGlass
            case .darkerGlass:
                material = .darkerGlass
            case .ultraDarkerGlass:
                material = .ultraDarkerGlass
            default:
                material = nil
            }
            environmentValues.backgroundMaterial = material
            
            if (environmentValues.backgroundMaterial == nil) && environmentValues.isContainedInPlatter {
                environmentValues.backgroundMaterial = .vibrantGlassContent
            }
            
            environmentValues.isVisionEnabled = (self.userInterfaceIdiom == .vision)
        }
        
        environmentValues.accessibilitySettingsDefinition = PlatformSystemDefinition.uiKit
        return environmentValues
    }
    
    fileprivate func resolvedPostEnvironment(base: EnvironmentValues) -> EnvironmentValues {
        var result = base
        
        guard self._vibrancy() == 1 else {
            return result
        }
        
        guard isLinkedOnOrAfter(.v5) else {
            return result
        }
        
        guard result.backgroundMaterial == nil else {
            return result
        }
        
        switch self._containerVibrancy() {
        case .lighterGlass:
            result.backgroundMaterial = .lighterGlass
        case .darkerGlass:
            result.backgroundMaterial = .darkerGlass
        case .ultraDarkerGlass:
            result.backgroundMaterial = .ultraDarkerGlass
        default:
            result.backgroundMaterial = nil
        }
        
        guard result.backgroundMaterial == nil else {
            return result
        }
        
        guard result.isContainedInPlatter else {
            return result
        }
        
        result.backgroundMaterial = .vibrantGlassContent
        return result
    }
    
    @MainActor fileprivate func resolvedPreTraitCollection(environment: EnvironmentValues, wrapper: ViewGraphHostEnvironmentWrapper?, forImageAssetsOnly: Bool) -> UITraitCollection {
        /*
         self -> x20
         environment -> x0 -> x26
         wrapper -> x1 -> x21
         */
        // x19
        let wrapper = wrapper ?? self._environmentWrapper
        // <+168>
        // x21
        var modified = self._modifyingTraits(environmentWrapper: wrapper) { traits in
            // $sSo17UITraitCollectionC7SwiftUIE016resolvedPreTraitB033_005A2BB2D44F4D559B7E508DC5B95FFBLL11environment7wrapper18forImageAssetsOnlyAbC17EnvironmentValuesV_AC013ViewGraphHostX7WrapperCSgSbtFy5UIKit15UIMutableTraits_pzXEfU_TA
            /*
             traits -> x0 -> x19
             environment -> x1 -> x21
             */
            // x29 - 0x58
            let keys = environment[BridgedEnvironmentKeysKey.self]
            
            func copyValueToMutableTraits<T: MySwiftUI.UITraitBridgedEnvironmentKey>(for type: T.Type) {
                fatalError("TODO")
            }
            
            for key in keys {
                _openExistential(key, do: copyValueToMutableTraits)
            }
            
            // <+272>
            if isVisionInterfaceIdiom() {
                // x25
                let envVibrancy = _UIUserInterfaceContainerVibrancy(material: environment.backgroundMaterial)
                let traitVibrancy = traits._containerVibrancy
                
                if envVibrancy != traitVibrancy {
                    traits._containerVibrancy = envVibrancy
                }
            }
            
            // <+472>
            TypesettingConfigurationKey.write(to: &traits, value: environment.typesettingConfiguration)
            traits.activeAppearance = (environment.appearsActive ? .active : .inactive)
        }
        
        // w20
        let isInOrnament = environment.isInOrnament
        if isInOrnament != modified.mrui_ornamentStatus {
            modified = modified.mrui_traitCollection(bySettingOrnamentStatus: isInOrnament)
        }
        
        // <+332>
        // x22
        var array: [UITraitCollection] = [modified]
        
        var alignment: RSSSceneAlignment = .unspecified
        switch environment.anchoredPlane {
        case .horizontal:
            alignment = .horizontal
        case .vertical:
            alignment = .vertical
        case nil:
            break
        }
        
        // x23 -> x25
        let target_1 = RSSPlacementTarget(alignment: alignment)
        // x24
        let target_2 = modified.mrui_placementTarget
        
        if target_1 != target_2 {
            // <+720>
            let collection = UITraitCollection.mrui_traitCollection(with: target_1)
            array.append(collection)
        }
        
        // <+796>
        return UITraitCollection(traitsFrom: array)
    }
}

final class UIKitPlatformViewHost<Representable: CoreViewRepresentable>: UICorePlatformViewHost<Representable> {
    private var importer: MRUIPreferenceImporter? = nil // 0x2d8
    var focusedValues = FocusedValues() // 0x2e0
    private(set) weak var responder: UIViewResponder? = nil // 0x300
    
    required init(_ coreRepresentedViewProvider: Representable.PlatformViewProvider, host: (any ViewGraphRootValueUpdater)?, environment: EnvironmentValues, viewPhase: ViewGraphHost.Phase) {
        /*
         coreRepresentedViewProvider -> x0 -> x29 - 0x98
         host -> x1 -> x29 - 0x60
         environment -> x2 -> x29 - 0x58
         viewPhase -> x3 -> x29 - 0x68
         */
        super.init(coreRepresentedViewProvider, host: host, environment: environment, viewPhase: viewPhase)
    }
    
    override var parentPreferenceHost: (any MRUIPreferenceHostProtocol)? {
        fatalError("TODO")
    }
    
    override var _parentGestureRecognizerContainer: (any _UIGestureRecognizerContainer)? {
        fatalError("TODO")
    }
    
    var isPlatformFocusContainerHost: Bool {
        fatalError("TODO")
    }
    
    var focusView: UIView {
        fatalError("TODO")
    }
    
    override func makeEnvironmentWrapper(_ environment: EnvironmentValues, viewPhase: ViewGraphHost.Phase) -> ViewGraphHostEnvironmentWrapper {
        /*
         self -> x20
         environment -> x0 -> x29 - 0x88
         viewPhase -> x1 -> x29 - 0x80
         */
        // <+148>
        let wrapper = EnvironmentWrapper(focusedValues: self.focusedValues)
        wrapper.environment = environment
        wrapper.phase = viewPhase
        return wrapper
    }
    
    override func resolvedTraitCollection(baseTraitCollection: UITraitCollection, environment: EnvironmentValues, wrapper: ViewGraphHostEnvironmentWrapper) -> UITraitCollection {
        /*
         baseTraitCollection -> x0 -> x20
         environment -> x1 -> x21
         wrapper -> x2 -> x19
         */
        // x20
        let resolved_1 = baseTraitCollection.resolvedPreTraitCollection(environment: environment, wrapper: wrapper, forImageAssetsOnly: false)
        // x22
        let resolved_2 = resolved_1.coreResolvedBaseTraitCollection(environment: environment, wrapper: wrapper, options: [])
        let resolved_3 = resolved_2.coreResolvedGlassMaterialTraitCollection(environment: environment, wrapper: wrapper)
        return resolved_3
    }
}

extension EnvironmentValues {
    var bridgedEnvironmentKeys: [any MySwiftUI.UITraitBridgedEnvironmentKey.Type] {
        get {
            return self[BridgedEnvironmentKeysKey.self]
        }
        set {
            self[BridgedEnvironmentKeysKey.self] = newValue
        }
    }
}

fileprivate struct BridgedEnvironmentKeysKey: EnvironmentKey {
    @safe static nonisolated(unsafe) let defaultValue: [any MySwiftUI.UITraitBridgedEnvironmentKey.Type] = []
}
