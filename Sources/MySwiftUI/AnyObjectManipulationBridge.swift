private import MySwiftUICore

class AnyObjectManipulationBridge {
    
}

final class ObjectManipulationBridgeWrapper {
    private var bridge: AnyObjectManipulationBridge
    
    init(bridge: AnyObjectManipulationBridge) {
        self.bridge = bridge
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
    fileprivate struct __Key_objectManipulationBridge: EnvironmentKey {
        static var defaultValue: ObjectManipulationBridgeWrapper? {
            return nil
        }
    }
}
