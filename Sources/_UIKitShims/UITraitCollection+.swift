internal import UIKit
private import _UIKitPrivate
@_spi(Internal) package import MySwiftUICore
private import _DyldPrivate

extension UITraitCollection {
    // unnamed
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
        
        result.systemColorScheme = self.colorScheme
        
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
    
    package func coreResolvedGlassMaterialEnvironment(base: MySwiftUICore.EnvironmentValues) -> MySwiftUICore.EnvironmentValues {
        fatalError("TODO")
    }
    
    // ___lldb_unnamed_symbol316116
    var colorScheme: MySwiftUICore.ColorScheme {
        switch self.userInterfaceStyle {
        case .light:
            return .light
        case .dark:
            return .dark
        default:
            return .light
        }
    }
    
    // ___lldb_unnamed_symbol311478
    private var materialBackdropContext: AnyObject? {
#if SwiftUICompataibility
        return self._object(forTraitToken: MaterialBackdropContextTraitToken()!) as? AnyObject
#else
#error("TODO")
#endif
    }
    
    // ___lldb_unnamed_symbol311482
    var resolvedProvider: AnyObject? {
#if SwiftUICompataibility
        return self._object(forTraitToken: ResolvedProviderTraitToken()!) as? AnyObject
#else
#error("TODO")
#endif
    }
}
