
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
    var topLevelCommands: [HashableCommandGroupPlacementWrapper] = []
    var storage: [HashableCommandGroupPlacementWrapper: CommandAccumulator] = [:]
    var flags: Set<CommandFlag> = []
    
    func mainMenuItems(env: EnvironmentValues) -> [MainMenuItem] {
        /*
         self -> x20
         env -> x0 -> x29 - 0x110
         */
        // <+692>
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

struct MainMenuItem {
    // TODO
}
