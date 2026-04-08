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
    
    struct UpdateCoder: Encodable, Decodable {
        let updates: [any RemoteScenes.Update]
        
        init(from decoder: any Decoder) throws {
            assertUnimplemented()
        }
        
        func encode(to encoder: any Encoder) throws {
            assertUnimplemented()
        }
    }
    
    protocol Update: Encodable, Decodable {
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
    fileprivate struct __Key_remoteSessionController : EnvironmentKey {
        static var defaultValue: RemoteScenes.SessionController? {
            return nil
        }
    }
}

enum ImmersiveSpaceClientOptionsUpdate {
    struct V1: CustomStringConvertible, Decodable, Encodable {
        var description: String {
            assertUnimplemented()
        }
        
        func convertedToPrimary() -> ImmersiveSpaceConfigurationAttributes.ClientOptions {
            assertUnimplemented()
        }
        
        // TODO
    }
}
