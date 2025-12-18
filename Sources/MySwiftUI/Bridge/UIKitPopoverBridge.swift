internal import UIKit
internal import MySwiftUICore

final class UIKitPopoverBridge: NSObject {
    private weak var host: ViewRendererHost?
    private var overrideArrowDirections: UIPopoverArrowDirection?
    private weak var presenterOverride: UIViewController?
    private weak var barItemAnchor: UIBarButtonItem?
    private var tabItemAnchor: UIPopoverPresentationControllerSourceItem?
    private var delayedPopoverPreferences: PreferenceValues?
    private var activePresentation: UIKitPopoverBridge.PresentationKind
    private var activeInspectorAnchor: Anchor<CGRect?>?
    private var dismissingReason: DismissingReason?
    private var pendingDismissAction: (() -> Void)?
    private lazy var popoverPresentationDelegate: PopoverPresentationDelegate? = {
        fatalError("TODO")
    }()
    private var presentedVC: PresentationHostingController<AnyView>?
    private var inspectorSeed: VersionSeed
    private var anchorSeed: VersionSeed
    private var popoverSeed: VersionSeed
    private var backgroundSeed: VersionSeed
    private var presentationOptionsSeed: VersionSeed
    private var lastInspectorValues: [ViewIdentity: InspectorStorage]
    private var lastAnchorValues: [AnyHashable: Anchor<CGRect?>]
    private var lastPopoverPresentation: PopoverPresentation?
    var wasBackgrounded: Bool
    
    override init() {
        fatalError("TODO")
        super.init()
    }
    
    func updateAnchor() {
        fatalError("TODO")
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
