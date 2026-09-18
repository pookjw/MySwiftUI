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
        case .delayedPresentationPendingDismissal(_, _, _, _):
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
        // <+80>
        switch self.base {
        case .requestedPresentation(_, _, _):
            // <+248>
            return false
        case .presented(_, _, _):
            // <+168>
            return false
        case .programmaticallyDismissing(_, _):
            // <+136>
            return true
        case .interactivelyDismissing(_, _):
            // <+136>
            return true
        case .dismissingForLackOfModifier(_):
            // <+324>
            return true
        case .dismissingToPresentAgain(_, _):
            // <+340>
            return true
        case .dormantInspector(_):
            // <+428>
            return false
        case .waitingToPresentAgain(_):
            // <+156>
            return false
        case .delayedPresentationPendingDismissal(_, _, _, _):
            // <+188>
            return true
        case .delayedPresentationPendingNonSheetBridgeDismissal(_, _, _):
            // <+384>
            return false
        case .delayedPresentationPendingNonNilWindow(_, _):
            // <+428>
            return false
        case .waitingToPresentDelayedPresentationSheetPreference:
            // <+156>
            return false
        case .noPresentation:
            // <+448>
            return false
        }
    }
    
    var isDismissalPreemptable: Bool {
        switch self.base {
        case .requestedPresentation(_, _, _):
            // <+272>
            return false
        case .presented(_, _, _):
            // <+252>
            return false
        case .programmaticallyDismissing(_, _):
            // <+136>
            return true
        case .interactivelyDismissing(_, _):
            // <+136>
            return true
        case .dismissingForLackOfModifier(_):
            // <+392>
            return false
        case .dismissingToPresentAgain(_, _):
            // <+432>
            return false
        case .dormantInspector(_):
            // <+392>
            return false
        case .waitingToPresentAgain(_):
            // <+180>
            return false
        case .delayedPresentationPendingDismissal(_, _, _, _):
            // <+192>
            return false
        case .delayedPresentationPendingNonSheetBridgeDismissal(_, _, _):
            // <+348>
            return false
        case .delayedPresentationPendingNonNilWindow(_, _):
            // <+392>
            return false
        case .waitingToPresentDelayedPresentationSheetPreference:
            // <+180>
            return false
        case .noPresentation:
            // <+412>
            return false
        }
    }
    
    func enqueueDelayedPresentation_IsDismissing(_: SheetPreference, animated: Bool) {
        assertUnimplemented()
    }
    
    var delayedPresentation : (presentation: SheetPreference, presentedVC: PresentationHostingController<AnyView>?, animated: Bool)? {
        switch base {
        case .delayedPresentationPendingDismissal(let presentation, let presentedVC, let animated, _):
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
        case delayedPresentationPendingDismissal(SheetPreference, presentedVC: PresentationHostingController<AnyView>, animated: Bool, last: SheetPreference)
        case delayedPresentationPendingNonSheetBridgeDismissal(SheetPreference, presentedVC: UIViewController, animated: Bool)
        case delayedPresentationPendingNonNilWindow(SheetPreference, animated: Bool)
        case waitingToPresentDelayedPresentationSheetPreference
        case noPresentation
        
        var presentedVC: PresentationHostingController<AnyView>? {
            switch self {
            case .requestedPresentation(_, let presentedVC, _):
                // <+208>
                return presentedVC
            case .presented(_, let presentedVC, _):
                // <+164>
                return presentedVC
            case .programmaticallyDismissing(let controller, _):
                // <+148>
                return controller
            case .interactivelyDismissing(let controller, _):
                // <+148>
                return controller
            case .dismissingForLackOfModifier(_):
                // <+136>
                return nil
            case .dismissingToPresentAgain(let controller, _):
                // <+328>
                return controller
            case .dormantInspector(_):
                // <+136>
                return nil
            case .waitingToPresentAgain(let controller):
                // <+360>
                return controller
            case .delayedPresentationPendingDismissal(_, let presentedVC, _, _):
                // <+276>
                return presentedVC
            case .delayedPresentationPendingNonSheetBridgeDismissal(_, let presentedVC, _):
                // <+368>
                return presentedVC as? PresentationHostingController<AnyView>
            case .delayedPresentationPendingNonNilWindow(_, _):
                // <+136>
                return nil
            case .waitingToPresentDelayedPresentationSheetPreference:
                // <+184>
                return nil
            case .noPresentation:
                // <+472>
                return nil
            }
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
