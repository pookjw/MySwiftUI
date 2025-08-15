#warning("TODO")
internal import Foundation
internal import MySwiftUICore
internal import UIKit

class DeprecatedAlertBridge<T>: NSObject {
    weak var host: (any ViewRendererHost)?
    var isShown: Bool
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
}
