// B619265B3CBBC7F42E2392FC185432F2
internal import UIKit
private import MySwiftUICore
private import _Elegibility

final class UIKitMainMenuController: UIResponder {
    private var topLevelItemCoordinators: [String : MainMenuItemCoordinator] = .init() // 0x10
    private var keyCommandMap: [KeyCommandID: () -> Void] = .init() // 0x18
    private var currentResponderCommands: [Selector: any CommandAction] = ResponderCommandsKey.defaultValue // 0x20
    private var commandsListVersion = DisplayList.Version() // 0x28
    private var optionalMenus: OptionalMenus = [] // 0x30
    
    override init() {
        super.init()
        
        if let graph = AppGraph.shared {
            graph.addObserver(self)
        }
    }
    
    func commandsDidChange() {
        fatalError("TODO")
    }
    
    override func delete(_ sender: Any?) {
        fatalError("TODO")
    }
    
    override func buildMenu(with builder: any UIMenuBuilder) {
        /*
         self -> x20 -> x22
         builder -> x0 -> x25
         */
        // <+436>
        guard let appGraph = AppGraph.shared else {
            return
        }
        
        
        fatalError("TODO")
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        fatalError("TODO")
    }
    
    @objc(_performMainMenuShortcutKeyCommand:)
    func _performMainMenuShortcutKeyCommand(_ command: UIKeyCommand) {
        fatalError("TODO")
    }
    
    var supportsMainMenu: Bool {
        if UIDevice.current.userInterfaceIdiom == .phone {
            var answer: UInt = 0
            let status = os_eligibility_get_domain_answer(0x7a, &answer, 0, 0, 0)
            fatalError()
        } else {
            return true
        }
    }
}

extension UIKitMainMenuController: AppGraphObserver {
    // TODO
}

fileprivate final class MainMenuItemCoordinator {
    // TODO
}

struct KeyCommandID: Hashable {
    fileprivate private(set) var seed: Int
}

protocol CommandAction {
    // TODO
}

fileprivate struct OptionalMenus: OptionSet {
    let rawValue: Int
}

struct ResponderCommandsKey {
    @safe static nonisolated(unsafe) let defaultValue: [Selector: any CommandAction] = [:]
}
