private import UIKit
private import MySwiftUICore
private import AttributeGraph

class UIKitDialogBridge/*: DialogActionDelegate*/ {
    weak var hostingController: UIViewController? = nil
    private weak var host: (UIView & ViewRendererHost)? = nil
    private var activePresentation: UIKitDialogBridge.ActivePresentation = .none
    private var presentedVC: PlatformAlertController? = nil // 0xe48
    private var dialogSeed: VersionSeed = .empty // 0xe50
    private var lastDialogValues: [ViewIdentity: ConfirmationDialog]? = nil // 0xe58
    private var alertSeed: VersionSeed = .empty // 0xe60
    private var lastAlertValues: [ViewIdentity: AlertStorage]? = nil // 0xe68
    private var lastAllowsSecureDrawing: Bool = false // 0xe70
    private var lastEnvironment = EnvironmentValues() // 0xe78
    private var lastActionContext: DialogActionContext? = nil // 0xe80
    private var lastPlatformItemList: PlatformItemList? = nil // 0xe88
    private var actionsChangeDetector = WeakAttribute<Void>()
    
    init() {
    }
    
    // TODO
}

extension UIKitDialogBridge {
    enum ActivePresentation {
        case alert(ViewIdentity)
        case confirmationDialog(ViewIdentity)
        case none
    }
}

struct ConfirmationDialog {
    // TODO
}

struct AlertStorage {
    // TODO
}

struct DialogActionContext {
    // TODO
}
