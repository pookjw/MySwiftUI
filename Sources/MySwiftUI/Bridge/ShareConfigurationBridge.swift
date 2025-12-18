internal import MySwiftUICore

class ShareConfigurationBridge {
    private weak var host: ViewRendererHost?
    var shareConfigurationSeed: VersionSeedTracker<AnyShareConfiguration.Key>
    
    init() {
        fatalError("TODO")
    }
    
    final func shareConfigurationDidChange(_: AnyShareConfiguration?) {
        fatalError("TODO")
    }
}
