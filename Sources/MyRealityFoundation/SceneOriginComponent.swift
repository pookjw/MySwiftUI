// 26648CD2CA3ECBBEA91C492555385A6A
private import CoreRE

struct SceneOriginComponent : Component, Codable {
    @_spi(Internal) public static var componentName: String {
        return String(reflecting: self)
    }
    
    @_spi(Internal) public static func __load(from ref: UnsafeRawPointer) {
        assertUnimplemented()
    }
    
    @_spi(Internal) public static func __store(attribute: any MyRealityFoundation::Component, to ref: UnsafeMutableRawPointer, offset: Int, deinitialize: Bool) {
        assertUnimplemented()
    }
    
    @_spi(Internal) public static func __store(attribute: any MyRealityFoundation::Component, to ref: UnsafeMutableRawPointer, offset: Int) {
        assertUnimplemented()
    }
    
    static func __free(to buffer: UnsafeMutableRawPointer, offset: Int) {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor static func __fromCore(_ coreComponent: __ComponentRef) -> Self {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
    
    @_spi(Internal) public static var __coreComponentType: __ComponentTypeRef {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor static func __addIntrospectionData(_ builder: OpaquePointer?) {
    }
    
    @_spi(Internal) public static func __load(from ref: UnsafeRawPointer, offset: Int) -> any MyRealityFoundation::Component {
        assertUnimplemented()
    }
    
    @_spi(Internal) public static var coreComponentType: CoreComponentType {
        return CoreComponentType(originType: .custom)
    }
    
}

extension SceneOriginComponent {
    fileprivate enum CodingKeys : CodingKey, CustomDebugStringConvertible, CustomStringConvertible {
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Entity {
    @MainActor @preconcurrency public static func __fromCore(_ coreEntity: __EntityRef) -> Entity {
        let core = unsafe unsafeBitCast(coreEntity.core, to: CoreRE::Entity.self)
        
        if let swiftObject = unsafe core.swiftObject {
            return unsafe unsafeBitCast(swiftObject, to: AnyObject.self) as! MyRealityFoundation::Entity
        } else {
            assert(!core.isBeingDestroyed)
            
            if let infoType = unsafe MyRealityFoundation::Entity.entityInfoType(coreEntity.core) {
                let result = infoType.init()
                unsafe unsafeBitCast(result.coreEntity, to: CoreRE::Entity.self)
                    .swiftObject = nil
                unsafe result.coreEntity = unsafeBitCast(core, to: OpaquePointer.self)
                unsafe core.swiftObject = Unmanaged.passUnretained(result).toOpaque()
                return result
            } else {
                return unsafe makeEntity(for: coreEntity.core)
            }
        }
    }
    
    fileprivate static func entityInfoType(_: OpaquePointer) -> MyRealityFoundation::Entity.Type? {
        assertUnimplemented()
    }
}

fileprivate func makeEntity(for core: OpaquePointer) -> MyRealityFoundation::Entity {
    assertUnimplemented()
}
