@preconcurrency @MainActor public protocol Scene {
    // TODO
}

extension Never: Scene {}

enum SceneID: Hashable {
    static func == (lhs: SceneID, rhs: SceneID) -> Bool {
        fatalError("TODO")
    }
    
    func hash(into hasher: inout Hasher) {
        fatalError("TODO")
    }
    
    case string(String)
    case type(Any.Type, UInt8)
}
