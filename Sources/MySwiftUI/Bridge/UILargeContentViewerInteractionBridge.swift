#warning("TODO")
internal import UIKit
internal import MySwiftUICore
private import _UIKitPrivate

@MainActor class UILargeContentViewerInteractionBridge: NSObject {
    private weak var host: (UIView & ViewRendererHost)? = nil
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
    
    @objc func enabledStatusDidChange() {
        fatalError("TODO")
    }
}

extension UILargeContentViewerInteractionBridge {
    fileprivate struct ActiveItem {
        // TODO
    }
}
