internal import Foundation
internal import Metal
internal import simd
@available(macOS 26.0, iOS 26.0, visionOS 26.0, tvOS 26.0, macCatalyst 26.0, *)
public struct MeshInstancesComponent : Component {
    public struct Part {
        public var data: LowLevelInstanceData
        
        public var bounds: BoundingBox?
        
        public init(data: LowLevelInstanceData, bounds: BoundingBox? = nil) {
            assertUnimplemented()
        }
    }
    
    static func isAboveLimits(meshComponent: OpaquePointer, meshInstancesComponent: OpaquePointer) -> Bool {
        assertUnimplemented()
    }
    
    public init() {
        assertUnimplemented()
    }
    
    public init(mesh: MeshResource, modelID: String? = nil, instances: LowLevelInstanceData, bounds: BoundingBox? = nil) throws {
        assertUnimplemented()
    }
    
    public subscript(partIndex partIndex: Int) -> MeshInstancesComponent.Part? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @preconcurrency @MainActor public static func __fromCore(_ coreComponent: __ComponentRef) -> MeshInstancesComponent {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public func __toCore(_ coreComponent: __ComponentRef) {
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
        get {
            assertUnimplemented()
        }
    }

    @_spi(Internal) public static func __load(from ref: UnsafeRawPointer, offset: Int) -> any MyRealityFoundation::Component {
        assertUnimplemented()
    }

    @_spi(Internal) public static var coreComponentType: CoreComponentType {
        assertUnimplemented()
    }
}

enum MeshInstancesComponentError : LocalizedError, Equatable, Hashable {
    case undefinedModel
    case modelNameNotFound
    case meshResourceError
}

@_hasMissingDesignatedInitializers internal final class _proto_LowLevelInstanceData {
    var buffer: LowLevelBuffer
    
    convenience init(instanceCount: Int) throws {
        assertUnimplemented()
    }
    
    init(instanceCount: Int, instanceCapacity: Int) throws {
        assertUnimplemented()
    }
    
    init(buffer: LowLevelBuffer) {
        assertUnimplemented()
    }
    
    var instanceCount: Int {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    var instanceCapacity: Int {
        get {
            assertUnimplemented()
        }
    }
    
    func read(using commandBuffer: MTLCommandBuffer) -> MTLBuffer {
        assertUnimplemented()
    }
    
    func replace(using commandBuffer: MTLCommandBuffer) -> MTLBuffer {
        assertUnimplemented()
    }
    
    func replaceMutableTransforms(_ body: (UnsafeMutableBufferPointer<simd_float4x4>) -> ()) {
        assertUnimplemented()
    }
    
    func withMutableTransforms(_ body: (UnsafeMutableBufferPointer<simd_float4x4>) -> ()) {
        assertUnimplemented()
    }
    
    func withTransforms(_ body: (UnsafeBufferPointer<simd_float4x4>) -> ()) {
        assertUnimplemented()
    }
}

internal struct _proto_MeshInstancesComponent : Component {
    private var instanceDataByPartIndex: [_proto_LowLevelInstanceData?]
    
    subscript(partIndex partIndex: Int) -> _proto_LowLevelInstanceData? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    init() {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency static func __fromCore(_ coreComponent: __ComponentRef) -> _proto_MeshInstancesComponent {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
    
    @_spi(Internal) public static var __coreComponentType: __ComponentTypeRef {
        get {
            assertUnimplemented()
        }
    }
}
