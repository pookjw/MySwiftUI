#if RealityKitCompatibility
internal import CoreRE

extension CoreRE::EventBus : _RealityKitCompatibility {
    typealias RealityKitType = AnyObject
    typealias MyRealityKitType = MyRealityFoundation::REEventBus
    
    var _swiftObject: UnsafeMutableRawPointer? {
        get {
            return unsafe self.swiftObject
        }
        nonmutating set {
            unsafe self.swiftObject = newValue
        }
    }
    
    @MainActor @preconcurrency func _createRealityKitRef() -> AnyObject? {
        return nil
    }
    
    var _createRealityKitRefAutomatically: Bool {
        return false
    }
}

extension CoreRE::ECSManager : _RealityKitCompatibility {
    typealias RealityKitType = AnyObject
    typealias MyRealityKitType = MyRealityFoundation::SceneManager
    
    var _swiftObject: UnsafeMutableRawPointer? {
        get {
            return unsafe self.swiftObject
        }
        nonmutating set {
            unsafe self.swiftObject = newValue
        }
    }
    
    @MainActor @preconcurrency func _createRealityKitRef() -> AnyObject? {
        return nil
    }
    
    var _createRealityKitRefAutomatically: Bool {
        return false
    }
}

#endif
