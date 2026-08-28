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
        
        let rawData = unsafe RECIntrospectionAlloc(UInt32(Int32(array.count)))
        array.withUnsafeBufferPointer { pointer in
            _ = unsafe memmove(rawData, pointer.baseAddress.unsafelyUnwrapped, pointer.count)
        }
        
        unsafe self.rawData = rawData
        unsafe self.cleanupHelper = IntrospectionDataCleanupHelper(rawData: rawData)
    }
    
    init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
    
    func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    static var __typeName: String {
//        return "RealityKit.__EntityInfoComponent"
        return "MyRealityKit.__EntityInfoComponent"
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
        /*
         attribute -> x0
         ref -> x1
         offset -> x2
         deinitialize -> w3
         */
        if deinitialize {
            unsafe ref
                .assumingMemoryBound(to: __EntityInfoComponent.self)
                .deinitialize(count: 1)
        }
        
        unsafe ref
            .assumingMemoryBound(to: __EntityInfoComponent.self)
            .initialize(to: attribute as! __EntityInfoComponent)
    }

    @_spi(Internal) public static func __store(attribute: any MyRealityFoundation::Component, to ref: UnsafeMutableRawPointer, offset: Int) {
        assertUnimplemented()
    }

    static func __free(to buffer: UnsafeMutableRawPointer, offset: Int) {
        assertUnimplemented()
    }
    
    static func __addIntrospectionData(_ builder: OpaquePointer?) {
        guard let builder = unsafe builder else {
            return
        }
        
        let casted = unsafe unsafeBitCast(builder, to: CoreRE::StructBuilder.self)
        unsafe casted.addMemberDataTypeWithTag(1, "rawData", .unknown17, 0)
    }

    @_spi(Internal) public static func __load(from ref: UnsafeRawPointer, offset: Int) -> any MyRealityFoundation::Component {
        assertUnimplemented()
    }

    @_spi(Internal) public static var coreComponentType: CoreComponentType {
        return CoreComponentType(originType: .custom)
    }
}

@unsafe final class IntrospectionDataCleanupHelper {
    private var rawData: UnsafeMutableRawPointer
    
    fileprivate init(rawData: UnsafeMutableRawPointer) {
        unsafe self.rawData = rawData
    }
    
    deinit {
        unsafe RECIntrospectionFree(self.rawData)
    }
}
