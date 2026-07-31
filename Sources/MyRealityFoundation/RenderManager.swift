internal import Metal
internal import QuartzCore
internal import simd
private import CoreRE

final class RERenderManager {
    private var _renderManager: OpaquePointer
    
    @inline(__always) // 원래 없음
    init(manager: OpaquePointer) {
        unsafe self._renderManager = unsafe manager
    }
    
    var __coreRenderManager: OpaquePointer {
        return unsafe self._renderManager
    }
    
    var device: any MTLDevice {
        assertUnimplemented()
    }
    
    var commandQueue: (any MTLCommandQueue)? {
        assertUnimplemented()
    }
    
    func registerRenderLayer(_: CAMetalLayer) {
        assertUnimplemented()
    }
    
    func unregisterRenderLayer(_: UInt32) {
        assertUnimplemented()
    }
    
    func setLayerSize(_: UInt32, _: Float, _: Float) {
        assertUnimplemented()
    }
    
    func getLayerSize(_: UInt32) -> SIMD2<Float> {
        assertUnimplemented()
    }
    
    func createRenderFrameSettings() -> RERenderFrameSettings {
        assertUnimplemented()
    }
    
    func createRenderFrameWorkload() -> RERenderFrameWorkload {
        assertUnimplemented()
    }
    
    func waitUntilScheduled() {
        unsafe unsafeBitCast(self._renderManager, to: CoreRE::RenderManager.self)
            .waitUntilScheduled()
    }
}

extension RERenderManager : __RenderService {
}

final class RERenderFrameSettings {
    // TODO
}

final class RERenderFrameWorkload {
    // TODO
}
