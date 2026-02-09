internal import MySwiftUICore

class ModernNavigationBridge {
    private var seedTracker: VersionSeedTracker<UpdateViewDestinationRequest.VersionSeedTrackerSwiftKey>
    
    init(seedTracker: VersionSeedTracker<UpdateViewDestinationRequest.VersionSeedTrackerSwiftKey>) {
        self.seedTracker = seedTracker
    }
    
    final func preferencesDidChange(_ preferences: PreferenceValues) {
        /*
         self -> x23 -> x20
         preferences -> x0 -> sp + 0x398
         */
        // <+544>
        fatalError("TODO")
    }
    
    // TODO
}
