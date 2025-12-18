internal import UIKit
@_spi(Internal) internal import MySwiftUICore

final class UIKitStatusBarBridge {
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
        viewGraph.addPreference(StatusBarKey.self)
        seedTracker.addPreference(StatusBarKey.self)
        
        if !isLinkedOnOrAfter(.v7) {
            seedTracker.addPreference(HostingGestureOverlayAuthorityKey.self)
        }
        
        seedTracker.updateSeedsToEmpty()
    }
    
    func preferencesDidChange(_ preferenceValues: PreferenceValues) {
        if seedTracker.hasChanges(in: preferenceValues) {
            // <+232>
            // w26
            let statusBarValue = preferenceValues[StatusBarKey.self].value
            let isAnimated = (statusBarValue != nil)
            
            if !isLinkedOnOrAfter(.v7) {
                _shouldDeferToChildViewController = preferenceValues[HostingGestureOverlayAuthorityKey.self].value
            }
            // <+400>
            self.statusBarHidden = statusBarValue
            updateStatusBar(isAnimated: isAnimated, shouldDefer: false)
            self.seedTracker.updateSeeds(to: preferenceValues)
            // <+584>
        } else {
            // <+476>
            if isLinkedOnOrAfter(.v7), _shouldDeferToChildViewController != nil {
                _shouldDeferToChildViewController = preferenceValues[HostingGestureOverlayAuthorityKey.self].value
            }
            // <+584>
        }
        
        // <+584>
    }
    
    func updateStatusBar(isAnimated: Bool, shouldDefer: Bool) {
        fatalError("TODO")
    }
}
