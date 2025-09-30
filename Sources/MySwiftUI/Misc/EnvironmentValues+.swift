internal import MySwiftUICore
internal import UIKit
private import _UIKitShims

extension EnvironmentValues {
    static nonisolated(unsafe) let configuredForPlatform: EnvironmentValues = {
        var environmentValues = ViewGraphHost.defaultEnvironment
        environmentValues._configureForPlatform(traitCollection: nil)
        return environmentValues
    }()
    
    func configureForPlatform(traitCollection: UITraitCollection?) {
        let configuredForPlatform = EnvironmentValues.configuredForPlatform
        fatalError("TODO")
    }
    
    private mutating func _configureForPlatform(traitCollection: UITraitCollection?) {
        // traitCollection = x21
        // x25
        let mainScreen = MyUIScreen.main
        
        let userInterfaceIdiom: UIUserInterfaceIdiom
        if let traitCollection {
            // <+324>
            userInterfaceIdiom = traitCollection.userInterfaceIdiom
        } else {
            // <+380>
            userInterfaceIdiom = UIDevice.current.userInterfaceIdiom
        }
        
        // <+380>
        userInterfaceIdiom.viewGraphIdiom
        fatalError("TODO")
    }
}
