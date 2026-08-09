#if RealityKitCompataibility
package import CoreRE
package import RealityKit
private import ObjectiveC
private import _RealityFoundationPrivate

fileprivate nonisolated(unsafe) var key: UInt8 = 0

package protocol RealityKitCompataibility {
    associatedtype RealityKitType : AnyObject
    associatedtype MyRealityKitType : AnyObject
    
    var _swiftObject: UnsafeMutableRawPointer? { get nonmutating set }
    @MainActor @preconcurrency func _createRealityKitRef() -> RealityKitType?
    
    @MainActor @preconcurrency var realityKitRef: RealityKitType { get nonmutating set }
    @MainActor @preconcurrency var myRealityKitRef: MyRealityKitType? { get nonmutating set }
}

extension RealityKitCompataibility {
    @MainActor @preconcurrency package var realityKitRef: RealityKitType {
        get {
            if let swiftObject = unsafe self._swiftObject {
                let object = unsafe unsafeBitCast(swiftObject, to: AnyObject.self)
                
                if let realityKitRef = object as? RealityKitType {
                    return realityKitRef
                } else if let myRealityKitRef = object as? MyRealityKitType {
                    let value = self._createRealityKitRef()!
                    unsafe objc_setAssociatedObject(value, &key, myRealityKitRef, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                    unsafe self._swiftObject = Unmanaged.passUnretained(value).toOpaque()
                    return value
                } else {
                    let value = self._createRealityKitRef()!
                    unsafe self._swiftObject = Unmanaged.passUnretained(value).toOpaque()
                    return value
                }
            } else {
                let value = self._createRealityKitRef()!
                unsafe self._swiftObject = Unmanaged.passUnretained(value).toOpaque()
                return value
            }
        }
        nonmutating set {
            if let swiftObject = unsafe self._swiftObject {
                let object = unsafe unsafeBitCast(swiftObject, to: AnyObject.self)
                
                if let realityKitRef = object as? RealityKitType {
                    let myRealityKitRef = unsafe objc_getAssociatedObject(realityKitRef, &key) as? MyRealityKitType
                    unsafe objc_setAssociatedObject(realityKitRef, &key, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                    
                    unsafe objc_setAssociatedObject(newValue, &key, myRealityKitRef, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                    unsafe self._swiftObject = Unmanaged.passUnretained(newValue).toOpaque()
                } else if let myRealityKitRef = object as? MyRealityKitType {
                    unsafe objc_setAssociatedObject(newValue, &key, myRealityKitRef, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                    unsafe self._swiftObject = Unmanaged.passUnretained(newValue).toOpaque()
                } else {
                    fatalError("Unexpected")
                }
            } else {
                unsafe self._swiftObject = Unmanaged.passUnretained(newValue).toOpaque()
            }
        }
    }
    
    @MainActor @preconcurrency package var myRealityKitRef: MyRealityKitType? {
        get {
            if let swiftObject = unsafe self._swiftObject {
                let object = unsafe unsafeBitCast(swiftObject, to: AnyObject.self)
                
                if let realityKitRef = object as? RealityKitType {
                    let value = unsafe objc_getAssociatedObject(realityKitRef, &key)
                    
                    if let value = value as? MyRealityKitType {
                        return value
                    } else {
                        return nil
                    }
                } else if let myRealityKitRef = object as? MyRealityKitType {
                    return myRealityKitRef
                } else {
                    return nil
                }
            } else {
                return nil
            }
        }
        nonmutating set {
            if let swiftObject = unsafe self._swiftObject {
                let object = unsafe unsafeBitCast(swiftObject, to: AnyObject.self)
                
                if let realityKitRef = object as? RealityKitType {
                    unsafe objc_setAssociatedObject(realityKitRef, &key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                } else {
                    if let newValue {
                        unsafe self._swiftObject = Unmanaged.passUnretained(newValue).toOpaque()
                    } else {
                        unsafe self._swiftObject = nil
                    }
                }
            } else {
                if let newValue {
                    unsafe self._swiftObject = Unmanaged.passUnretained(newValue).toOpaque()
                } else {
                    unsafe self._swiftObject = nil
                }
            }
        }
    }
    
    @_spi(Testing) @MainActor @preconcurrency public var _realityKitRef: RealityKitType? {
        if let swiftObject = unsafe self._swiftObject {
            let object = unsafe unsafeBitCast(swiftObject, to: AnyObject.self)
            return object as? RealityKitType
        } else {
            return nil
        }
    }
}

extension CoreRE::Scene : RealityKitCompataibility {
    package typealias RealityKitType = RealityKit::Scene
    package typealias MyRealityKitType = MyRealityFoundation::Scene
    
    package var _swiftObject: UnsafeMutableRawPointer? {
        get {
            return unsafe self.swiftObject
        }
        nonmutating set {
            unsafe self.swiftObject = newValue
        }
    }
    
    @MainActor @preconcurrency package func _createRealityKitRef() -> RealityKit::Scene? {
        return unsafe RealityKit::Scene.__fromCore(
            unsafeBitCast(self, to: RealityKit::__SceneRef.self)
        )
    }
}

extension CoreRE::Entity : RealityKitCompataibility {
    package typealias RealityKitType = RealityKit::Entity
    package typealias MyRealityKitType = MyRealityFoundation::Entity
    
    package var _swiftObject: UnsafeMutableRawPointer? {
        get {
            return unsafe self.swiftObject
        }
        nonmutating set {
            unsafe self.swiftObject = newValue
        }
    }
    
    @MainActor @preconcurrency package func _createRealityKitRef() -> RealityKit::Entity? {
        return unsafe RealityKit::Entity(
            _coreEntity: unsafeBitCast(self, to: RealityKit::__EntityRef.self)
        )
    }
}

extension CoreRE::Engine : RealityKitCompataibility {
    package typealias RealityKitType = RealityKit::__Engine
    package typealias MyRealityKitType = MyRealityFoundation::__Engine
    
    package var _swiftObject: UnsafeMutableRawPointer? {
        get {
            return unsafe self.swiftObject
        }
        nonmutating set {
            unsafe self.swiftObject = newValue
        }
    }
    
    @MainActor @preconcurrency package func _createRealityKitRef() -> RealityKit::__Engine? {
        return unsafe RealityKit::__Engine.__fromCore(
            unsafeBitCast(self, to: RealityKit::__EngineRef.self)
        )
    }
}

extension CoreRE::ServiceLocator : RealityKitCompataibility {
    package typealias RealityKitType = RealityKit::__ServiceLocator
    package typealias MyRealityKitType = MyRealityFoundation::__ServiceLocator
    
    package var _swiftObject: UnsafeMutableRawPointer? {
        get {
            return unsafe self.swiftObject
        }
        nonmutating set {
            unsafe self.swiftObject = newValue
        }
    }
    
    @MainActor @preconcurrency package func _createRealityKitRef() -> RealityKit::__ServiceLocator? {
        return nil
    }
}

#endif
