// 7CAAF8CB17093C835B3EA3980BA79FD8
internal import Foundation
private import MySwiftUICore
#if SwiftUICompataibility
private import ObjectiveC.runtime
#endif

struct CommandOperation {
    private var mutation: CommandOperation.Mutation
    private var placement: CommandGroupPlacement
    private var resolver: (CommandOperation, inout _ResolvedCommands) -> ()?
}

extension CommandOperation {
    enum Mutation {
        case append
        case prepend
        case replace
        case topLevel
        case initialize
    }
}

public struct CommandGroupPlacement: Sendable {
    @MainActor public static let appInfo: CommandGroupPlacement = {
        let name = Text(verbatim: "App Info")
        name.assertUnstyled("init(_:)")
        return CommandGroupPlacement(name: name, id: UUID())
    }()
    
    @MainActor public static let appSettings: CommandGroupPlacement = {
        let name = Text(verbatim: "App Settings")
        name.assertUnstyled("init(_:)")
        return CommandGroupPlacement(name: name, id: UUID())
    }()
    
    @MainActor public static let systemServices: CommandGroupPlacement = {
        let name = Text(verbatim: "System Services")
        name.assertUnstyled("init(_:)")
        return CommandGroupPlacement(name: name, id: UUID())
    }()
    
    @MainActor public static let appVisibility: CommandGroupPlacement = {
        let name = Text(verbatim: "App Visibility")
        name.assertUnstyled("init(_:)")
        return CommandGroupPlacement(name: name, id: UUID())
    }()
    
    @MainActor public static let appTermination: CommandGroupPlacement = {
        let name = Text(verbatim: "App Termination")
        name.assertUnstyled("init(_:)")
        return CommandGroupPlacement(name: name, id: UUID())
    }()
    
    @MainActor public static let newItem: CommandGroupPlacement = {
        fatalError("TODO")
    }()
    
    @MainActor public static let saveItem: CommandGroupPlacement = {
        fatalError("TODO")
    }()
    
    @MainActor public static let importExport: CommandGroupPlacement = {
        fatalError("TODO")
    }()
    
    @MainActor public static let printItem: CommandGroupPlacement = {
        fatalError("TODO")
    }()
    
    @MainActor public static let undoRedo: CommandGroupPlacement = {
        fatalError("TODO")
    }()
    
    @MainActor public static let pasteboard: CommandGroupPlacement = {
        fatalError("TODO")
    }()
    
    @MainActor public static let textEditing: CommandGroupPlacement = {
        fatalError("TODO")
    }()
    
    @MainActor public static let textFormatting: CommandGroupPlacement = {
        fatalError("TODO")
    }()
    
    @MainActor public static let toolbar: CommandGroupPlacement = {
        fatalError("TODO")
    }()
    
    @MainActor public static let sidebar: CommandGroupPlacement = {
        fatalError("TODO")
    }()
    
    @MainActor public static let windowSize: CommandGroupPlacement = {
        fatalError("TODO")
    }()
    
    @MainActor static let windowList: CommandGroupPlacement = {
        fatalError("TODO")
    }()
    
    @MainActor static let singleWindowList: CommandGroupPlacement = {
        fatalError("TODO")
    }()
    
    @MainActor static let windowArrangement: CommandGroupPlacement = {
        fatalError("TODO")
    }()
    
    @MainActor static let help: CommandGroupPlacement = {
        fatalError("TODO")
    }()
    
    @MainActor static let appShortcuts: CommandGroupPlacement = {
        fatalError("TODO")
    }()
    
    private let name: Text
    private let id: UUID
    
    // TODO
}

public struct _ResolvedCommands {
    @_transparent fileprivate static var bundle: Bundle {
        let bundleClass: AnyClass
#if SwiftUICompataibility
        bundleClass = objc_lookUpClass("_TtC7SwiftUIP33_7CAAF8CB17093C835B3EA3980BA79FD812SwiftUIClass")!
#else
        bundleClass = SwiftUIClass.self
#endif
        return Bundle(for: bundleClass)
    }
    
    // $s7SwiftUI17_ResolvedCommandsV8fileItem_WZ
    @safe static nonisolated(unsafe) let fileItem = Text("File", tableName: "MainMenu", bundle: bundle, comment: "Title of top level File main menu")
    
    @safe static nonisolated(unsafe) let editItem: Text = {
        // $s7SwiftUI17_ResolvedCommandsV8editItem_WZ
        fatalError("TODO")
    }()
    
    @safe static nonisolated(unsafe) let formatItem: Text = {
        // $s7SwiftUI17_ResolvedCommandsV10formatItem_WZ
        fatalError("TODO")
    }()
    
    @safe static nonisolated(unsafe) let viewItem: Text = {
        // $s7SwiftUI17_ResolvedCommandsV8viewItem_WZ
        fatalError("TODO")
    }()
    
    @safe static nonisolated(unsafe) let windowItem: Text = {
        // $s7SwiftUI17_ResolvedCommandsV10windowItem_WZ
        fatalError("TODO")
    }()
    
    @safe static nonisolated(unsafe) let helpItem: Text = {
        // $s7SwiftUI17_ResolvedCommandsV8helpItem_WZ
        fatalError("TODO")
    }()
    
    var topLevelCommands: [HashableCommandGroupPlacementWrapper] = []
    var storage: [HashableCommandGroupPlacementWrapper: CommandAccumulator] = [:]
    var flags: Set<CommandFlag> = []
    
    func mainMenuItems(env: EnvironmentValues) -> [MainMenuItem] {
        /*
         self -> x20
         env -> x0 -> x29 - 0x110
         */
        // <+692>
        // 총 5개
        let templates: [MainMenuItem.Template] = [
            MainMenuItem.Template(
                name: currentAppName(),
                id: .app,
                options: [],
                expectedPlacements: {
                    // $s7SwiftUI17_ResolvedCommandsV13mainMenuItems3envSayAA04MainF4ItemVGAA17EnvironmentValuesV_tFSayAA21CommandGroupPlacementVGyXEfU_
                    // 원래 없음 MainActor.assumeIsolated
                    return MainActor.assumeIsolated {
                        let appInfo = CommandGroupPlacement.appInfo
                        let appSettings = CommandGroupPlacement.appSettings
                        let systemServices = CommandGroupPlacement.systemServices
                        let appVisibility = CommandGroupPlacement.appVisibility
                        let appTermination = CommandGroupPlacement.appTermination
                        
                        // <+456>
                        var placements: [CommandGroupPlacement] = [appInfo]
                        placements.append(contentsOf: [appSettings])
                        placements.append(contentsOf: [systemServices])
                        placements.append(contentsOf: [appVisibility])
                        placements.append(contentsOf: [appTermination])
                        
                        return placements
                    }
                }()
            ),
            
            // <+944>
            MainMenuItem.Template(
                name: _ResolvedCommands.fileItem.resolveString(in: env, idiom: nil),
                id: .file,
                options: [],
                expectedPlacements: {
                    // $s7SwiftUI17_ResolvedCommandsV13mainMenuItems3envSayAA04MainF4ItemVGAA17EnvironmentValuesV_tFSayAA21CommandGroupPlacementVGyXEfU0_
                    fatalError("TODO")
                }()
            ),
            
            // <+1300>
        ]
        
        fatalError("TODO")
    }
}

extension _ResolvedCommands: Sendable {}

struct HashableCommandGroupPlacementWrapper: Hashable {
    // TODO
}

struct CommandAccumulator {
    // TODO
}

extension CommandAccumulator {
    struct Result {
        private var viewContent: AnyView
    }
}

struct MainMenuItem {
    private var name: String
    private var id: MainMenuItem.Identifier
    private var groups: [CommandAccumulator.Result]
}

extension MainMenuItem {
    enum Identifier {
        case custom(UUID)
        case app
        case file
        case edit
        case format
        case view
        case window
        case help
        case dock
        case invalid
        case root
    }
    
    fileprivate struct Template {
        let name: String
        let id: MainMenuItem.Identifier
        let options: MainMenuItem.Template.Options
        let expectedPlacements: [CommandGroupPlacement]
    }
}

extension MainMenuItem.Template {
    fileprivate struct Options: OptionSet {
        let rawValue: Int
    }
}

#if !SwiftUICompataibility
fileprivate final class SwiftUIClass: NSObject {}
#endif
