#warning("TODO")
private import MySwiftUICore

struct SceneList {
    private var items: [SceneList.Item]
    private var environment: EnvironmentValues
}

extension SceneList {
    struct Item {
        // TODO
    }
    
    enum Namespace {
        case string(String)
        case host(ObjectIdentifier)
        case app
    }
}
