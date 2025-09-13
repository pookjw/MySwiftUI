#warning("TODO")
private import UIKit
internal import MySwiftUICore

struct PresentationState {
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
    
    private var base: PresentationState.Base = .noPresentation
    
    func presentPreemptingDismissal(_ sheetPreference: SheetPreference, presentedVC: PresentationHostingController<AnyView>, presentationSeed: VersionSeed) {
        fatalError("TODO")
    }
    
    // 원래 없음
    @inlinable mutating func didMoveToNonNilWindow() {
        if case .delayedPresentationPendingNonNilWindow = base {
            base = .waitingToPresentDelayedPresentationSheetPreference
        }
    }
}

extension PresentationState {
    fileprivate enum Base {
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
    }
}
