internal import Foundation
private import MySwiftUICore

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
    // TODO
}

public struct _ResolvedCommands {
    @safe static nonisolated(unsafe) let fileItem: Text = {
        // $s7SwiftUI17_ResolvedCommandsV8fileItem_WZ
        fatalError("TODO")
    }()
    
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
        let placements: () -> [CommandGroupPlacement] = {
            // $s7SwiftUI17_ResolvedCommandsV13mainMenuItems3envSayAA04MainF4ItemVGAA17EnvironmentValuesV_tFSayAA21CommandGroupPlacementVGyXEfU_
            fatalError("TODO")
        }
        
        // <+692>
        // 총 5개
        let templates: [MainMenuItem.Template] = [
            MainMenuItem.Template(
                name: currentAppName(),
                id: .app,
                options: [],
                expectedPlacements: placements()
            ),
            
            // <+944>
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
