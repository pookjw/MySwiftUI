// 06BAECED8B4325F4077AB1B0B39FB36F
@_spi(Internal) internal import MySwiftUICore
internal import UIKit

@MainActor final class DeprecatedAlertBridge<T : AlertControllerConvertible>: NSObject {
    weak var host: (any ViewRendererHost)? = nil
    private var isShown: Bool = false
    private var seed: VersionSeed = .empty
    private var alertController: PlatformAlertController? = nil
    private var lastEnvironment: EnvironmentValues = EnvironmentValues()
    private var lastPresentation: T? = nil
    private var isChangingIdentity: Bool = false
    private var style: UIAlertController.Style
    
    init(style: UIAlertController.Style) {
        self.style = style
        super.init()
    }
    
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
    
    func addPreferences(to viewGraph: ViewGraph) {
        if style == .actionSheet {
            viewGraph.addPreference(ActionSheet.Presentation.Key.self)
        } else {
            viewGraph.addPreference(Alert.Presentation.Key.self)
        }
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
    
    @MainActor
    func update(environment: EnvironmentValues) {
        self.lastEnvironment = environment
        
        if
            let lastPresentation,
            let alertController
        {
            alertController.update(for: lastPresentation, with: environment, environmentChanged: true)
        }
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
        
        if alertController != nil {
            // <+1228>
            assertUnimplemented()
        } else {
            // <+1348>
            assertUnimplemented()
        }
        assertUnimplemented()
    }
}

extension DeprecatedAlertBridge where T == ActionSheet.Presentation {
    func preferencesDidChange(_ preferenceValues: PreferenceValues) {
        let presentationValue = preferenceValues[ActionSheet.Presentation.Key.self]
        
        guard !seed.matches(presentationValue.seed) else {
            return
        }
        
        assertUnimplemented()
    }
}
