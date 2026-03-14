@_spi(Internal) internal import MySwiftUICore
internal import UIKit
private import _UIKitShims
private import _DesignLibraryShims
private import _MySwiftUIShims
private import _CoreServicesPrivate
private import _UIKitPrivate
private import BoardServices

extension EnvironmentValues {
    @MainActor static let configuredForPlatform: EnvironmentValues = {
        var environmentValues = unsafe ViewGraphHost.defaultEnvironment
        environmentValues._configureForPlatform(traitCollection: nil)
        return environmentValues
    }()
    
    @MainActor mutating func configureForPlatform(traitCollection: UITraitCollection?) {
        /*
         self = x19
         traitCollection = x21
         */
        // x23
        let plist = plist
        // x22
        let other = EnvironmentValues.configuredForPlatform
        // x20
        let otherPlist = other.plist
        
        if plist.isEmpty {
            // <+140>
            if otherPlist.isEmpty {
                // <+200>
                if traitCollection != nil {
                    // <+124>
                    self.plist = PropertyList()
                } else {
                    return
                }
            }
        } else {
            if plist.isIdentical(to: otherPlist) {
                if traitCollection == nil{
                    // <+212>
                    return
                }
            }
        }
        
        // <+152>
        if self.plist.isEmpty {
            // <+176>
            self._configureForPlatform(traitCollection: traitCollection)
            return
        } else {
            // <+172>
            if let traitCollection {
                // <+176>
                self._configureForPlatform(traitCollection: traitCollection)
                return
            } else {
                // <+232>
                self.plist = other.plist
                return
            }
        }
    }
    
    @MainActor private mutating func _configureForPlatform(traitCollection: UITraitCollection?) {
        // traitCollection = x21
        self.platformProvidersDefinition = SwiftUIPlatformProvidersDefinition.self
        self.hasSystemOpenURLAction = true
        OpenURLAction.updateDefaultActions(env: self)
        
        // x25
        let mainScreen = MyUIScreen.main
        
        // x27
        let userInterfaceIdiom: UIUserInterfaceIdiom
        if let traitCollection {
            // <+324>
            userInterfaceIdiom = traitCollection.userInterfaceIdiom
        } else {
            // <+380>
            userInterfaceIdiom = UIDevice.current.userInterfaceIdiom
        }
        
        // <+380>
        if let viewGraphIdiom = userInterfaceIdiom.viewGraphIdiom {
            self.viewGraphIdiom = viewGraphIdiom
        }
        
        switch userInterfaceIdiom {
        case .unspecified:
            self.designIdiom = .universal
        case .phone:
            self.designIdiom = .phone
        case .pad:
            self.designIdiom = .pad
        case .tv:
            self.designIdiom = .tv
        case .carPlay:
            self.designIdiom = .carPlay
        case .mac:
            self.designIdiom = .mac
        case .vision:
            self.designIdiom = .spatial
        @unknown default:
            self.designIdiom = .universal
        }
        
        self.viewGraphAssetCatalogConfiguration = ViewGraphHost.AssetCatalogConfiguration(
            referenceBounds: mainScreen._referenceBounds,
            pointsPerInch: mainScreen._pointsPerInch,
            preferredArtworkSubtype: 0
        )
    }
}

extension OpenURLAction {
    static func updateDefaultActions(env: EnvironmentValues) {
        // <+200>
        if OpenURLAction.defaultAction == nil {
            OpenURLAction.defaultAction = OpenURLAction(isDefault: true) { input in
                // $s7SwiftUI13OpenURLActionV14_defaultAction33_BAA26ED0B397494A179F1F07D7B4F160LL3envAcA17EnvironmentValuesV_tFZyAC18SystemHandlerInputVcfU_TA
                /*
                 input -> x0 -> x20
                 env -> x1 -> x21
                 */
                // <+148>
                let url = input.url
                let prefersInApp = input.prefersInApp
                let completion = input.completion
                
                if
                    prefersInApp,
                    let window = UIApplication
                        .shared
                        .connectedScenes
                        .compactMap({ $0 as? UIWindowScene })
                        .map({ $0.windows })
                        .flatMap({ $0 })
                        .first(where: { $0.isKeyWindow })
                {
                    // <+804>
                    let viewController = _makeSafariViewController(url) as! UIViewController
                    
                    if let rootViewController = window.rootViewController {
                        rootViewController.present(viewController, animated: true, completion: nil)
                    }
                } else {
                    // <+1048>
                    if
                        let windowScene = env.windowScene,
                        let scene = windowScene.session.scene
                    {
                        // <+1212>
                        scene.open(url, options: nil) { success in
                            completion(success)
                        }
                    } else {
                        // <+1408>
                        UIApplication.shared.open(url, options: [:]) { success in
                            completion(success)
                        }
                    }
                }
            }
        }
        
        if OpenURLAction.defaultSensitiveAction == nil {
            OpenURLAction.defaultSensitiveAction = OpenURLAction(isDefault: true) { input in
                // $s7SwiftUI13OpenURLActionV23_defaultSensitiveAction33_BAA26ED0B397494A179F1F07D7B4F160LLACvgZyAC18SystemHandlerInputVcfU_
                let configuration = _LSOpenConfiguration()
                configuration.isSensitive = true
                
                let endpoint: BSServiceConnectionEndpoint?
                if let scene = UIApplication.shared.connectedScenes.first {
                    endpoint = scene._currentOpenApplicationEndpoint()
                } else {
                    endpoint = nil
                }
                
                // <+336>
                configuration.targetConnectionEndpoint = endpoint
                
                guard let workspace = LSApplicationWorkspace.default() else {
                    return
                }
                
                workspace.open(input.url, configuration: configuration) { _, error in
                    if let error {
                        Log.internalWarning("Failed to open sensitive URL \(input.url). \(error)")
                    }
                    
                    input.completion(error != nil)
                }
            }
        }
    }
}
