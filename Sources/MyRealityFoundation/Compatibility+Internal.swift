#if RealityKitCompatibility
internal import CoreRE

extension CoreRE::EventBus : RealityKitCompatibility {
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
}

extension CoreRE::ECSService : RealityKitCompatibility {
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
}

#endif
