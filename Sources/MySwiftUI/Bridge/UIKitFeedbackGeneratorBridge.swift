#warning("TODO")
@_spi(Internal) internal import MySwiftUICore
private import RealityKit

class UIKitFeedbackGeneratorBridge<Content: View> {
    weak var host: _UIHostingView<Content>? = nil
    private var hostingEntity: RealityKit.Entity? = nil
    private var activeEntities: [ViewIdentity : AudioFeedbackEntity] = [:]
    private var processedFeedbackSeeds: Set<FeedbackRequest.Seed> = []
    private var feedbackSeed = VersionSeed.empty
    
    func addPreferences(to viewGraph: ViewGraph) {
        viewGraph.addPreference(FeedbackRequest.PreferenceKey.self)
    }
    
    final func preferencesDidChange(_: PreferenceValues) {
        fatalError("TODO")
    }
}
