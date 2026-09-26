// BC4133B0B62555DBC7A28B2CD8C5E5B8
internal import UIKit
@_spi(Internal) internal import MySwiftUICore
private import os.log

struct PresentationState {
    fileprivate var base: PresentationState.Base = .noPresentation {
        willSet {
            /*
             self.base -> x20 -> x19
             newValue -> x0 -> x28
             */
            // <+396>
            if let log = Log.presentation {
                let oldValue = self.base
                log.log(level: .debug, "<Presentation> State change \(oldValue) → \(newValue)")
            }
            
            // <+888>
            if (newValue.presentedVC == nil), let presentedVC = self.base.presentedVC {
                // <+920>
                presentedVC.host.render(interval: 0, updateDisplayList: false, targetTimestamp: nil)
            }
            
            // <+1088>
            let willPresentAgainAfterDismiss = self.base.willPresentAgainAfterDismiss
            let preferences = PresentationState.Base.dismissedPresentations(from: self.base, to: newValue)
            
            for preference in preferences {
                guard let onDismiss = preference.onDismiss else {
                    continue
                }
                
                Update.enqueueAction(reason: nil) { 
                    onDismiss(!willPresentAgainAfterDismiss)
                }
            }
        }
    }
    
    mutating func presentPreemptingDismissal(_ sheetPreference: SheetPreference, presentedVC: PresentationHostingController<AnyView>, presentationSeed: VersionSeed) {
        self.base = .requestedPresentation(sheetPreference, presentedVC: presentedVC, presentationSeed: presentationSeed)
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
        case .waitingToPresentDelayedPresentationSheetPreference(_):
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
        case .waitingToPresentDelayedPresentationSheetPreference(_):
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
        case .waitingToPresentDelayedPresentationSheetPreference(_):
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
    
    mutating func present(_ preference: SheetPreference, presentedVC: PresentationHostingController<AnyView>, presentationSeed: VersionSeed) {
        self.presentPreemptingDismissal(preference, presentedVC: presentedVC, presentationSeed: presentationSeed)
    }
    
    @inline(always) // 원래 없음
    mutating func didMoveToNonNilWindow() {
        if case .delayedPresentationPendingNonNilWindow(let preference, _) = base {
            base = .waitingToPresentDelayedPresentationSheetPreference(preference)
        }
    }
    
    @inline(always) // 원래 없음
    var isPresentationMode: Bool {
        switch self.base {
        case .requestedPresentation, .presented:
            return true
        case .programmaticallyDismissing, .interactivelyDismissing, .dismissingForLackOfModifier, .dismissingToPresentAgain, .dormantInspector, .waitingToPresentAgain, .delayedPresentationPendingDismissal, .delayedPresentationPendingNonSheetBridgeDismissal, .delayedPresentationPendingNonNilWindow, .waitingToPresentDelayedPresentationSheetPreference, .noPresentation:
            return false
        }
    }
    
    @inline(always) // 원래 없음
    var presentedVC: PresentationHostingController<AnyView>? {
        return self.base.presentedVC
    }
    
    @inline(always) // 원래 없음
    var presentationSeed: VersionSeed? {
        return self.base.presentationSeed
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
            if sheetBridge.needsDelayedPresentation {
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
        case delayedPresentationPendingDismissal(SheetPreference, presentedVC: PresentationHostingController<AnyView>?, animated: Bool, last: SheetPreference)
        case delayedPresentationPendingNonSheetBridgeDismissal(SheetPreference, presentedVC: UIViewController, animated: Bool)
        case delayedPresentationPendingNonNilWindow(SheetPreference, animated: Bool)
        case waitingToPresentDelayedPresentationSheetPreference(SheetPreference)
        case noPresentation
        
        static func dismissedPresentations(from oldValue: PresentationState.Base, to newValue: PresentationState.Base) -> [SheetPreference] {
            /*
             oldValue -> x0 -> x26
             newValue -> x1 -> x27
             */
            // newValue -> x27 -> x29 - 0x80 / x23 / x29 - 0x60
            // <+1272>
            switch oldValue {
            case .requestedPresentation, .presented, .programmaticallyDismissing, .interactivelyDismissing, .dismissingToPresentAgain, .dormantInspector, .waitingToPresentAgain, .delayedPresentationPendingNonSheetBridgeDismissal, .delayedPresentationPendingNonNilWindow, .waitingToPresentDelayedPresentationSheetPreference, .noPresentation:
                // <+1752>
                switch newValue {
                case .requestedPresentation, .presented, .programmaticallyDismissing, .dismissingForLackOfModifier, .dismissingToPresentAgain, .dormantInspector, .waitingToPresentAgain, .delayedPresentationPendingNonSheetBridgeDismissal, .delayedPresentationPendingNonNilWindow, .waitingToPresentDelayedPresentationSheetPreference, .noPresentation:
                    // <+2120>
                    switch oldValue {
                    case .requestedPresentation, .presented, .programmaticallyDismissing, .dismissingForLackOfModifier, .dismissingToPresentAgain,. dormantInspector, .waitingToPresentAgain, .delayedPresentationPendingDismissal, .delayedPresentationPendingNonSheetBridgeDismissal, .delayedPresentationPendingNonNilWindow, .waitingToPresentDelayedPresentationSheetPreference, .noPresentation:
                        // <+3412>
                        // x27
                        let oldViewID: Namespace.ID
                        let oldLastPresentation = oldValue.lastPresentation
                        if let lastPresentation = oldLastPresentation {
                            // <+3676>
                            oldViewID = lastPresentation.viewID
                        } else {
                            // <+3696>
                            oldViewID = Namespace.ID(id: 0)
                        }
                        
                        let flag: Bool
                        if let lastPresentation = newValue.lastPresentation {
                            // <+3784>
                            // x20
                            let newViewID = lastPresentation.viewID
                            
                            if oldLastPresentation != nil {
                                // <+3812>
                                if oldViewID == newViewID {
                                    // <+3828>
                                    flag = true
                                } else {
                                    // <+3856>
                                    flag = false
                                }
                            } else {
                                // <+3856>
                                flag = false
                            }
                        } else {
                            // <+3748>
                            if oldLastPresentation == nil {
                                // <+3828>
                                flag = true
                            } else {
                                // <+3856>
                                flag = false
                            }
                        }
                        
                        if flag {
                            // <+3828>
                            return []
                        } else {
                            // <+3856>
                            if let lastPresentation = oldValue.lastPresentation {
                                // <+4352>
                                return [lastPresentation]
                            } else {
                                // <+3912>
                                return []
                            }
                        }
                    case .interactivelyDismissing(_, _):
                        return []
                    }
                case .interactivelyDismissing(_, _):
                    // <+2020>
                    if let lastPresentation = oldValue.lastPresentation {
                        // <+3256>
                        return [lastPresentation]
                    } else {
                        // <+3384>
                        return []
                    }
                case .delayedPresentationPendingDismissal(let preference_1, _, _, let preference_2):
                    // <+1796>
                    if let lastPresentation = oldValue.lastPresentation {
                        // <+3152>
                        if (lastPresentation.viewID == preference_1.viewID) || (lastPresentation.viewID == preference_2.viewID) {
                            // <+3208>
                            return []
                        } else {
                            // <+1928>
                            if let lastPresentation = oldValue.lastPresentation {
                                // <+3496>
                                return [lastPresentation]
                            } else {
                                // <+3628>
                                return []
                            }
                        }
                    } else {
                        // <+1900>
                        if let lastPresentation = oldValue.lastPresentation {
                            return [lastPresentation]
                        } else {
                            // <+3628>
                            return []
                        }
                    }
                }
            case .dismissingForLackOfModifier(_):
                // <+1708>
                return []
            case .delayedPresentationPendingDismissal(let preference_1, _, _, let preference_2):
                // <+1352>
                switch newValue {
                case .requestedPresentation, .presented, .interactivelyDismissing, .dismissingForLackOfModifier, .dismissingToPresentAgain, .dormantInspector, .waitingToPresentAgain, .delayedPresentationPendingNonSheetBridgeDismissal, .delayedPresentationPendingNonNilWindow, .noPresentation:
                    // <+2700>
                    /*
                     preference_1 -> x26
                     preference_2 -> x27
                     */
                    if let lastPresentation = newValue.lastPresentation {
                        // <+2820>
                        if preference_1.viewID == lastPresentation.viewID {
                            // <+2864>
                            if (preference_2.viewID == lastPresentation.viewID) || (preference_2.viewID == preference_1.viewID) {
                                // <+3016>
                                return []
                            } else {
                                // <+3028>
                                var results: [SheetPreference] = []
                                results.append(preference_2)
                                return results
                            }
                        } else {
                            // <+2880>
                            var results: [SheetPreference] = []
                            results.append(preference_1)
                            // <+2972>
                            // <+2984>
                            if (preference_2.viewID == lastPresentation.viewID) || (preference_2.viewID == preference_1.viewID) {
                                // <+3016>
                                return results
                            } else {
                                // <+3028>
                                results.append(preference_2)
                                return results
                            }
                        }
                    } else {
                        // <+2780>
                        // <+2880>
                        var results: [SheetPreference] = []
                        results.append(preference_1)
                        // <+3000>
                        if preference_2.viewID == preference_1.viewID {
                            // <+3016>
                            return results
                        } else {
                            // <+3028>
                            results.append(preference_2)
                            return results
                        }
                    }
                case .programmaticallyDismissing(_, let last):
                    // <+2344>
                    /*
                     preference_1 -> x24
                     preference_2 -> x26
                     */
                    if (last.viewID == preference_2.viewID) && (last.viewID == preference_1.viewID) {
                        // <+2496>
                        return [preference_1]
                    } else {
                        // <+2648>
                        if let lastPresentation = newValue.lastPresentation {
                            /*
                             preference_1 -> x26
                             preference_2 -> x27
                             */
                            // <+2820>
                            if preference_1.viewID == lastPresentation.viewID {
                                // <+2864>
                                if (preference_2.viewID == lastPresentation.viewID) || (preference_2.viewID == preference_1.viewID) {
                                    // <+3016>
                                    return []
                                } else {
                                    // <+3028>
                                    var results: [SheetPreference] = []
                                    results.append(preference_2)
                                    return results
                                }
                            } else {
                                // <+2880>
                                var results: [SheetPreference] = []
                                results.append(preference_1)
                                // <+2972>
                                // <+2984>
                                if (preference_2.viewID == lastPresentation.viewID) || (preference_2.viewID == preference_1.viewID) {
                                    // <+3016>
                                    return results
                                } else {
                                    // <+3028>
                                    results.append(preference_2)
                                    return results
                                }
                            }
                        } else {
                            // <+2780>
                            // <+2880>
                            var results: [SheetPreference] = []
                            results.append(preference_1)
                            // <+3000>
                            if preference_2.viewID == preference_1.viewID {
                                // <+3016>
                                return results
                            } else {
                                // <+3028>
                                results.append(preference_2)
                                return results
                            }
                        }
                    }
                case .delayedPresentationPendingDismissal(let preference_3, _, _, let preference_4):
                    // <+2180>
                    /*
                     preference_3 -> x27
                     preference_4 -> x24
                     preference_1 -> x26
                     preference_2 -> x28
                     */
                    if (preference_1.viewID == preference_3.viewID) || (preference_1.viewID == preference_4.viewID) {
                        // <+2332>
                        var results: [SheetPreference] = []
                        // <+4056>
                        if (preference_2.viewID == preference_3.viewID) || (preference_2.viewID == preference_4.viewID) {
                            // <+4092>
                            return results
                        } else {
                            // <+4152>
                            results.append(preference_2)
                            return results
                        }
                    } else {
                        // <+3948>
                        var results: [SheetPreference] = []
                        results.append(preference_1)
                        
                        if (preference_2.viewID == preference_3.viewID) || (preference_2.viewID == preference_4.viewID) {
                            // <+4092>
                            return results
                        } else {
                            // <+4152>
                            results.append(preference_2)
                            return results
                        }
                    }
                case .waitingToPresentDelayedPresentationSheetPreference(let preference_3):
                    // <+1424>
                    /*
                     preference_1 -> x24
                     preference_2 -> x25
                     preference_3 -> x26
                     */
                    if (preference_1.viewID == preference_2.viewID) && (preference_1.viewID == preference_3.viewID) {
                        // <+1552>
                        return [preference_1]
                    } else {
                        // <+2656>
                        /*
                         preference_1 -> x26
                         preference_2 -> x27
                         */
                        let lastPresentation = newValue.lastPresentation
                        if let lastPresentation {
                            // <+2820>
                            if preference_1.viewID == lastPresentation.viewID {
                                // <+2864>
                                // <+2984>
                                if (preference_2.viewID == lastPresentation.viewID) || (preference_2.viewID == preference_1.viewID) {
                                    // <+3016>
                                    return []
                                } else {
                                    // <+3028>
                                    return [preference_2]
                                }
                            } else {
                                // <+2880>
                            }
                        } else {
                            // <+2780>
                            // <+2880>
                        }
                        
                        // <+2880>
                        var results: [SheetPreference] = []
                        results.append(preference_1)
                        
                        // <+2972>
                        if let lastPresentation {
                            // <+2984>
                            if (preference_2.viewID == lastPresentation.viewID) || (preference_2.viewID == preference_1.viewID) {
                                // <+3016>
                                return results
                            } else {
                                // <+3028>
                                results.append(preference_2)
                                return results
                            }
                        } else {
                            // <+3000>
                            if (preference_2.viewID == preference_1.viewID) {
                                // <+3016>
                                return results
                            } else {
                                // <+3028>
                                results.append(preference_2)
                                return results
                            }
                        }
                    }
                }
            }
        }
        
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
            case .waitingToPresentDelayedPresentationSheetPreference(_):
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
            switch self {
            case .requestedPresentation(_, _, _):
                // <+368>
                return false
            case .presented(_, _, _):
                // <+312>
                return false
            case .programmaticallyDismissing(_, _):
                // <+136>
                return false
            case .interactivelyDismissing(_, _):
                // <+136>
                return false
            case .dismissingForLackOfModifier(_):
                // <+440>
                return false
            case .dismissingToPresentAgain(_, _):
                // <+332>
                return true
            case .dormantInspector(_):
                // <+288>
                return true
            case .waitingToPresentAgain(_):
                // <+172>
                return true
            case .delayedPresentationPendingDismissal(_, _, _, _):
                // <+184>
                return true
            case .delayedPresentationPendingNonSheetBridgeDismissal(_, _, _):
                // <+244>
                return true
            case .delayedPresentationPendingNonNilWindow(_, _):
                // <+440>
                return false
            case .waitingToPresentDelayedPresentationSheetPreference(_):
                // <+172>
                return true
            case .noPresentation:
                // <+460>
                return false
            }
        }
        
        var presentationSeed: VersionSeed? {
            assertUnimplemented()
        }
        
        var description: String {
            assertUnimplemented()
        }
    }
}
