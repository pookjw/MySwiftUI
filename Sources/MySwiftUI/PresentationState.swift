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
        assertUnimplemented()
    }
    
    func presentationDidChange(_: SheetPreference?, animated: Bool, hasNoModifier: Bool) {
        assertUnimplemented()
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
    
    @inline(always) // 원래 없음
    mutating func didMoveToNonNilWindow() {
        if case .delayedPresentationPendingNonNilWindow = base {
            base = .waitingToPresentDelayedPresentationSheetPreference
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
