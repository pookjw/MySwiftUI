// 1C25C4B203EEAC6A19839AC5BDB6A345
internal import UIKit
@_spi(Internal) internal import MySwiftUICore
private import _UIKitPrivate

@MainActor final class UILargeContentViewerInteractionBridge : NSObject {
    weak var host: (UIView & ViewRendererHost)? = nil
    private var interaction: UILargeContentViewerInteraction? = nil
    private weak var gesture: UIGestureRecognizer? = nil
    private weak var gestureManager: UIAccessibilityHUDGestureManager? = nil
    private var simultaneousGesture: UIGestureRecognizer? = nil
    private var activeItem: ActiveItem? = nil
    private var largeContentViewTreeSeed: VersionSeed = .empty
    private var largeContentViewTree: AccessibilityLargeContentViewTree = .empty
    private var showLargeContentViewer: Bool = UILargeContentViewerInteraction.isEnabled
    
    override init() {
        super.init()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(enabledStatusDidChange),
            name: UILargeContentViewerInteraction.enabledStatusDidChangeNotification,
            object: nil
        )
    }
    
    @objc private func enabledStatusDidChange() {
        assertUnimplemented()
    }
    
    @objc private func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        assertUnimplemented()
    }
    
    @objc private func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        assertUnimplemented()
    }
    
    @objc private func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        assertUnimplemented()
    }
    
    @objc private func largeContentViewerInteraction(_ largeContentViewerInteraction: UILargeContentViewerInteraction, itemAt point: CGPoint) -> UILargeContentViewerItem? {
        assertUnimplemented()
    }
    
    @objc private func largeContentViewerInteraction(_ largeContentViewerInteraction: UILargeContentViewerInteraction, didEndOn item: UILargeContentViewerItem?, at point: CGPoint) {
        assertUnimplemented()
    }
    
    private func hitTest(at point: CGPoint) -> ActiveItem? {
        assertUnimplemented()
    }
    
    // inlined from $s7SwiftUI14_UIHostingViewC04rootD0ACyxGx_tcfcTf4gn_n
    // 원래 없음
    @inlinable
    func updateRequestedPreferences(for viewGraph: ViewGraph) {
        Update.ensure {
            // $s7SwiftUI37UILargeContentViewerInteractionBridgeC26updateRequestedPreferences3foryAA9ViewGraphC_tFyyXEfU_TA
            if showLargeContentViewer {
                viewGraph.addPreference(AccessibilityLargeContentViewTree.Key.self)
            } else {
                viewGraph.removePreference(AccessibilityLargeContentViewTree.Key.self)
            }
        }
    }
    
    func preferencesDidChange(_ preferenceValues: PreferenceValues) {
        // x24
        let accessibilityLargeContentViewTree = preferenceValues[AccessibilityLargeContentViewTree.Key.self]
        
        guard !accessibilityLargeContentViewTree.seed.matches(largeContentViewTreeSeed) else {
            return
        }
        
        // <+424>
        assertUnimplemented()
    }
}

extension UILargeContentViewerInteractionBridge {
    fileprivate struct ActiveItem {
        // TODO
    }
}
