internal import Metal
struct RKARSegmentationComponent : Component {
    var segmentationBuffer: MTLTexture?
    
    var estimatedDepthData: MTLTexture?
    
    var cameraTextureY: MTLTexture?
    
    var cameraTextureCbCr: MTLTexture?
    
    init() {
        assertUnimplemented()
    }
    
    init(segmentationBuffer: MTLTexture?, estimatedDepthData: MTLTexture?, cameraTextureY: MTLTexture?, cameraTextureCbCr: MTLTexture?) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency static func __fromCore(_ coreComponent: __ComponentRef) -> RKARSegmentationComponent {
        assertUnimplemented()
    }

    @MainActor @preconcurrency func __toCore(_ coreComponent: __ComponentRef) {
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

    @_spi(Internal) public static func __load(from ref: UnsafeRawPointer, offset: Int) -> any MyRealityFoundation::Component {
        assertUnimplemented()
    }

    @_spi(Internal) public static var coreComponentType: CoreComponentType {
        assertUnimplemented()
    }
}

extension RKARSegmentationComponent : DefaultInitializable {}
