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
    
    func preferencesDidChange(_ preferenceValues: PreferenceValues) {
        fatalError("TODO")
    }
}
