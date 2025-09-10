#warning("TODO")
internal import UIKit
internal import MySwiftUICore

class UIKitStatusBarBridge {
    private var statusBarHidden: Bool? = nil
    private var _shouldDeferToChildViewController: Bool? = nil
    private var seedTracker = VersionSeedSetTracker()
    private weak var host: ViewRendererHost? = nil
    
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
    
    // inlined from $s7SwiftUI14_UIHostingViewC04rootD0ACyxGx_tcfcTf4gn_n
    // 원래 없음
    @inlinable
    final func setUp(host: (any ViewRendererHost)) {
        self.host = host
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
        fatalError("TODO")
    }
    
    func updateStatusBar(isAnimated: Bool, shouldDefer: Bool) {
        fatalError("TODO")
    }
}
