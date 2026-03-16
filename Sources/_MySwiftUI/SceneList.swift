private import MySwiftUICore

struct SceneList {
    private(set) var items: [SceneList.Item] = []
    private(set) var environment = EnvironmentValues()
}

extension SceneList {
    struct Item {
        // TODO
    }
    
    enum Namespace: Hashable, CustomStringConvertible {
        case string(String)
        case host(ObjectIdentifier)
        case app
        
        var description: String {
            assertUnimplemented()
        }
    }
}

extension SceneList.Item {
    struct Summary/*: Identifiable*/ {
        // TODO
    }
}
