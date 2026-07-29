#if RealityKitCompataibility
package import CoreRE
private import RealityKit
private import ObjectiveC

extension CoreRE::Scene {
    @MainActor @preconcurrency package var bridgedScene: MyRealityFoundation::Scene? {
        get {
            if let swiftObject = unsafe self.swiftObject {
                let object = unsafe unsafeBitCast(swiftObject, to: AnyObject.self)
                
                if let nativeObject = object as? RealityKit::Scene {
                    if let implObject = unsafe objc_getAssociatedObject(nativeObject, &key) as? MyRealityFoundation::Scene {
                        return implObject
                    } else {
                        let ref = unsafe nativeObject.__coreScene.__as(OpaquePointer.self)
                        let implObject = unsafe MyRealityFoundation::Scene(coreScene: ref)
                        // init(coreScene:)에서 setter를 호출해줄 것
//                        unsafe objc_setAssociatedObject(nativeObject, &key, implObject, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                        return implObject
                    }
                } else if let implObject = object as? MyRealityFoundation::Scene {
                    return implObject
                } else {
                    return nil
                }
            } else {
                return nil
            }
        }
        nonmutating set {
            if let swiftObject = unsafe self.swiftObject {
                let object = unsafe unsafeBitCast(swiftObject, to: AnyObject.self)
                
                if let nativeObject = object as? RealityKit::Scene {
                    unsafe objc_setAssociatedObject(nativeObject, &key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                } else {
                    if let newValue {
                        unsafe self.swiftObject = Unmanaged.passUnretained(newValue).toOpaque()
                    } else {
                        unsafe self.swiftObject = nil
                    }
                }
            } else {
                if let newValue {
                    unsafe self.swiftObject = Unmanaged.passUnretained(newValue).toOpaque()
                } else {
                    unsafe self.swiftObject = nil
                }
            }
        }
    }
}

fileprivate nonisolated(unsafe) var key: UInt8 = 0

#endif
