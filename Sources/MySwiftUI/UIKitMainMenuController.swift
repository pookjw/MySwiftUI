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
        
        var dictionary: [KeyCommandID: () -> Void] = .init()
        for coordinator in coordinators {
            // coordinator -> x26
            for instruction in coordinator.instructions {
                builder.perform(instruction: instruction)
            }
            
            dictionary.merge(coordinator.builderContext.keyCommandMap) { _, _ in
                // $sxq_xq_Iegnnrr_x3key_q_5valuetx_q_tIegnr_SHRzr0_lTR7SwiftUI12KeyCommandIDV_yycTG5068$sSD5merge_16uniquingKeysWithySDyxq_Gn_q_q__q_tKXEtKFx_q_tx_q_tcfU_7c4UI12eF10IDV_yycTG5Tf3nnpf_n
                assertUnimplemented()
            }
        }
        
        // <+3116>
        self.keyCommandMap = dictionary
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
    
    @inline(always) // 원래 없음
    func updateDocumentCommands(environment: inout EnvironmentValues) {
        environment.documentCommands = self.documentCommands()
    }
    
    fileprivate func documentCommands() -> PlatformItemList {
        // <+124>
        // x29 - 0xa8
        let placements: [CommandGroupPlacement] = [
            .saveItem,
            .printItem
        ]
        
        // x27
        var result = PlatformItemList(items: [])
        
        for coordinator in self.topLevelItemCoordinators.values {
            for placement in placements {
                let list = coordinator.builderContext.placementMap.map[placement.id] ?? PlatformItemList(items: [])
                result.items.append(contentsOf: list.items)
            }
        }
        
        return result
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
        /*
         self -> x20 -> x21
         builder -> x0 -> x19
         */
        let importExportMenu = UIMenu(
            title: "",
            subtitle: nil,
            image: nil,
            identifier: UIMenu.Identifier(rawValue: "com.apple.swiftui.synthesized.importExport"),
            options: [.displayInline],
            preferredElementSize: .automatic,
            children: []
        )
        
        builder.insertSibling(importExportMenu, afterMenu: .close)
        
        if
            !self.optionalMenus.contains(.unknown4),
            isLinkedOnOrAfter(.v7)
        {
            builder.remove(menu: .print)
        }
        
        // <+220>
        if
            !self.optionalMenus.contains(.unknown0),
            isLinkedOnOrAfter(.v7)
        {
            builder.remove(menu: .find)
            builder.remove(menu: .spelling)
            builder.remove(menu: .substitutions)
            builder.remove(menu: .transformations)
            builder.remove(menu: .speech)
        } else {
            // <+364>
            builder.replaceChildren(ofMenu: .edit) { elements in
                // $sSaySo13UIMenuElementCGACIggo_A2CIeggo_TR0105$s7SwiftUI23UIKitMainMenuControllerC021synthesizeTextEditingE033_B619265B3CBBC7F42E2392FC185432F2LLyySo13a18Builder_pFSaySo0Q7B9CGAIXEfU_Tf3npf_n
                let indices = elements.indices
                for index in indices {
                    let element = elements[index]
                    
                    guard let casted = element as? UIMenu else {
                        continue
                    }
                    
                    guard casted.identifier == .spelling else {
                        continue
                    }
                    
                    // <+348>
                    let menu = UIMenu(
                        title: "",
                        subtitle: nil,
                        image: nil,
                        identifier: UIMenu.Identifier(rawValue: "com.apple.swiftui.synthesized.textEditing"),
                        options: [.displayInline],
                        preferredElementSize: .automatic,
                        children: Array(elements[index..<indices.endIndex])
                    )
                    
                    var elements = elements
                    elements.replaceSubrange(index..<indices.endIndex, with: [menu])
                    return elements
                }
                
                return elements
            }
        }
        
        // <+492>
        if
            !self.optionalMenus.contains(.unknown1),
            isLinkedOnOrAfter(.v7)
        {
            builder.remove(menu: .format)
        } else {
            // <+536>
            builder.replaceChildren(ofMenu: .format) { elements in
                // $sSaySo13UIMenuElementCGACIggo_A2CIeggo_TR0100$s7SwiftUI23UIKitMainMenuControllerC016synthesizeFormatE033_B619265B3CBBC7F42E2392FC185432F2LLyySo13a18Builder_pFSaySo0P7B9CGAIXEfU_Tf3npf_n
                let menu = UIMenu(
                    title: "",
                    subtitle: nil,
                    image: nil,
                    identifier: UIMenu.Identifier(rawValue: "com.apple.swiftui.synthesized.textFormatting"),
                    options: [.displayInline]
                    , preferredElementSize: .automatic,
                    children: elements
                )
                
                return [menu]
            }
        }
        
        // <+664>
        if
            !self.optionalMenus.contains(.unknown2),
            isLinkedOnOrAfter(.v7)
        {
            builder.remove(menu: .toolbar)
        }
        
        if
            !self.optionalMenus.contains(.unknown3),
            isLinkedOnOrAfter(.v7)
        {
            builder.remove(menu: .sidebar)
        }
    }
}

extension UIKitMainMenuController: AppGraphObserver {
    func scenesDidChange(phaseChanged: Bool) {
        // nop
    }
    
    func commandsDidChange() {
        // self -> x20
        // <+284>
        // x23
        let version: DisplayList.Version?
        if let appGraph = AppGraph.shared {
            let list: CommandsList
            if let rootCommandsList = appGraph.rootCommandsList {
                list = rootCommandsList
            } else {
                list = CommandsList()
            }
            
            // <+396>
            version = list.version
        } else {
            // <+340>
            version = nil
        }
        
        // <+440>
        // x24
        let current: DisplayList.Version? = self.commandsListVersion
        // x19
        let copy_1 = version
        // x19 + 0x20
        let copy_2 = current
        
        // <+584>
        if let copy_1 {
            // <+728>
            if let copy_2 {
                // <+924>
                if copy_1 == copy_2 {
                    // <+1116>
                    return
                } else {
                    // <+876>
                }
            } else {
                // <+788>
                // <+876>
            }
        } else {
            // <+612>
            if let copy_2 {
                // <+860>
                // <+876>
            } else {
                // <+692>
                // <+1116>
                return
            }
        }
        
        // <+876>
        guard supportsMainMenu else {
            return
        }
        
        UIMenuSystem.main.setNeedsRebuild()
    }
}

fileprivate final class MainMenuItemCoordinator {
    private(set) var menuHost: MainMenuItemHost // 0x10
    fileprivate private(set) var builderContext = MenuBuilderContext() // 0x18
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
        private(set) var map: [UUID: PlatformItemList] = .init()
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
    
    @inline(always) // 원래 없음
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

extension UIMenuBuilder {
    fileprivate func perform(instruction: MenuBuilderInstruction) {
        assertUnimplemented()
    }
}
