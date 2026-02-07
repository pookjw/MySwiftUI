internal import UIKit
private import MySwiftUICore
private import AttributeGraph

class UIKitDialogBridge/*: DialogActionDelegate*/ {
    weak var hostingController: UIViewController? = nil // 0x10
    weak var host: (UIView & ViewRendererHost)? = nil // 0x18
    private var activePresentation: UIKitDialogBridge.ActivePresentation = .none // 0xca0
    private var presentedVC: PlatformAlertController? = nil // 0xe48
    private var dialogSeed: VersionSeed = .empty // 0xe50
    private var lastDialogValues: [ViewIdentity: ConfirmationDialog]? = nil // 0xe58
    private var alertSeed: VersionSeed = .empty // 0xe60
    private var lastAlertValues: [ViewIdentity: AlertStorage]? = nil // 0xe68
    private var lastAllowsSecureDrawing: Bool = false // 0xe70
    var lastEnvironment = EnvironmentValues() // 0xe78
    private var lastActionContext: DialogActionContext? = nil // 0xe80
    private var lastPlatformItemList: PlatformItemList? = nil // 0xe88
    private var actionsChangeDetector = WeakAttribute<Void>()
    
    init() {
    }
    
    final func transformDidChange() {
        // <+264>
        // x25
        let copy_1 = activePresentation
        
        switch copy_1 {
        case .alert(let viewIdentity):
            return
        case .confirmationDialog(let viewIdentity):
            // <+328>
            fatalError("TODO")
        case .none:
            return
        }
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

extension ConfirmationDialog {
    struct PreferenceKey: HostPreferenceKey {
        static var defaultValue: Never {
            fatalError("TODO")
        }
        
        static func reduce(value: inout Never, nextValue: () -> Never) {
            fatalError("TODO")
        }
        
        static var _isReadableByHost: Bool {
            fatalError("TODO")
        }
        
        static var _includesRemovedValues: Bool {
            fatalError("TODO")
        }
    }
}

struct AlertStorage {
    // TODO
}

extension AlertStorage {
    struct PreferenceKey: HostPreferenceKey {
        static var defaultValue: Never {
            fatalError("TODO")
        }
        
        static func reduce(value: inout Never, nextValue: () -> Never) {
            fatalError("TODO")
        }
        
        static var _isReadableByHost: Bool {
            fatalError("TODO")
        }
        
        static var _includesRemovedValues: Bool {
            fatalError("TODO")
        }
    }
}

struct DialogActionContext {
    // TODO
}
