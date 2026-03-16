@preconcurrency @MainActor public protocol Scene {
    // TODO
}

extension Never: Scene {}

/*
 0x0~0x18 (total 0x20)
 nil -> 모두 0x0
 */
enum SceneID: Hashable {
    static func == (lhs: SceneID, rhs: SceneID) -> Bool {
        assertUnimplemented()
    }
    
    func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    case string(String)
    case type(Any.Type, UInt8)
}
