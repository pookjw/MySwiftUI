// BC4133B0B62555DBC7A28B2CD8C5E5B8
internal import UIKit
internal import MySwiftUICore
private import os.log

struct PresentationState {
    private var base: PresentationState.Base = .noPresentation {
        willSet {
            assertUnimplemented()
        }
    }
    
    func presentPreemptingDismissal(_ sheetPreference: SheetPreference, presentedVC: PresentationHostingController<AnyView>, presentationSeed: VersionSeed) {
        assertUnimplemented()
    }
    
    func dismiss(willPresentAgain: Bool, hasNoModifier: Bool) {
        assertUnimplemented()
    }
    
    var presentingViewID: Namespace.ID? {
        switch self.base {
        case .requestedPresentation(let preference, _, _):
            return preference.viewID
        case .presented(let preference, _, _):
            return preference.viewID
        case .programmaticallyDismissing, .interactivelyDismissing, .dismissingForLackOfModifier, .dismissingToPresentAgain, .dormantInspector, .waitingToPresentAgain, .delayedPresentationPendingDismissal, .delayedPresentationPendingNonSheetBridgeDismissal, .delayedPresentationPendingNonNilWindow, .waitingToPresentDelayedPresentationSheetPreference, .noPresentation:
            return nil
        }
    }
    
    func presentationDidChange(_ preference: SheetPreference?, animated: Bool, hasNoModifier: Bool) {
        /*
         self -> x20 -> x29 - 0x58
         preference -> x0 -> x29 - 0x68
         animated -> w1 -> x29 - 0x74
         hasNoModifier -> w2 -> x29 - 0xa4
         */
        // <+544>
        switch self.base {
        case .requestedPresentation(_, _, _):
            // <+956>
            assertUnimplemented()
        case .presented, .programmaticallyDismissing, .interactivelyDismissing, .dismissingForLackOfModifier, .dismissingToPresentAgain, .dormantInspector, .waitingToPresentAgain:
            return
        case .delayedPresentationPendingDismissal(_, _, _):
            // <+604>
            assertUnimplemented()
        case .delayedPresentationPendingNonSheetBridgeDismissal(_, _, _):
            // <+1064>
            assertUnimplemented()
        case .delayedPresentationPendingNonNilWindow(_, _):
            // <+840>
            assertUnimplemented()
        case .waitingToPresentDelayedPresentationSheetPreference:
            return
        case .noPresentation:
            return
        }
    }
    
    func hasIdentityMatching(_: SheetPreference?) -> Bool {
        assertUnimplemented()
    }
    
    var isDismissingFromSheetBridge: Bool {
        assertUnimplemented()
    }
    
    var isDismissalPreemptable: Bool {
        assertUnimplemented()
    }
    
    func enqueueDelayedPresentation_IsDismissing(_: SheetPreference, animated: Bool) {
        assertUnimplemented()
    }
    
    var delayedPresentation : (presentation: SheetPreference, presentedVC: PresentationHostingController<AnyView>?, animated: Bool)? {
        switch base {
        case .delayedPresentationPendingDismissal(let presentation, let presentedVC, let animated):
            return (presentation, presentedVC, animated)
        case .delayedPresentationPendingNonSheetBridgeDismissal(let presentation, _, let animated):
            return (presentation, nil, animated)
        case .delayedPresentationPendingNonNilWindow(let presentation, let animated):
            return (presentation, nil, animated)
        default:
            return nil
        }
    }
    
    func presentationDidBeginInteractiveDismissal() {
        assertUnimplemented()
    }
    
    func presentationDidDisappear() {
        assertUnimplemented()
    }
    
    func dismissInspector() {
        assertUnimplemented()
    }
    
    func present(_: SheetPreference, presentedVC: PresentationHostingController<AnyView>, presentationSeed: VersionSeed) {
        assertUnimplemented()
    }
    
    @inline(always) // 원래 없음
    mutating func didMoveToNonNilWindow() {
        if case .delayedPresentationPendingNonNilWindow = base {
            base = .waitingToPresentDelayedPresentationSheetPreference
        }
    }
    
    @inline(always) // 원래 없음
    var resolvedPresentedVC: PresentationHostingController<AnyView>? {
        switch self.base {
        case .requestedPresentation, .presented:
            return self.base.presentedVC!
        case .programmaticallyDismissing, .interactivelyDismissing, .dismissingForLackOfModifier, .dismissingToPresentAgain, .dormantInspector, .waitingToPresentAgain, .delayedPresentationPendingDismissal, .delayedPresentationPendingNonSheetBridgeDismissal, .delayedPresentationPendingNonNilWindow, .waitingToPresentDelayedPresentationSheetPreference, .noPresentation:
            return nil
        }
    }
    
    @inline(always) // 원래 없음
    var presentedVC: PresentationHostingController<AnyView>? {
        return self.base.presentedVC
    }
    
    @inline(always) // 원래 없음
    @MainActor mutating func configuraPresentation<T : HostPreferenceKey>(
        sheetBridge: SheetBridge<T>,
        viewController: UIViewController,
        preference: SheetPreference,
        animated: Bool
    ) -> PresentationHostingController<AnyView>?? where T.Value == SheetPreference.Value {
        switch self.base {
        case .requestedPresentation, .presented, .programmaticallyDismissing, .interactivelyDismissing, .dismissingForLackOfModifier, .dismissingToPresentAgain, .dormantInspector, .waitingToPresentAgain, .delayedPresentationPendingDismissal, .delayedPresentationPendingNonNilWindow, .waitingToPresentDelayedPresentationSheetPreference, .noPresentation:
            break
        case .delayedPresentationPendingNonSheetBridgeDismissal(_, _, _):
            if let presentedVC = self.base.presentedVC {
                self.base = .delayedPresentationPendingNonSheetBridgeDismissal(preference, presentedVC: presentedVC, animated: animated)
                return nil
            }
        }
        
        if
            let presentedViewController = viewController.presentedViewController,
            presentedViewController.isBeingDismissed,
            let casted = presentedViewController as? PresentationHostingController<AnyView>
        {
            self.base = .delayedPresentationPendingNonSheetBridgeDismissal(preference, presentedVC: casted, animated: animated)
            casted.configureSecondaryDismissDelegate(sheetBridge)
            return nil
        } else {
            if sheetBridge.clientNeedsOutOfWindowPresentationSuppression && !sheetBridge.presenterHasWindow {
                if sheetBridge.presenterOverride != nil {
                    Log.externalWarning("A sheet was presented from a toolbar item while out of\nwindow, and the presenter is not yet in the window.\nThis is invalid and the presentation will be ignored.")
                } else {
                    self.base = .delayedPresentationPendingNonNilWindow(preference, animated: animated)
                }
                
                return nil
            } else {
                return self.base.presentedVC
            }
        }
    }
}

extension PresentationState {
    fileprivate enum Base : CustomStringConvertible {
        case requestedPresentation(SheetPreference, presentedVC: PresentationHostingController<AnyView>, presentationSeed: VersionSeed)
        case presented(SheetPreference, presentedVC: PresentationHostingController<AnyView>, presenstationSeed: VersionSeed)
        case programmaticallyDismissing(PresentationHostingController<AnyView>?, last: SheetPreference)
        case interactivelyDismissing(PresentationHostingController<AnyView>?, last: SheetPreference)
        case dismissingForLackOfModifier(last: SheetPreference)
        case dismissingToPresentAgain(PresentationHostingController<AnyView>, last: SheetPreference)
        case dormantInspector(last: SheetPreference)
        case waitingToPresentAgain(PresentationHostingController<AnyView>)
        case delayedPresentationPendingDismissal(SheetPreference, presentedVC: PresentationHostingController<AnyView>, animated: Bool)
        case delayedPresentationPendingNonSheetBridgeDismissal(SheetPreference, presentedVC: UIViewController, animated: Bool)
        case delayedPresentationPendingNonNilWindow(SheetPreference, animated: Bool)
        case waitingToPresentDelayedPresentationSheetPreference
        case noPresentation
        
        var presentedVC: PresentationHostingController<AnyView>? {
            assertUnimplemented()
        }
        
        var lastPresentation: SheetPreference? {
            assertUnimplemented()
        }
        
        var willPresentAgainAfterDismiss: Bool {
            assertUnimplemented()
        }
        
        var presentationSeed: VersionSeed? {
            assertUnimplemented()
        }
        
        var description: String {
            assertUnimplemented()
        }
    }
}
