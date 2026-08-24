// 0D3BE02F4AF57609AEA97386E6751B11
internal import RealityFusion

class RealityFusionSession {
    var serviceManager: RealityFusion::ServiceManager?
    var sharedCount: Int {
        didSet {
            assertUnimplemented()
        }
    }
    
    static func createRealityFusionSession() -> RealityFusionSession? {
        assertUnimplemented()
    }
    
    static nonisolated(unsafe) var sharedSession: RealityFusionSession?
    
    init(_: __ServiceLocator) {
        assertUnimplemented()
    }
    
    static func destroyRealityFusionSession() {
        assertUnimplemented()
    }
}
