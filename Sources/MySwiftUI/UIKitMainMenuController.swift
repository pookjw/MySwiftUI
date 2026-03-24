// B619265B3CBBC7F42E2392FC185432F2
internal import UIKit
@_spi(Internal) private import MySwiftUICore
private import _Elegibility
private import AttributeGraph

final class UIKitMainMenuController: UIResponder {
    private var topLevelItemCoordinators: [String: MainMenuItemCoordinator] = .init() // 0x10
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
    
    override func delete(_ sender: Any?) {
        assertUnimplemented()
    }
    
    override func buildMenu(with builder: any UIMenuBuilder) {
        /*
         self -> x20 -> x22
         builder -> x0 -> x25
         */
        // <+436>
        guard
            let appGraph = AppGraph.shared, // x24
            self.supportsMainMenu
        else {
            return
        }
        
        if appGraph.supports(.textEditing) {
            optionalMenus.formUnion(.unknown0)
        }
        
        // <+588>
        if appGraph.supports(.textFormatting) {
            optionalMenus.formUnion(.unknown1)
        }
        
        // <+704>
        if appGraph.supports(.toolbar) {
            optionalMenus.formUnion(.unknown2)
        }
        
        // <+820>
        if appGraph.supports(.sidebar) {
            optionalMenus.formUnion(.unknown3)
        }
        
        // <+936>
        if appGraph.supports(.printing) {
            optionalMenus.formUnion(.unknown4)
        }
        
        // <+1056>
        // x29 - 0x138
        let environment = appGraph.environment.configuredForRoot()
        
        // <+1144>
        let focusedValues = appGraph.focusedValues
        
        // x20
        let rootCommandsList = Graph.withoutUpdate { 
            return appGraph.rootCommandsList ?? CommandsList()
        }
        self.commandsListVersion = rootCommandsList.version
        
        // <+1356>
        var commands = _ResolvedCommands()
        rootCommandsList.resolveOperations(into: &commands)
        // x29 - 0x80
        var coordinators: [MainMenuItemCoordinator] = []
        // x29 - 0x38
        let mainMenuItems = commands.mainMenuItems(env: environment)
        
        for item in mainMenuItems {
            // <+1444>
            let coordinator = self.topLevelItemCoordinators[item.name] ?? MainMenuItemCoordinator(item, environment: environment)
            
            // <+1772>
            do {
                let menuHost = coordinator.menuHost
                menuHost.mainMenuItem = item
                menuHost.invalidateProperties([.rootView], mayDeferUpdate: true)
            }
            
            // <+1920>
            do {
                let menuHost = coordinator.menuHost
                let oldFocusedValues = menuHost.focusedValues
                menuHost.focusedValues = focusedValues
                
                if oldFocusedValues.version != menuHost.focusedValues.version {
                    menuHost.invalidateProperties([.focusedValues], mayDeferUpdate: true)
                }
            }
            
            // <+2192>
            coordinator.updateIfNeeded()
            coordinators.append(coordinator)
            self.resolveOptionalMenus(coordinator.instructions)
            self.topLevelItemCoordinators[item.name] = coordinator
        }
        
        // <+2560>
        // coordinators -> x19
        self.synthesizeSystemMenus(builder)
        assertUnimplemented()
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        assertUnimplemented()
    }
    
    @objc(_performMainMenuShortcutKeyCommand:)
    func _performMainMenuShortcutKeyCommand(_ command: UIKeyCommand) {
        assertUnimplemented()
    }
    
    var supportsMainMenu: Bool {
        if UIDevice.current.userInterfaceIdiom == .phone {
            var answer: UInt = 0
            let status = unsafe os_eligibility_get_domain_answer(0x7a, &answer, 0, 0, 0)
            
            if status == 0 {
                return answer == 4
            } else {
                return false
            }
        } else {
            return true
        }
    }
    
    fileprivate func resolveOptionalMenus(_ instructions: [MenuBuilderInstruction]) {
        /*
         self -> x20 -> sp + 0x8
         instructions -> sp + 0x10
         */
        if !self.optionalMenus.contains(.unknown1) {
            // <+76>
            for instruction in instructions {
                if instruction.identifier == .format {
                    self.optionalMenus.formUnion(.unknown1)
                    break
                }
            }
        }
        
        if !self.optionalMenus.contains(.unknown0) {
            // <+352>
            for instruction in instructions {
                if instruction.identifier.rawValue == "com.apple.swiftui.synthesized.textEditing" {
                    self.optionalMenus.formUnion(.unknown0)
                    break
                }
            }
        }
        
        if !self.optionalMenus.contains(.unknown2) {
            // <+640>
            for instruction in instructions {
                if instruction.identifier == .toolbar {
                    self.optionalMenus.formUnion(.unknown2)
                    break
                }
            }
        }
        
        if !self.optionalMenus.contains(.unknown3) {
            // <+916>
            for instruction in instructions {
                if instruction.identifier == .sidebar {
                    self.optionalMenus.formUnion(.unknown3)
                    break
                }
            }
        }
        
        if !self.optionalMenus.contains(.unknown4) {
            // <+1192>
            for instruction in instructions {
                if instruction.identifier == .print {
                    self.optionalMenus.formUnion(.unknown4)
                    break
                }
            }
        }
    }
    
    fileprivate func synthesizeSystemMenus(_ builder: any UIMenuBuilder) {
        assertUnimplemented()
    }
}

extension UIKitMainMenuController: AppGraphObserver {
    func scenesDidChange(phaseChanged: Bool) {
        // nop
    }
    
    func commandsDidChange() {
        assertUnimplemented()
    }
}

fileprivate final class MainMenuItemCoordinator {
    private(set) var menuHost: MainMenuItemHost // 0x10
    private var builderContext = MenuBuilderContext() // 0x18
    fileprivate private(set) var instructions: [MenuBuilderInstruction] = [] // 0x40
    private var needsUpdate: Bool = true // 0x48
    
    init(_ item: MainMenuItem, environment: EnvironmentValues) {
        let menuHost = MainMenuItemHost(item, environment: environment, focusedValues: FocusedValues(), focusStore: FocusStore())
        self.menuHost = menuHost
        menuHost.delegate = self
    }
    
    func updateIfNeeded() {
        // self -> x20
        // <+216>
        guard self.needsUpdate else {
            return
        }
        
        self.needsUpdate = false
        self.menuHost.viewGraph.requestedOutputs.formUnion(.platformItemList)
        
        // <+480>
        self.menuHost.render(interval: 0, updateDisplayList: false, targetTimestamp: nil)
        
        // <+644>
        // inlined
        let platformItemList = self.menuHost.platformItemList
        
        // <+728>
        guard !platformItemList.items.isEmpty else {
            return
        }
        
        // <+740>
        assertUnimplemented()
    }
    
    // TODO
}

extension MainMenuItemCoordinator: MainMenuItemHostDelegate {
    func menuHostDidChangeMenuItems(_ host: MainMenuItemHost) {
        updateIfNeeded()
    }
}

extension MenuBuilderContext {
    struct PlacementMap {
        private var map: [UUID: PlatformItemList] = .init()
    }
    
    enum PlacementKind {
        case unknown
        case standAlone
        case merge
    }
}

fileprivate enum MenuBuilderInstruction {
    case elementBefore(UIMenu.Identifier, UIMenuElement)
    case elementAfter(UIMenu.Identifier, UIMenuElement)
    case childBefore(UIMenu.Identifier, UIMenu)
    case childAfter(UIMenu.Identifier, UIMenu)
    case siblingBefore(UIMenu.Identifier, UIMenu)
    case siblingAfter(UIMenu.Identifier, UIMenu)
    case replace(UIMenu.Identifier, [UIMenuElement])
    
    @inline(__always) // 원래 없음
    var identifier: UIMenu.Identifier {
        switch self {
        case .elementBefore(let identifier, _):
            return identifier
        case .elementAfter(let identifier, _):
            return identifier
        case .childBefore(let identifier, _):
            return identifier
        case .childAfter(let identifier, _):
            return identifier
        case .siblingBefore(let identifier, _):
            return identifier
        case .siblingAfter(let identifier, _):
            return identifier
        case .replace(let identifier, _):
            return identifier
        }
    }
}

struct KeyCommandID: Hashable {
    fileprivate private(set) var seed: Int
}

protocol CommandAction {
    // TODO
}

fileprivate struct OptionalMenus: OptionSet {
    static var unknown0: OptionalMenus {
        return OptionalMenus(rawValue: 1 << 0)
    }
    
    static var unknown1: OptionalMenus {
        return OptionalMenus(rawValue: 1 << 1)
    }
    
    static var unknown2: OptionalMenus {
        return OptionalMenus(rawValue: 1 << 2)
    }
    
    static var unknown3: OptionalMenus {
        return OptionalMenus(rawValue: 1 << 3)
    }
    
    static var unknown4: OptionalMenus {
        return OptionalMenus(rawValue: 1 << 4)
    }
    
    let rawValue: Int
}

struct ResponderCommandsKey {
    @safe static nonisolated(unsafe) let defaultValue: [Selector: any CommandAction] = [:]
}
