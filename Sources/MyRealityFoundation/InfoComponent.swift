// 3EFA80965656F6F81A2234FCA75D4466
private import Foundation
private import CoreRE
private import _DarwinFoundation2._string

@safe struct __EntityInfoComponent : MyRealityFoundation::Component, Codable, DisableRESync {
    private var rawData: UnsafeMutableRawPointer?
    private var cleanupHelper: IntrospectionDataCleanupHelper?
    
    init(entity: MyRealityFoundation::Entity) {
        let className = NSStringFromClass(type(of: entity))
        var array: [UInt8] = []
        array.append(0xd)
        array.append(contentsOf: className.utf8)
        array.append(0x0)
        
        let rawData = RECIntrospectionAlloc(UInt32(truncatingIfNeeded: array.count))
        array.withUnsafeBufferPointer { pointer in
            _ = unsafe memmove(rawData, pointer.baseAddress.unsafelyUnwrapped, pointer.count)
        }
        
        self.rawData = rawData
        self.cleanupHelper = IntrospectionDataCleanupHelper(rawData: rawData)
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
        return __ComponentTypeRef(core: .info)
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
    
    deinit {
        RECIntrospectionFree(self.rawData)
    }
}
