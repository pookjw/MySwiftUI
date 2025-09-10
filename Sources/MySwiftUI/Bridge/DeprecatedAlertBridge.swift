#warning("TODO")
internal import Foundation
internal import MySwiftUICore
internal import UIKit

class DeprecatedAlertBridge<T>: NSObject {
    private weak var host: (any ViewRendererHost)?
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
    final func setUp(host: (any ViewRendererHost), viewGraph: ViewGraph, isActionSheet: Bool) {
        self.host = host
        
        if isActionSheet {
            viewGraph.addPreference(ActionSheet.Presentation.Key.self)
        } else {
            viewGraph.addPreference(Alert.Presentation.Key.self)
        }
    }
}
