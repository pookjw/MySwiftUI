// BC4133B0B62555DBC7A28B2CD8C5E5B8
private import UIKit
internal import MySwiftUICore

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
    var presentedVC: PresentationHostingController<AnyView>? {
        switch self.base {
        case .requestedPresentation, .presented:
            return self.base.presentedVC!
        case .programmaticallyDismissing, .interactivelyDismissing, .dismissingForLackOfModifier, .dismissingToPresentAgain, .dormantInspector, .waitingToPresentAgain, .delayedPresentationPendingDismissal, .delayedPresentationPendingNonSheetBridgeDismissal, .delayedPresentationPendingNonNilWindow, .waitingToPresentDelayedPresentationSheetPreference, .noPresentation:
            return nil
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
