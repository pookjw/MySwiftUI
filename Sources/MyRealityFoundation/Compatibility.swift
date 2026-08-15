#if RealityKitCompatibility
package import CoreRE
package import RealityKit
private import ObjectiveC
private import _RealityFoundationPrivate

fileprivate nonisolated(unsafe) var key: UInt8 = 0

package protocol RealityKitCompatibility {
    associatedtype RealityKitType : AnyObject
    associatedtype MyRealityKitType : AnyObject
    
    var _swiftObject: UnsafeMutableRawPointer? { get nonmutating set }
    @MainActor @preconcurrency func _createRealityKitRef() -> RealityKitType?
    var _ref: AnyObject { get }
    
    @MainActor @preconcurrency var realityKitRef: RealityKitType { get nonmutating set }
    @MainActor @preconcurrency var myRealityKitRef: MyRealityKitType? { get nonmutating set }
}

extension RealityKitCompatibility {
    @MainActor @preconcurrency package var realityKitRef: RealityKitType {
        get {
            if let swiftObject = unsafe self._swiftObject {
                let object = unsafe unsafeBitCast(swiftObject, to: AnyObject.self)
                
                if let realityKitRef = object as? RealityKitType {
                    return realityKitRef
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
            unsafe self._swiftObject = Unmanaged.passUnretained(newValue).toOpaque()
        }
    }
    
    @MainActor @preconcurrency package var myRealityKitRef: MyRealityKitType? {
        get {
            let value = unsafe objc_getAssociatedObject(self._ref, &key)
            return value as? MyRealityKitType
        }
        nonmutating set {
            if let newValue {
                unsafe objc_setAssociatedObject(newValue, &key, self.realityKitRef, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
            
            unsafe objc_setAssociatedObject(self._ref, &key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    package var _ref: AnyObject {
        return unsafe unsafeBitCast(
            unsafeBitCast(self, to: UnsafeRawPointer.self)
                .advanced(by: 0x8),
            to: AnyObject.self
        )
    }
}

extension CoreRE::Scene : RealityKitCompatibility {
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

extension CoreRE::Entity : RealityKitCompatibility {
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

extension CoreRE::Engine : RealityKitCompatibility {
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

extension CoreRE::ServiceLocator : RealityKitCompatibility {
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
    
    package var _ref: AnyObject {
        let ref = unsafe unsafeBitCast(self, to: UnsafeRawPointer.self)
            .advanced(by: 0x8)
            .assumingMemoryBound(to: AnyObject?.self)
            .pointee
        
        return ref!
    }
}

extension CoreRE::Asset : RealityKitCompatibility {
    package typealias RealityKitType = RealityKit::MeshResource
    package typealias MyRealityKitType = MyRealityFoundation::MeshResource
    
    package var _swiftObject: UnsafeMutableRawPointer? {
        get {
            return unsafe self.swiftObject
        }
        nonmutating set {
            unsafe self.swiftObject = newValue
        }
    }
    
    @MainActor @preconcurrency package func _createRealityKitRef() -> RealityKit::MeshResource? {
        return unsafe RealityKit::MeshResource(unsafeBitCast(self, to: OpaquePointer.self))
    }
}

#endif
