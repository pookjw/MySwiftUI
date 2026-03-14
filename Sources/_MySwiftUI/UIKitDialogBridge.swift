internal import UIKit
private import MySwiftUICore
private import AttributeGraph

class UIKitDialogBridge/*: DialogActionDelegate*/ {
    weak var hostingController: UIViewController? = nil // 0x10
    weak var host: (UIView & ViewRendererHost)? = nil // 0x18
    private var activePresentation: UIKitDialogBridge.ActivePresentation = .none // 0xca0
    private var presentedVC: PlatformAlertController? = nil // 0xca8
    private var dialogSeed: VersionSeed = .empty // 0xcb0
    private var lastDialogValues: [ViewIdentity: ConfirmationDialog]? = nil // 0xcb8
    private var alertSeed: VersionSeed = .empty // 0xcc0
    private var lastAlertValues: [ViewIdentity: AlertStorage]? = nil // 0xcc8
    private var lastAllowsSecureDrawing: Bool = false // 0xcd0
    var lastEnvironment = EnvironmentValues() // 0xcd8
    private var lastActionContext: DialogActionContext? = nil // 0xce0
    private var lastPlatformItemList: PlatformItemList? = nil // 0xce8
    private var actionsChangeDetector = WeakAttribute<Void>() // 0xcf0
    
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
    
    final func preferencesDidChange(_ preferences: PreferenceValues) {
        /*
         self -> x20 -> x19
         preferences -> x0 -> sp + 0xcc8
         */
        // x20
        let dialogValue: PreferenceValues.Value<[ViewIdentity: ConfirmationDialog]>
        let x290x54: Bool
        if let host, host.window != nil {
            // <+1144>
            dialogValue = preferences[ConfirmationDialog.PreferenceKey.self]
            x290x54 = true
        } else {
            // <+1244>
            dialogValue = PreferenceValues.Value(value: .init(), seed: .invalid)
            x290x54 = false
        }
        
        // <+1308>
        // x28
        let dialogSeed = dialogSeed
        // x27
        let incomingDialogSeed = dialogValue.seed
        
        if !dialogSeed.matches(incomingDialogSeed) {
            // <+1464>
            fatalError("TODO")
        }
        
        // <+2556>
        // x26
        let alertValue: PreferenceValues.Value<[ViewIdentity: AlertStorage]>
        if x290x54 {
            alertValue = preferences[AlertStorage.PreferenceKey.self]
        } else {
            // <+2624>
            alertValue = PreferenceValues.Value(value: .init(), seed: .invalid)
        }
        
        // <+2684>
        // x28
        let alertSeed = alertSeed
        // x27
        let incomingAlertSeed = alertValue.seed
        
        if !alertSeed.matches(incomingAlertSeed) {
            // <+2820>
            fatalError("TODO")
        }
        
        // <+3912>
        let allowsSecureDrawingValue = preferences[AllowsSecureDrawingKey.self].value
        self.lastAllowsSecureDrawing = (allowsSecureDrawingValue == true)
        
        self.lastAlertValues = alertValue.value
        self.lastDialogValues = dialogValue.value
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
        static nonisolated(unsafe) let defaultValue: [ViewIdentity: ConfirmationDialog] = [:]
        
        static func reduce(value: inout [ViewIdentity: ConfirmationDialog], nextValue: () -> [ViewIdentity: ConfirmationDialog]) {
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
        static nonisolated(unsafe) let defaultValue: [ViewIdentity: AlertStorage] = [:]
        
        static func reduce(value: inout [ViewIdentity: AlertStorage], nextValue: () -> [ViewIdentity: AlertStorage]) {
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
