#if RealityKitCompataibility
internal import CoreRE

extension CoreRE::EventBus : RealityKitCompataibility {
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

extension CoreRE::ECSService : RealityKitCompataibility {
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
