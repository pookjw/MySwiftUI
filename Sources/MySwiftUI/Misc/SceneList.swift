private import MySwiftUICore

struct SceneList {
    private var items: [SceneList.Item]
    private var environment: EnvironmentValues
}

extension SceneList {
    struct Item {
        // TODO
    }
    
    enum Namespace: Hashable {
        case string(String)
        case host(ObjectIdentifier)
        case app
    }
}

extension SceneList.Item {
    struct Summary/*: Identifiable*/ {
        // TODO
    }
}
