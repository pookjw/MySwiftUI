private import MySwiftUICore

@MainActor
class AnyObjectManipulationBridge {
    
}

struct ObjectManipulationBridgeWrapper : Equatable {
    private var bridge: AnyObjectManipulationBridge
    
    init(bridge: AnyObjectManipulationBridge) {
        self.bridge = bridge
    }
    
    static func == (lhs: ObjectManipulationBridgeWrapper, rhs: ObjectManipulationBridgeWrapper) -> Bool {
        return lhs.bridge === rhs.bridge
    }
}

extension EnvironmentValues {
    var objectManipulationBridge: ObjectManipulationBridgeWrapper? {
        get {
            return self[__Key_objectManipulationBridge.self]
        }
        set {
            self[__Key_objectManipulationBridge.self] = newValue
        }
    }
    
    // TODO: Entry Macro
    fileprivate struct __Key_objectManipulationBridge : EnvironmentKey {
        static var defaultValue: ObjectManipulationBridgeWrapper? {
            return nil
        }
    }
}
