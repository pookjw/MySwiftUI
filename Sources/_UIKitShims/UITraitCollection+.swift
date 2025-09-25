internal import UIKit
private import _UIKitPrivate
internal import MySwiftUICore

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
}
