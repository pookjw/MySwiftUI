internal import MySwiftUICore

struct RemoteScenes {
    
}

extension RemoteScenes {
    final class SessionController {
        // TODO
    }
    
    @MainActor
    class Bridge {
        // TODO
    }
    
    class SessionInfo {
        // TODO
    }
}

extension EnvironmentValues {
    var remoteSessionController: RemoteScenes.SessionController? {
        get {
            return self[__Key_remoteSessionController.self]
        }
        set {
            self[__Key_remoteSessionController.self] = newValue
        }
    }
    
    // TODO: Entry Macro
    fileprivate struct __Key_remoteSessionController: EnvironmentKey {
        static var defaultValue: RemoteScenes.SessionController? {
            return nil
        }
    }
}
