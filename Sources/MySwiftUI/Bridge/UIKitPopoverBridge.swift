internal import UIKit
internal import MySwiftUICore

final class UIKitPopoverBridge: NSObject {
    weak var host: ViewRendererHost? = nil // 0x840
    private var overrideArrowDirections: UIPopoverArrowDirection? = nil // 0x848
    private weak var presenterOverride: UIViewController? = nil // 0x850
    private weak var barItemAnchor: UIBarButtonItem? = nil // 0x858
    private weak var tabItemAnchor: UIPopoverPresentationControllerSourceItem? // 0x860
    private var delayedPopoverPreferences: PreferenceValues? = nil // 0x4d0
    private var activePresentation: UIKitPopoverBridge.PresentationKind = .none // 0x338
    private var activeInspectorAnchor: Anchor<CGRect?>? = nil // 0x868
    private var dismissingReason: DismissingReason? = nil // 0x870
    private var pendingDismissAction: (() -> Void)? = nil // 0x878
    private lazy var popoverPresentationDelegate: PopoverPresentationDelegate = {
        fatalError("TODO")
    }() // 0x880 (storage)
    private var presentedVC: PresentationHostingController<AnyView>? = nil // 0x4e0
    private var inspectorSeed: VersionSeed = .empty // 0x888
    private var anchorSeed: VersionSeed = .empty // 0x890
    private var popoverSeed: VersionSeed = .empty // 0x898
    private var backgroundSeed: VersionSeed = .empty // 0x8a0
    private var presentationOptionsSeed: VersionSeed = .empty // 0x8a8
    private var lastInspectorValues: [ViewIdentity: InspectorStorage] = [:] // 0xe70
    private var lastAnchorValues: [AnyHashable: Anchor<CGRect?>] = [:] // 0x8b8
    private var lastPopoverPresentation: PopoverPresentation? = nil // 0x8c0
    var wasBackgrounded: Bool = false // 0x8c8
    
    override init() {
        super.init()
    }
    
    func updateAnchor() {
        // <+392>
        // x23
        let activePresentation = activePresentation
        
        switch activePresentation {
        case .popoverItem(let anyHashable):
            fatalError("TODO")
        case .popover(let viewIdentity):
            fatalError("TODO")
        case .inspector(let viewIdentity):
            // <+564>
            fatalError("TODO")
        case .none:
            return
        }
    }
}

extension UIKitPopoverBridge {
    enum PresentationKind {
        case popoverItem(AnyHashable)
        case popover(ViewIdentity)
        case inspector(ViewIdentity)
        case none
    }
}

fileprivate enum DismissingReason {
    case toPresentAgain
    case withFinality
}
