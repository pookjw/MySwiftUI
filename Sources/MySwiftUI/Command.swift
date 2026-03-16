// 8CA450E42E2AFC68A9A1CEB51C79EBE5
internal import MySwiftUICore

struct CommandFlag: Hashable, Sendable {
    fileprivate static nonisolated(unsafe) var nextID = 0
    
    @_transparent fileprivate static func getID() -> Int {
        let id = unsafe nextID
        unsafe nextID = id &+ 1
        return id
    }
    
    static let textEditing = CommandFlag(id: CommandFlag.getID())
    static let textFormatting = CommandFlag(id: CommandFlag.getID())
    static let toolbar = CommandFlag(id: CommandFlag.getID())
    static let sidebar = CommandFlag(id: CommandFlag.getID())
    static let printing = CommandFlag(id: CommandFlag.getID())
    
    private let id: Int
}

struct CommandsList: Hashable {
    static func == (lhs: CommandsList, rhs: CommandsList) -> Bool {
        assertUnimplemented()
    }
    
    var items: [CommandsList.Item] = []
    
    var version: DisplayList.Version {
        var result = DisplayList.Version()
        
        if !items.isEmpty {
            assertUnimplemented()
        }
        
        return result
    }
    
    func resolveOperations(into commands: inout _ResolvedCommands) {
        guard !items.isEmpty else {
            return
        }
        
        assertUnimplemented()
    }
    
    func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
}

extension CommandsList {
    struct Key: PreferenceKey {
        static var defaultValue: CommandsList {
            return CommandsList()
        }
        
        static func reduce(value: inout CommandsList, nextValue: () -> CommandsList) {
            assertUnimplemented()
        }
    }
    
    struct Item {
        private var value: CommandsList.Item.Value
        private var version: DisplayList.Version
    }
}

extension CommandsList.Item {
    enum Value {
        case operation(CommandOperation)
        case flag(CommandFlag)
    }
}
