internal import UIKit
private import _UIKitPrivate
package import MySwiftUICore

extension UITraitCollection {
    // ___lldb_unnamed_symbol316127
    func environmentValues() -> EnvironmentValues {
        if let environmentWrapper = _environmentWrapper as? ViewGraphHostEnvironmentWrapper {
            return environmentWrapper.environment
        }
        
        var enviromentValues = EnvironmentValues()
        enviromentValues.locale = .current
        enviromentValues.calendar = .current
        enviromentValues.timezone = .current
        return enviromentValues
    }
    
    package func coreResolvedBaseEnvironment(base: EnvironmentValues) -> EnvironmentValues {
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
        @unknown default:
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
        @unknown default:
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
        @unknown default:
            break
        }
        
        result.systemColorScheme = self.colorScheme
        
        // <+2340>
        fatalError("TODO")
    }
    
    // ___lldb_unnamed_symbol316116
    private var colorScheme: ColorScheme {
        switch self.userInterfaceStyle {
        case .light:
            return .light
        case .dark:
            return .dark
        default:
            return .light
        }
    }
}
