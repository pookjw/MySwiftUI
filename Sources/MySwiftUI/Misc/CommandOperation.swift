#warning("TODO")

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
    
}

extension _ResolvedCommands: Sendable {}
