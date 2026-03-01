package import UIKit
private import _UIKitPrivate
@_spi(Internal) package import MySwiftUICore
private import DesignLibrary
private import _DesignLibraryShims
#if SwiftUICompataibility
private import _SwiftUICorePrivate
private import SwiftUI
#endif

extension UIMutableTraitsInternal {
    var resolvedProvider: Any? {
        get {
#if SwiftUICompataibility
            return self._object(forTraitToken: ResolvedProviderTraitToken()!) 
#else
#error("TODO")
#endif
        }
        set {
#if SwiftUICompataibility
            self._setObject(newValue, forTraitToken: ResolvedProviderTraitToken()!)
#else
#error("TODO")
#endif
        }
    }
    
    fileprivate var glassPocketContainer: GlassMaterialProvider.Pocket? {
        get {
#if SwiftUICompataibility
            return self._object(forTraitToken: GlassPocketContainerToken()!) as? GlassMaterialProvider.Pocket
#else
#error("TODO")
#endif
        }
        set {
#if SwiftUICompataibility
            self._setObject(newValue, forTraitToken: GlassPocketContainerToken()!)
#else
#error("TODO")
#endif
        }
    }
    
    fileprivate var glassBackgroundStyle: _GlassBackgroundStyle {
        let object = self._object(forTraitToken: GlassBackgroundStyleToken()!)
        return castToGlassBackgroundStyle(object)
    }
    
    fileprivate var glassFrost: _Glass.Frost {
        get {
            let glassFrostValue = self._value(forNSIntegerTraitToken: GlassFrostToken()!)
            if glassFrostValue == 2 {
                return .none
            } else if glassFrostValue == 1 {
                return .reduced
            } else {
                return .automatic
            }
        }
        set {
            let glassFrostValue: Int
            switch newValue {
            case .reduced:
                glassFrostValue = 1
            case .none:
                glassFrostValue = 2
            default:
                glassFrostValue = 0
            }
            
            self._setNSIntegerValue(glassFrostValue, forTraitToken: GlassFrostToken()!)
        }
    }
    
    fileprivate var materialBackdropContext: AnyObject? {
        get {
#if SwiftUICompataibility
            return self._object(forTraitToken: MaterialBackdropContextTraitToken()!) as? AnyObject
#else
#error("TODO")
#endif
        }
        set {
#if SwiftUICompataibility
            self._setObject(newValue, forTraitToken: MaterialBackdropContextTraitToken()!)
#else
#error("TODO")
#endif
        }
    }
}

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
        result.materialBackdropProxy = modifyMaterialBackdropContext(self.materialBackdropContext!) { $1 }
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
    
    package func coreResolvedGlassMaterialEnvironment(base: MySwiftUICore.EnvironmentValues) -> MySwiftUICore.EnvironmentValues {
        /*
         self -> x20 -> x21
         base -> x0 -> x20
         */
        // <+140>
        // x19
        var copy_1 = base
        copy_1.glassMaterialForeground = (self._glassElevationLevel != .unknown0)
        copy_1.updateGlassBackgroundStyle(style: self.glassBackgroundStyle, collection: self)
        
        // <+224>
        copy_1.glassFrost = self.glassFrost
        copy_1.glassMaterialPocketContainer = self.glassPocketContainer
        
        return copy_1
    }
    
    package func coreResolvedBaseTraitCollection(environment: MySwiftUICore.EnvironmentValues, wrapper: MySwiftUICore.ViewGraphHostEnvironmentWrapper?, options: UICoreTraitCollectionResolutionOptions) -> UITraitCollection {
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
            if #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *) {
                // <+1760>
                // x23
                let newBackgroundMaterial = environment.backgroundMaterial
                let isContainedInPlatter = environment.isContainedInPlatter
                
                if isContainedInPlatter || (newBackgroundMaterial != nil) {
                    // <+1856>
                    if (traits._vibrancy == .unknown1) || (traits._vibrancy != .unknown0) {
                        traits._vibrancy = .unknown1
                    }
                }
            }
            
            // <+1980>
            let newAccessibilityContrast = UIAccessibilityContrast(_colorSchemeContrast: environment._colorSchemeContrast)
            let oldAccessibilityContrast = traits.accessibilityContrast
            if newAccessibilityContrast != oldAccessibilityContrast {
                traits.accessibilityContrast = newAccessibilityContrast
            }
            
            // <+2132>
            let newHorizontalSizeClass = UIUserInterfaceSizeClass(_sizeClass: environment.horizontalSizeClass)
            let oldHorizontalSizeClass = traits.horizontalSizeClass
            if newHorizontalSizeClass != oldHorizontalSizeClass {
                traits.horizontalSizeClass = newHorizontalSizeClass
            }
            
            // <+2240>
            let newVerticalSizeClass = UIUserInterfaceSizeClass(_sizeClass: environment.verticalSizeClass)
            let oldVerticalSizeClass = traits.verticalSizeClass
            if newVerticalSizeClass != oldVerticalSizeClass {
                traits.verticalSizeClass = newVerticalSizeClass
            }
            
            // <+2348>
            if !options.contains(.forImageAssetsOnly) {
                let newUserInterfaceLevel = UIUserInterfaceLevel(rawValue: environment.backgroundLevel)!
                let oldUserInterfaceLevel = traits.userInterfaceLevel
                if newUserInterfaceLevel != oldUserInterfaceLevel {
                    traits.userInterfaceLevel = newUserInterfaceLevel
                }
            }
            
            // <+2456>
            let newPointsPerMeter = environment.pointsPerMeter
            let oldPointsPerMeter = traits._pointsPerMeter
            if newPointsPerMeter != oldPointsPerMeter {
                traits._pointsPerMeter = newPointsPerMeter
            }
            
            // <+2552>
            let newPlatterGroundingShadowVisibility = _UIPlatterGroundingShadowVisibility(rawValue: environment.platterGroundingShadowVisibility.rawValue)!
            let oldPlatterGroundingShadowVisibility = traits.platterGroundingShadowVisibility
            if newPlatterGroundingShadowVisibility != oldPlatterGroundingShadowVisibility {
                traits.platterGroundingShadowVisibility = newPlatterGroundingShadowVisibility
            }
            
            // <+2652>
            if self.userInterfaceIdiom == .vision {
                // <+2668>
                let isContainedInPlatter = environment.isContainedInPlatter
                let newPlatterStatus: _UIPlatterStatus = isContainedInPlatter ? .unknown1 : .unspecified
                let oldPlatterStatus = traits._platterStatus
                if newPlatterStatus != oldPlatterStatus {
                    traits._platterStatus = newPlatterStatus
                }
            }
            
            // <+2772>
#if SwiftUICompataibility
            // x29 - 0xb8 -> x29 - 0xf0
            let newProxy = environment.materialBackdropProxy
            let oldContext = getTraitsInternal(traits).materialBackdropContext!
            // x29 - 0xd0 -> x29 - 0xe8
            let oldProxy = modifyMaterialBackdropContext(oldContext) { $1 }
            
            // <+2904>
            if newProxy == nil {
                // <+2996>
                if oldProxy == nil {
                    // <+3356>
                } else {
                    // <+3164>
                    let newContext = makeMaterialBackdropContext(flags: 0, proxy: newProxy)
                    getTraitsInternal(traits).materialBackdropContext = newContext
                    // <+3356>
                }
            } else {
                // <+3072>
                if oldProxy == nil {
                    // <+3124>
                    // <+3164>
                    let newContext = makeMaterialBackdropContext(flags: 0, proxy: newProxy)
                    getTraitsInternal(traits).materialBackdropContext = newContext
                    // <+3356>
                } else {
                    // <+3712>
                    if newProxy != oldProxy {
                        // <+3188>
                        let newContext = makeMaterialBackdropContext(flags: 0, proxy: newProxy)
                        getTraitsInternal(traits).materialBackdropContext = newContext
                        // <+3356>
                    } else {
                        // <+3356>
                    }
                }
            }
#else
#error("TODO")
#endif
            
            // <+3356>
            let newColorRenderingMode = UIColorMaterialRenderingMode(_materialColorRenderingMode: environment.materialColorRenderingMode)
            let oldColorRenderingMode = UIColorMaterialRenderingMode(rawValue: getTraitsInternal(traits)._value(forNSIntegerTraitToken: ColorMaterialRenderingModeToken()!))!
            
            if newColorRenderingMode == oldColorRenderingMode {
                // <+3568>
                // <+3676>
            } else {
                // <+3604>
                getTraitsInternal(traits)._setNSIntegerValue(newColorRenderingMode.rawValue, forTraitToken: ColorMaterialRenderingModeToken()!)
                // <+3676>
            }
            
            // <+3676>
        }
    }
    
    package func coreResolvedGlassMaterialTraitCollection(environment: MySwiftUICore.EnvironmentValues, wrapper: MySwiftUICore.ViewGraphHostEnvironmentWrapper?) -> UITraitCollection {
        /*
         self -> x20
         environment -> x0 -> sp + 0x10
         wrapper -> x1 -> x22
         */
        return self._modifyingTraits(environmentWrapper: wrapper) { traits in
            // <+316>
            let glassMaterialForeground = environment.glassMaterialForeground
            traits._glassElevationLevel = glassMaterialForeground ? .unknown1 : .unknown0
            
            if let glassMaterialContainerStyle = environment.glassMaterialContainerStyle {
                // <+568>
                traits._userInterfaceRenderingMode = .unknown2
            }
            
            // <+756>
            if let backgroundMaterial = environment.backgroundMaterial {
                // <+848>
                // <+1004>
                if let provider = backgroundMaterial.provider(ofType: GlassMaterialProvider.ResolvedStyleProvider.self) {
                    getTraitsInternal(traits).resolvedProvider = provider 
                }
            }
            
            // <+1300>
            let newGlassFrost = environment.glassFrost
            let oldGlassFrost = getTraitsInternal(traits).glassFrost
            if newGlassFrost != oldGlassFrost {
                getTraitsInternal(traits).glassFrost = newGlassFrost
            }
            
            // <+1524>
            let newGlassMaterialPocketContainer = environment.glassMaterialPocketContainer
            getTraitsInternal(traits).glassPocketContainer = newGlassMaterialPocketContainer
        }
    }
}

extension MySwiftUICore.EnvironmentValues {
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
        guard let resolvedProvider = collection.resolvedProvider as? GlassMaterialProvider.ResolvedStyleProvider else {
            return
        }
        
        // <+564>
        fatalError("TODO")
    }
}
