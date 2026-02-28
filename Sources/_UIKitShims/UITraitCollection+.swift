package import UIKit
private import _UIKitPrivate
@_spi(Internal) package import MySwiftUICore
private import _DyldPrivate
private import DesignLibrary
private import _DesignLibraryShims
private import _CoreFoundationPrivate

extension UITraitCollection {
    func environmentValues() -> MySwiftUICore.EnvironmentValues {
        if let environmentWrapper = _environmentWrapper as? MySwiftUICore.ViewGraphHostEnvironmentWrapper {
            return environmentWrapper.environment
        }
        
        var enviromentValues = MySwiftUICore.EnvironmentValues()
        enviromentValues.locale = .current
        enviromentValues.calendar = .current
        enviromentValues.timezone = .current
        return enviromentValues
    }
    
    package func coreResolvedBaseEnvironment(base: MySwiftUICore.EnvironmentValues) -> MySwiftUICore.EnvironmentValues {
        /*
         base = x26
         self = x24
         */
        var result = base
        
        switch self.layoutDirection {
        case .leftToRight:
            result.layoutDirection = .leftToRight
        case .rightToLeft:
            result.layoutDirection = .rightToLeft
        default:
            break
        }
        
        if let dynamicTypeSize = DynamicTypeSize(_uiSizeCategory: self.preferredContentSizeCategory) {
            result.dynamicTypeSize = dynamicTypeSize
        }
        
        // <+1716>
        switch self.legibilityWeight {
        case .regular:
            result.legibilityWeight = .regular
        case .bold:
            result.legibilityWeight = .bold
        default:
            break
        }
        
        if let displayGamut = DisplayGamut(rawValue: self.displayGamut.rawValue) {
            result.displayGamut = displayGamut
        }
        
        switch self.accessibilityContrast {
        case .normal:
            result._colorSchemeContrast = .standard
        case .high:
            result._colorSchemeContrast = .increased
        default:
            break
        }
        
        result.systemColorScheme = ColorScheme(_uiUserInterfaceStyle: self.userInterfaceStyle) ?? .light
        
        // <+2340>
        var displayScale = self.displayScale
        if displayScale == 0 {
            displayScale = 1
        }
        result.displayScale = displayScale
        
        switch self.horizontalSizeClass {
        case .compact:
            result.horizontalSizeClass = .compact
        case .regular:
            result.horizontalSizeClass = .regular
        default:
            result.horizontalSizeClass = nil
        }
        
        switch self.verticalSizeClass {
        case .compact:
            result.verticalSizeClass = .compact
        case .regular:
            result.verticalSizeClass = .regular
        default:
            result.verticalSizeClass = nil
        }
        
        result.backgroundLevel = self.userInterfaceLevel.rawValue
        
        let displayCornerRadius = self.displayCornerRadius()
        if displayCornerRadius == _UITraitCollectionDisplayCornerRadiusUnspecified {
            result.displayCornerRadius = 0
        } else {
            result.displayCornerRadius = displayCornerRadius
        }
        
        if displayCornerRadius != 0 {
            result.pointsPerMeter = self._pointsPerMeter()
        }
        
        if self.userInterfaceIdiom == .vision {
            result.isContainedInPlatter = (self._platterStatus() == 1)
        }
        
        if self._userInterfaceRenderingMode() == 2 {
            result.isVibrantColorStyleEnabled = true
        }
        
        if #available(iOS 18.0, visionOS 2.0, *) {
            result.isVibrantColorStyleEnabled = true
        }
        
        result.windowAppearsActive = (self.activeAppearance == .active)
        
        // <+2960>
#if SwiftUICompataibility
        result.materialBackdropProxy = materialBackdropProxy(materialBackdropContext: self.materialBackdropContext!)
#else
#error("TODO")
#endif
        
        // <+3052>
        result.accessibilitySettingsDefinition = .uiKit
        
        switch UIColorMaterialRenderingMode(rawValue: self._value(forNSIntegerTraitToken: ColorMaterialRenderingModeToken()!)) {
        case .automatic:
            result.materialColorRenderingMode = .automatic
        case .adaptiveSystemColors:
            result.materialColorRenderingMode = .adaptiveSystemColors
        case .adaptiveAllColors:
            result.materialColorRenderingMode = .adaptiveAllColors
        default:
            result.materialColorRenderingMode = .automatic
        }
        
        return result
    }
    
    package func coreResolvedGlassMaterialEnvironment(base: EnvironmentValues) -> EnvironmentValues {
        /*
         self -> x20 -> x21
         base -> x0 -> x20
         */
        // <+140>
        // x19
        var copy_1 = base
        copy_1.glassMaterialForeground = (self._glassElevationLevel != .unknown0)
        // x23
        let glassBackgroundStyle = self._object(forTraitToken: GlassBackgroundStyleToken()!)
        copy_1.updateGlassBackgroundStyle(style: castToGlassBackgroundStyle(glassBackgroundStyle), collection: self)
        
        // <+224>
        let glassFrostValue = self._value(forNSIntegerTraitToken: GlassFrostToken()!)
        let glassFrost: _Glass.Frost = if glassFrostValue == 2 {
            .none
        } else if glassFrostValue == 1 {
            .reduced
        } else {
            .automatic
        }
        copy_1.glassFrost = glassFrost
        
        let glassMaterialPocketContainer = self._object(forTraitToken: GlassPocketContainerToken()!) as? GlassMaterialProvider.Pocket
        copy_1.glassMaterialPocketContainer = glassMaterialPocketContainer
        
        return copy_1
    }
    
    private var materialBackdropContext: AnyObject? {
#if SwiftUICompataibility
        return self._object(forTraitToken: MaterialBackdropContextTraitToken()!) as? AnyObject
#else
#error("TODO")
#endif
    }
    
    var resolvedProvider: AnyObject? {
#if SwiftUICompataibility
        return self._object(forTraitToken: ResolvedProviderTraitToken()!) as? AnyObject
#else
#error("TODO")
#endif
    }
    
    package func coreResolvedBaseTraitCollection(environment: EnvironmentValues, wrapper: ViewGraphHostEnvironmentWrapper?, options: UICoreTraitCollectionResolutionOptions) -> UITraitCollection {
        /*
         self -> x20
         environment -> x0 -> x22
         wrapper -> x1 -> x19
         options -> x2 -> x21
         */
        let wrapper = wrapper ?? self._environmentWrapper
        
        // <+68>
        return self._modifyingTraits(environmentWrapper: wrapper) { traits in
            /*
             traits -> x0 -> x19
             environment -> x1 -> x21
             options -> x2 -> x29 - 0x108
             self -> x3 -x29 - 0xc0
             */
            // <+856>
            var newDirection = UITraitEnvironmentLayoutDirection.leftToRight
            switch environment.layoutDirection {
            case .leftToRight:
                break
            case .rightToLeft:
                newDirection = .rightToLeft
            default:
                newDirection = .unspecified
            }
            if newDirection != traits.layoutDirection {
                traits.layoutDirection = newDirection
            }
            
            // <+1060>
            // d8
            let newDisplayScale = environment.displayScale
            if newDisplayScale != traits.displayScale {
                traits.displayScale = newDisplayScale
            }
            
            // <+1160>
            // x26
            let newContentSizeCategory = UIContentSizeCategory(_dynamicTypeSize: environment.dynamicTypeSize)
            // x24
            let oldContentSizeCategory = traits.preferredContentSizeCategory
            if newContentSizeCategory != oldContentSizeCategory {
                traits.preferredContentSizeCategory = newContentSizeCategory
            }
            
            // <+1428>
            let newUserInterfaceStyle = UIUserInterfaceStyle(_colorScheme: environment.colorScheme)
            let oldUserInterfaceStyle = traits.userInterfaceStyle
            if newUserInterfaceStyle != oldUserInterfaceStyle {
                traits.userInterfaceStyle = newUserInterfaceStyle
            }
            
            // <+1572>
            // x23
            let newDisplayGamut = environment.displayGamut.rawValue
            let oldDisplayGamut = traits.displayGamut.rawValue
            if newDisplayGamut != oldDisplayGamut {
                traits.displayGamut = UIDisplayGamut(rawValue: newDisplayGamut)!
            }
            
            // <+1724>
            let isRSCompatible = _CFRSCompatible()
            // 이 결과에 따라 SDK 분기 처리가 바뀜
            fatalError("TODO")
        }
    }
    
    package func coreResolvedGlassMaterialTraitCollection(environment: EnvironmentValues, wrapper: ViewGraphHostEnvironmentWrapper?) -> UITraitCollection {
        fatalError("TODO")
    }
}

extension EnvironmentValues {
    fileprivate func updateGlassBackgroundStyle(style: _GlassBackgroundStyle, collection: UITraitCollection) {
        /*
         self -> x20 -> x29 - 0x58
         level -> x0 -> x20
         collection -> x1 -> x21
         */
        // <+288>
        // x25
        let copy_1 = style
        
        // <+456>
        switch copy_1 {
        case .glass(_):
            // <+336>
            fatalError("TODO")
            // <+456>
        case .unspecified, .solidColor:
            break
        }
        
        // <+456>
        guard let resolvedProvider = collection._object(forTraitToken: ResolvedProviderTraitToken()!) else {
            return
        }
        
        // <+564>
        fatalError("TODO")
    }
}
