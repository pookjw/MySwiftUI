#warning("TODO")
@_spi(Internal) internal import MySwiftUICore
internal import UIKit

final class DeprecatedAlertBridge<T>: NSObject {
    weak var host: (any ViewRendererHost)?
    private var isShown: Bool
    private var seed: VersionSeed
    private var alertController: PlatformAlertController?
    private var lastEnvironment: EnvironmentValues
    private var lastPresentation: T?
    private var isChangingIdentity: Bool
    private var style: UIAlertController.Style
    
    init(host: (any ViewRendererHost)?, isShown: Bool, seed: VersionSeed, alertController: PlatformAlertController?, lastEnvironment: EnvironmentValues, lastPresentation: T?, isChangingIdentity: Bool, style: UIAlertController.Style) {
        self.host = host
        self.isShown = isShown
        self.seed = seed
        self.alertController = alertController
        self.lastEnvironment = lastEnvironment
        self.lastPresentation = lastPresentation
        self.isChangingIdentity = isChangingIdentity
        self.style = style
        super.init()
    }
    
    // inlined from $s7SwiftUI14_UIHostingViewC04rootD0ACyxGx_tcfcTf4gn_n
    // 원래 없음
    @inlinable
    func addPreferences(to viewGraph: ViewGraph, isActionSheet: Bool) {
        if isActionSheet {
            viewGraph.addPreference(ActionSheet.Presentation.Key.self)
        } else {
            viewGraph.addPreference(Alert.Presentation.Key.self)
        }
    }
    
    func update(environment: EnvironmentValues) {
        fatalError("TODO")
    }
}

extension DeprecatedAlertBridge where T == Alert.Presentation {
    func preferencesDidChange(_ preferenceValues: PreferenceValues) {
        // x28
        let presentationValue = preferenceValues[Alert.Presentation.Key.self]
        
        guard !seed.matches(presentationValue.seed) else {
            return
        }
        
        // <+944>
        /*
         presentationValue = x19 + 0xe0
         self = x19 + 0x38
         */
        
        let host = host!
        
        guard host.uiPresenterViewController != nil else {
            return
        }
        
        guard !isChangingIdentity else {
            return
        }
        
        self.seed = presentationValue.seed
        
        if let alertController {
            // <+1228>
            fatalError("TODO")
        } else {
            // <+1348>
            fatalError("TODO")
        }
        fatalError("TODO")
    }
}

extension DeprecatedAlertBridge where T == ActionSheet.Presentation {
    func preferencesDidChange(_ preferenceValues: PreferenceValues) {
        let presentationValue = preferenceValues[ActionSheet.Presentation.Key.self]
        
        guard !seed.matches(presentationValue.seed) else {
            return
        }
        
        fatalError("TODO")
    }
}
