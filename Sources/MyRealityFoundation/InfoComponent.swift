// 3EFA80965656F6F81A2234FCA75D4466
private import Foundation

struct __EntityInfoComponent : MyRealityFoundation::Component, Codable, DisableRESync {
    private var rawData: UnsafeMutableRawPointer?
    private var cleanupHelper: IntrospectionDataCleanupHelper?
    
    init(entity: MyRealityFoundation::Entity) {
//        var className = NSStringFromClass(type(of: entity))
//        var array: [String] = []
//        className.append(className)
        assertUnimplemented()
    }
    
    init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
    
    func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }

    @_spi(Internal) public static var componentName: String {
        get {
            assertUnimplemented()
        }
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

    @_spi(Internal) public static var __coreComponentType: __ComponentTypeRef {
        assertUnimplemented()
    }

    @_spi(Internal) public static func __load(from ref: UnsafeRawPointer, offset: Int) -> any MyRealityFoundation.Component {
        assertUnimplemented()
    }
}

final class IntrospectionDataCleanupHelper {
    private var rawData: UnsafeMutableRawPointer
    
    fileprivate init(rawData: UnsafeMutableRawPointer) {
        self.rawData = rawData
    }
}
