internal import RealityFusion

protocol ARKitRunnable {
    func configure(withRFServiceManager: RealityFusion::ServiceManager, onReferencesChanged: () -> Void)
    func getSupportedCapabilities(for configuration: SpatialTrackingSession.Configuration) -> SpatialTrackingSession.Configuration
    func runARKitSession(withSupportedCapabilities configuration: SpatialTrackingSession.Configuration) async -> SpatialTrackingSession.UnavailableCapabilities?
    func runARKitSessionWithoutRequesting(withSupportedCapabilities configuration: SpatialTrackingSession.Configuration)
    func stop() async
}
