internal import MySwiftUICore

class ShareConfigurationBridge {
    weak var host: ViewRendererHost? = nil
    var shareConfigurationSeed = VersionSeedTracker<AnyShareConfiguration.Key>(seed: .invalid)
    
    init() {
    }
    
    final func shareConfigurationDidChange(_: AnyShareConfiguration?) {
        fatalError("TODO")
    }
}
