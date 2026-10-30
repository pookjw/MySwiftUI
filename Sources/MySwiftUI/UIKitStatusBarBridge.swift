// 275D0F873737809699C82A4C078D7AB7
internal import UIKit
@_spi(Internal) internal import MySwiftUICore

@MainActor
final class UIKitStatusBarBridge {
    private var statusBarHidden: Bool? = nil
    private var _shouldDeferToChildViewController: Bool? = nil
    private var seedTracker = VersionSeedSetTracker()
    weak var host: ViewRendererHost? = nil
    
    var shouldDeferToChildViewController: Bool {
        if isLinkedOnOrAfter(.v7), _shouldDeferToChildViewController == nil {
            guard host!.viewGraph.isInstantiated || !isLinkedOnOrAfter(.v7_1) else {
                return false
            }

            _shouldDeferToChildViewController = host!.preferenceValue(HostingGestureOverlayAuthorityKey.self)
        }
        
        return _shouldDeferToChildViewController ?? false
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
        var needsUpdate = seedTracker.hasChanges(in: preferenceValues)
        if !needsUpdate, isLinkedOnOrAfter(.v7), let previousValue = _shouldDeferToChildViewController {
            let value = preferenceValues[HostingGestureOverlayAuthorityKey.self].value
            _shouldDeferToChildViewController = value
            needsUpdate = value != previousValue
        }

        if needsUpdate {
            // <+232>
            // w26
            let statusBarValue = preferenceValues[StatusBarKey.self].value
            let isAnimated = statusBarValue?.isAnimated ?? false
            
            if !isLinkedOnOrAfter(.v7) {
                _shouldDeferToChildViewController = preferenceValues[HostingGestureOverlayAuthorityKey.self].value
            }
            // <+400>
            self.statusBarHidden = statusBarValue?.isHidden
            updateStatusBar(isAnimated: isAnimated, shouldDefer: false)
            self.seedTracker.updateSeeds(to: preferenceValues)
            // <+584>
        }
        
        // <+584>
    }
    
    func updateStatusBar(isAnimated: Bool, shouldDefer: Bool) {
        assertUnimplemented()
    }
}
