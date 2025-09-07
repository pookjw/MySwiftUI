#warning("TODO")
internal import UIKit
internal import MySwiftUICore

class UIKitStatusBarBridge {
    private var statusBarHidden: Bool? = nil
    private var _shouldDeferToChildViewController: Bool? = nil
    private var seedTracker = VersionSeedSetTracker()
    weak var host: ViewRendererHost? = nil
    
    var shouldDeferToChildViewController: Bool {
        guard isLinkedOnOrAfter(.v7) else {
            return false
        }
        
        if let _shouldDeferToChildViewController {
            return _shouldDeferToChildViewController
        }
        
        if let value = host!.preferenceValue(HostingGestureOverlayAuthorityKey.self) {
            return value
        }
        
        return false
    }
    
    func addPreferences(to viewGraph: ViewGraph) {
        viewGraph.addPrefence(StatusBarKey.self)
        seedTracker.addPreference(StatusBarKey.self)
        
        if !isLinkedOnOrAfter(.v7) {
            seedTracker.addPreference(HostingGestureOverlayAuthorityKey.self)
        }
        
        seedTracker.updateSeedsToEmpty()
    }
    
    func preferencesDidChange(_ preferenceValues: PreferenceValues) {
        fatalError("TODO")
    }
    
    func updateStatusBar(isAnimated: Bool, shouldDefer: Bool) {
        fatalError("TODO")
    }
}
