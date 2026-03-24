// FE44D2068AD13DD2180BAE4B95800306
internal import UIKit
internal import MySwiftUICore
private import _UIKitPrivate

@MainActor final class UIKitPopoverBridge: NSObject {
    weak var host: ViewRendererHost? = nil // 0x8
    private var overrideArrowDirections: UIPopoverArrowDirection? = nil // 0x18
    private weak var presenterOverride: UIViewController? = nil // 0x28
    private weak var barItemAnchor: UIBarButtonItem? = nil // 0x30
    private weak var tabItemAnchor: UIPopoverPresentationControllerSourceItem? // 0x38
    private var delayedPopoverPreferences: PreferenceValues? = nil // 0x40
    private var activePresentation: UIKitPopoverBridge.PresentationKind = .none // 0x48
    private var activeInspectorAnchor: Anchor<CGRect?>? = nil // 0x78
    private var dismissingReason: DismissingReason? = nil // 0x80
    private var pendingDismissAction: (() -> Void)? = nil // 0x88
    private lazy var popoverPresentationDelegate: PopoverPresentationDelegate = {
        assertUnimplemented()
    }() // 0x98 (storage)
    private var presentedVC: PresentationHostingController<AnyView>? = nil // 0xa0
    private var inspectorSeed: VersionSeed = .empty // 0xa8
    private var anchorSeed: VersionSeed = .empty // 0xac
    private var popoverSeed: VersionSeed = .empty // 0xb0
    private var backgroundSeed: VersionSeed = .empty // 0xb4
    private var presentationOptionsSeed: VersionSeed = .empty // 0xb8
    private var lastInspectorValues: [ViewIdentity: InspectorStorage] = [:] // 0xc0
    private var lastAnchorValues: [AnyHashable: Anchor<CGRect?>] = [:] // 0xc8
    private var lastPopoverPresentation: PopoverPresentation? = nil // 0xd0
    var wasBackgrounded: Bool = false // 0x1c8
    
    override init() {
        super.init()
    }
    
    func updateAnchor() {
        // <+392>
        // x23
        let activePresentation = activePresentation
        
        switch activePresentation {
        case .popoverItem(let _):
            assertUnimplemented()
        case .popover(let _):
            assertUnimplemented()
        case .inspector(let _):
            // <+564>
            assertUnimplemented()
        case .none:
            return
        }
    }
    
    @inlinable
    func preferenceDidChange(_ values: PreferenceValues) {
        updateInspectorIfNeeded(values)
        updatePopoverIfNeeded(
            values[PopoverPresentation.Key.self],
            presentationOptionsPreference: values[PresentationOptionsPreferenceKey.self],
            backgroundPreference: values[ContainerBackgroundKeys.HostTransparency.self]
        )
    }
    
    fileprivate func updateInspectorIfNeeded(_ values: PreferenceValues) {
        /*
         self -> x20 -> x19
         values -> x0 -> x25
         */
        // <+808>
        // x26
        let inspectorAnchorPreference = values[InspectorAnchorPreferenceKey.self]
        // w22
        let matchesAnchorSeed = self.anchorSeed.matches(inspectorAnchorPreference.seed)
        if !matchesAnchorSeed {
            assertUnimplemented()
        }
        
        let inspectorStorage = values[InspectorStorage.PreferenceKey.self]
        // w20
        let matchesInspectorSeed = self.inspectorSeed.matches(inspectorStorage.seed)
        if !matchesInspectorSeed {
            assertUnimplemented()
        }
        
        if !matchesAnchorSeed {
            assertUnimplemented()
        }
    }
    
    fileprivate func updatePopoverIfNeeded(
        _ popoverPresentationPreference: PreferenceValues.Value<[PopoverPresentation]>,
        presentationOptionsPreference: PreferenceValues.Value<PresentationOptionsPreference>,
        backgroundPreference: PreferenceValues.Value<ContainerBackgroundKeys.Transparency>
    ) {
        /*
         self -> x20 -> x19 + 0x180
         popoverPresentationPreference -> x0 -> x20
         presentationOptionsPreference -> x1 -> x19 + 0x138
         backgroundPreference -> x2 -> x19 + 0x130
         */
        // <+1632>
        // x26
        let popoverPresentationCount = popoverPresentationPreference.value.count
        // popoverPresentationPreference -> x20 -> x19 + 0x150
        // x27
        let _ = popoverPresentationPreference.value.first
        
        guard popoverPresentationCount <= 1 else {
            // <+2384>
            assertUnimplemented()
        }
        
        // <+1832>
        switch activePresentation {
        case .none:
            // <+1940>
            if let _ = self.presenter {
                // <+1956>
                // presenter -> x19 + 0x8
                if self.popoverSeed.matches(popoverPresentationPreference.seed) {
                    // <+2096>
                    guard isParentPresentationFromLikeKindBridge else {
                        // <+2372>
                        return
                    }
                    
                    // <+2096>
                    assertUnimplemented()
                } else {
                    // <+2384>
                }
            } else {
                // <+2384>
            }
        default:
            // <+2384>
            break
        }
        
        // <+2384>
        assertUnimplemented()
    }
    
    fileprivate var presenter: UIViewController? {
        if let presenterOverride {
            return presenterOverride
        }
        
        if let host, let uiViewController = host.uiViewController {
            return uiViewController
        }
        
        guard let host else {
            return nil
        }
        
        return host.uiView?._viewControllerForAncestor()
    }
    
    fileprivate var isParentPresentationFromLikeKindBridge: Bool {
        guard
            let host,
            let uiViewController = host.uiViewController,
            let _ = uiViewController as? PresentationHostingController<AnyView>
        else {
            return false
        }
        
        assertUnimplemented()
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
