internal import MySwiftUICore

struct RemoteScenes {
    
}

extension RemoteScenes {
    class SessionController {
        
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
    
    #warning("TODO: Entry Macro")
    fileprivate struct __Key_remoteSessionController: EnvironmentKey {
        static var defaultValue: RemoteScenes.SessionController? {
            return nil
        }
    }
}
