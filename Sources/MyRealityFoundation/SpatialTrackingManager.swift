internal import RealityFusion
internal import simd

package class SpatialTrackingManager {
    package nonisolated(unsafe) static var shared: SpatialTrackingManager?
    
    var configurationIsOutdated: Bool
    var rfConfigureCallback: (() -> Void)?
    private let rfServiceManager: RealityFusion::ServiceManager
    var currentAnchorCapabilities: Set<SpatialTrackingSession.Configuration.AnchorCapability>
    private var currentConfiguration: SpatialTrackingSession.Configuration?
    let arkitRunnable: any ARKitRunnable
    var isRunningUserSession: Bool
    
    init(serviceManager: RealityFusion::ServiceManager, arkitRunnable: any ARKitRunnable) {
        assertUnimplemented()
    }
    
    func run(spatialTrackingConfiguration: SpatialTrackingSession.Configuration) async -> SpatialTrackingSession.UnavailableCapabilities? {
        assertUnimplemented()
    }
    
    func stop() async {
        assertUnimplemented()
    }
    
    final func setTransformResolver(sceneTransformResolver: @MainActor @Sendable (OpaquePointer) -> simd_float4x4) {
        assertUnimplemented()
    }
}
