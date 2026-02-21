// 9FD3F6427190D2BCAE3F219DB2F3E9C7
internal import MySwiftUICore

@MainActor final class ShareConfigurationBridge {
    weak var host: ViewRendererHost? = nil
    var shareConfigurationSeed = VersionSeedTracker<AnyShareConfiguration.Key>(seed: .invalid)
    
    init() {
    }
    
    @inline(__always)
    func preferencesDidChange(_ preferenceValues: PreferenceValues) {
        // x26
        let pref = preferenceValues[AnyShareConfiguration.Key.self]
        
        if !shareConfigurationSeed.seed.matches(pref.seed) {
            shareConfigurationSeed.seed = pref.seed
            shareConfigurationDidChange(pref.value)
        }
    }
    
    fileprivate func shareConfigurationDidChange(_ configuration: AnyShareConfiguration?) {
        /*
         self -> x20
         configuration -> x0 -> x22 -> x28/x24/x26/x19 + 0x28/w25/x27
         */
        // <+92>
        // x21
        guard let host else {
            return
        }
        
        guard let configuration else {
            // <+136>
            if let uiViewController = host.uiViewController {
                uiViewController.activityItemsConfiguration = nil
            }
            
            return
        }
        
        // <+236>
        fatalError("TODO")
    }
}
