internal import MySwiftUICore

class ModernNavigationBridge {
    private var seedTracker: VersionSeedTracker<UpdateViewDestinationRequest.UpdateViewDestinationRequestKey> // 0x290
    
    init(seedTracker: VersionSeedTracker<UpdateViewDestinationRequest.UpdateViewDestinationRequestKey>) {
        self.seedTracker = seedTracker
    }
    
    final func preferencesDidChange(_ preferences: PreferenceValues) {
        /*
         self -> x23 -> x20
         preferences -> x0 -> sp + 0x398
         */
        // <+544>
        // inlined
        seedTracker.didChange(preferences) { value in
            // <+680>
            for (key, value) in value {
                fatalError("TODO")
            }
        }
    }
    
    // TODO
}
