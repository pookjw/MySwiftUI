// 9124433AF4D3FE5B3E95880733BE7575
@_spi(Internal) internal import MySwiftUICore
internal import UIKit
private import _UIKitPrivate

@MainActor class SheetBridge<T: HostPreferenceKey> : NSObject where T.Value == SheetPreference.Value {
    weak var host: ViewRendererHost? = nil
    private var seed: VersionSeed = .empty
    private var presentationOptionsTracker = VersionSeedTracker<PresentationOptionsPreferenceKey>(seed: .empty)
    private var backgroundTracker = VersionSeedTracker<ContainerBackgroundKeys.HostTransparency>(seed: .empty)
    private var interactiveDismissTracker = VersionSeedTracker<InteractiveDismissDisabledKey>(seed: .empty)
    private var remotePresentationDelayTracker = VersionSeedTracker<RemotePresentationDelayKey>(seed: .empty)
    private var interactiveDismissHandlerSeed = VersionSeedTracker<InteractiveDismissAttemptKey>(seed: .invalid)
    private var interactiveDismissHandler: (() -> Void)? = nil
    private var hasWindow: Bool = false
    private(set) var transitioningDelegate = SheetTransitioningDelegate()
    private var presentationState = PresentationState()
    private(set) weak var presenterOverride: UIViewController? = nil
    private var lastEnvironment = EnvironmentValues()
    let clientNeedsOutOfWindowPresentationSuppression: Bool = {
        guard let bundleIdentifier = Bundle.main.bundleIdentifier else {
            return false
        }
        
        return bundleIdentifier == "com.apple.Translate"
    }()
    
    var presenterHasWindow: Bool {
        assertUnimplemented()
    }
    
    override init() {
        super.init()
    }
    
    func addPreferences(to viewGraph: ViewGraph) {
        viewGraph.addPreference(T.self)
        viewGraph.addPreference(ContainerBackgroundKeys.HostTransparency.self)
        viewGraph.addPreference(PresentationOptionsPreferenceKey.self)
        viewGraph.addPreference(InteractiveDismissAttemptKey.self)
        viewGraph.addPreference(InteractiveDismissDisabledKey.self)
        viewGraph.addPreference(RemotePresentationDelayKey.self)
    }
    
    final func didMoveToWindow() {
        if host!.uiView?.window != nil {
            hasWindow = true
            
            var presentationState = presentationState
            let delayedPresentation = presentationState.delayedPresentation
            presentationState.didMoveToNonNilWindow()
            self.presentationState = presentationState
            
            if
                let delayedPresentation,
                let viewController = presenterOverride ?? host!.uiPresenterViewController
            {
                present(delayedPresentation.presentation, from: viewController, animated: delayedPresentation.animated, existingPresentedVC: nil, isPreempting: false)
            }
        } else {
            hasWindow = false
        }
    }
    
    final func preferencesDidChange(_ preferenceValues: PreferenceValues) {
        /*
         self -> x20 -> x19 + 0x1b8
         preferenceValues -> x0 -> x19 + 0x178
         x19 = x29 - 0x380
         */
        // <+1628>
        // x19 + 0x1b0
        let sheet = preferenceValues[T.self]
        // <+1648>
        // self -> x21
        // x25
        let lastEnvironment = lastEnvironment
        
        // <+1716>
        // x19 + 0x250 -> w8
        let presentationWantsTransparentBackground = lastEnvironment.presentationWantsTransparentBackground
        // x26 -> x19 + 0x158
        let transparency_1: PreferenceValues.Value<ContainerBackgroundKeys.Transparency>
        if presentationWantsTransparentBackground {
            // <+1760>
            transparency_1 = PreferenceValues.Value(value: .transparent, seed: .empty)
        } else {
            // <+1804>
            transparency_1 = preferenceValues[ContainerBackgroundKeys.HostTransparency.self]
        }
        
        // <+1840>
        // x19 + 0x1a0
        let presentationOptions_1 = preferenceValues[PresentationOptionsPreferenceKey.self]
        
        // <+1900>
        // self -> x26
        // x28
        let interactiveDismissAttempt = preferenceValues[InteractiveDismissAttemptKey.self]
        
        // <+1948>
        if !interactiveDismissHandlerSeed.seed.matches(interactiveDismissAttempt.seed) {
            // <+1996>
            interactiveDismissHandlerSeed = VersionSeedTracker<InteractiveDismissAttemptKey>(seed: interactiveDismissAttempt.seed)
            // <+2032>
            interactiveDismissHandler = interactiveDismissAttempt.value
        }
        
        // <+2120>
        if
            let hostingController = host!.uiViewController as? PresentationHostingController<AnyView>,
            case .sheetBridge = hostingController.presentingBridgeKind,
            let delayedController = self.host!.uiViewController as? PresentationHostingController<AnyView>
        {
            // <+2372>
            // delayedController -> x19 + 0x148
            let remotePresentationDelay = preferenceValues[RemotePresentationDelayKey.self]
            
            if !self.remotePresentationDelayTracker.seed.matches(remotePresentationDelay.seed) {
                self.remotePresentationDelayTracker.seed = remotePresentationDelay.seed
                let value = remotePresentationDelay.value
                
                if delayedController.isDelayingRemotePresentation && !value {
                    // <+2648>
                    delayedController._endDelayingPresentation()
                    delayedController.isDelayingRemotePresentation = false
                }
            }
        }
        
        // <+2692>
        // self -> x26
        // sheet -> x24
        if self.seed.matches(sheet.seed) {
            // <+2824>
            guard
                let presented = self.host!.uiViewController as? PresentationHostingController<AnyView>,
                case .sheetBridge = presented.presentingBridgeKind,
                let presenter = (self.presenterOverride ?? self.host!.uiPresenterViewController) as? PresentationHostingController<AnyView>
            else {
                // <+5720>
                return
            }
            
            // presenter -> x19 + 0x198
            // <+3084>
            let presentationOptions_2 = preferenceValues[PresentationOptionsPreferenceKey.self]
            
            if !self.presentationOptionsTracker.seed.matches(presentationOptions_2.seed) {
                // <+3216>
                self.presentationOptionsTracker.seed = presentationOptions_2.seed
                _ = presentationOptions_2.value
                presenter.updateSheet(with: presentationOptions_1.value)
            }
            
            // <+3312>
            // <+3364>
            let transparency_2 = preferenceValues[ContainerBackgroundKeys.HostTransparency.self]
            
            if !self.backgroundTracker.seed.matches(transparency_2.seed) {
                // <+3468>
                self.backgroundTracker.seed = transparency_2.seed
                _ = transparency_2.value
                presenter.setBackgroundTransparency(preferenceValue: transparency_1.value)
            }
            
            // <+3548>
            // <+3608>
            let interactiveDismissDisabled_1 = preferenceValues[InteractiveDismissDisabledKey.self]
            if !self.interactiveDismissTracker.seed.matches(interactiveDismissDisabled_1.seed) {
                // <+3696>
                self.interactiveDismissTracker.seed = interactiveDismissDisabled_1.seed
                _ = interactiveDismissDisabled_1.value
            }
            
            // <+3748>
            let interactiveDismissDisabled_2 = preferenceValues[InteractiveDismissDisabledKey.self].value
            presenter.lastInteractiveDismissDisabled = interactiveDismissDisabled_2
            
            // <+5780>
            return
        } else {
            // <+3920>
            self.seed = sheet.seed
            
            // <+3984>
            // x19 + 0x190 -> x19 + 0xf0
            let sheetPreference: SheetPreference?
            switch sheet.value {
            case .notPresented(_):
                // <+4088>
                sheetPreference = nil
            case .sheet(let preference):
                // <+4060>
                sheetPreference = preference
            case .unspecified:
                // <+4124>
                sheetPreference = nil
            }
            
            // <+4192>
            // x21
            let transaction: Transaction?
            
            if let sheetPreference {
                // <+4360>
                transaction = sheetPreference.transaction
                // <+4496>
            } else {
                // <+4232>
                if let presentingViewID = self.presentationState.presentingViewID {
                    // <+4428>
                    transaction = sheet.value.dismissalTransaction(for: presentingViewID)
                } else {
                    // <+4496>
                    transaction = nil
                }
                
                // <+4496>
            }
            
            // <+4496>
            let hasNoModifier: Bool
            if let presentingViewID = self.presentationState.presentingViewID {
                // <+4588>
                if sheet.value.viewIDs.contains(presentingViewID) {
                    // <+4664>
                    hasNoModifier = false
                } else {
                    // <+4704>
                    hasNoModifier = true
                }
            } else {
                // <+4704>
                hasNoModifier = true
            }
            
            let animated: Bool
            if let transaction {
                // <+4676>
                animated = !transaction.disablesAnimations
            } else {
                // <+4716>
                animated = false
            }
            
            // <+4720>
            self.presentationState.presentationDidChange(
                sheetPreference,
                animated: animated,
                hasNoModifier: hasNoModifier
            )
            
            // <+4772>
            if let presentedVC = self.presentationState.resolvedPresentedVC /* inlined */ {
                // <+4996>
                if let sheetPreference {
                    // <+5376>
                    if let transaction {
                        // <+5812>
                        if self.presentationState.hasIdentityMatching(sheetPreference) {
                            // <+5952>
                            self.update(presentation: sheetPreference, in: presentedVC, transaction: transaction)
                            // <+5776>
                            return
                        } else {
                            // <+6264>
                            if let presenter = self.presenterOverride ?? self.host!.uiPresenterViewController {
                                // <+6352>
                                // inlined
                                self.dismissAndPresentAgain(
                                    preference: sheetPreference,
                                    presented: presentedVC,
                                    animated: animated,
                                    hasNoModifier: hasNoModifier,
                                    presenter: presenter
                                )
                                
                                // <+5780>
                                return
                            } else {
                                // <+7028>
                                return
                            }
                        }
                    } else {
                        // <+5428>
                    }
                } else {
                    // <+5056>
                    // <+5428>
                }
                
                // <+5428>
                self.presentationState.dismiss(willPresentAgain: false, hasNoModifier: hasNoModifier)
                
                if hasNoModifier {
                    presentedVC.didPresenterLoseModifierRecursively = true
                }
                
                // <+5504>
                onNextMainRunLoop { [weak self] in
                    // $s7SwiftUI11SheetBridgeC20preferencesDidChangeyyAA16PreferenceValuesVFyycfU4_AA0cH0V3KeyV_Tg5TA
                    NotificationCenter.default.post(
                        name: SheetBridgeNotifications.willDismis,
                        object: nil
                    )
                    
                    let presentingViewController = presentedVC.presentingViewController ?? presentedVC
                    presentingViewController.dismiss(animated: animated) { 
                        // $s7SwiftUI11SheetBridgeC20preferencesDidChangeyyAA16PreferenceValuesVFyycfU4_yycfU_AA0cH0V3KeyV_Tg5TA
                        // $s7SwiftUI11SheetBridgeC20preferencesDidChangeyyAA16PreferenceValuesVFyycfU4_yycfU_AA0cH0V12InspectorKeyV_Tg5Tm
                        guard let self else {
                            return
                        }
                        
                        self.host!.invalidateProperties(.transform, mayDeferUpdate: false)
                    }
                }
                
                // <+5780>
                return
            } else {
                // <+5088>
                guard let presenter = self.presenterOverride ?? self.host!.uiPresenterViewController else {
                    return
                }
                
                // <+5196>
                guard let sheetPreference else {
                    return
                }
                
                // <+6108>
                self.contingentlyPresent(sheetPreference, from: presenter, animated: animated)
                return
            }
        }
    }
    
    // unnamed
    final func _update(environment: EnvironmentValues) {
        // environment = x23
        // x22
        let lastEnvironment = lastEnvironment
        
        if lastEnvironment.presentationWantsTransparentBackground != environment.presentationWantsTransparentBackground {
            // <+244>
            if !environment.presentationWantsTransparentBackground || Geometry3DEffectImpl._affectsLayout {
                // <+320>
                host!.viewGraph.addPreference(ContainerBackgroundKeys.HostTransparency.self)
            } else {
                // <+412>
                host!.viewGraph.removePreference(ContainerBackgroundKeys.HostTransparency.self)
            }
        }
        
        // <+508>
        self.lastEnvironment = environment
    }
    
    // $s7SwiftUI11SheetBridgeC7present33_9124433AF4D3FE5B3E95880733BE7575LL_4from8animated19existingPresentedVC12isPreemptingyAA0C10PreferenceV_So16UIViewControllerCSbAA019PresentationHostingU0CyAA7AnyViewVGSgSbtF
    fileprivate final func present(
        _ preference: SheetPreference,
        from viewController: UIViewController,
        animated: Bool,
        existingPresentedVC: PresentationHostingController<AnyView>?,
        isPreempting: Bool
    ) {
        assertUnimplemented()
    }
    
    final func update(environment: inout EnvironmentValues) {
        /*
         self -> x20 - >x21
         environment -> x0 -> x19
         */
        // <+96>
        // x20
        let copy_1 = self.lastEnvironment
        let w27 = copy_1.presentationWantsTransparentBackground
        let w8 = environment.presentationWantsTransparentBackground
        
        if w27 != w8 {
            // <+236>
            assertUnimplemented()
        }
        
        // <+504>
        self.lastEnvironment = environment
    }
    
    func update(bridgeProperties: inout ViewGraphBridgeProperties) {
        // noop
    }
    
    func update(presentation: SheetPreference, in viewController: PresentationHostingController<AnyView>, transaction: Transaction) {
        assertUnimplemented()
    }
    
    func removePreferences(from graph: ViewGraph) {
        // noop
        assert(type(of: self) == UIKitInspectorBridgeV5<T>.self)
    }
    
    func contingentlyPresent(_ preference: SheetPreference, from viewController: UIViewController, animated: Bool) {
        /*
         self -> x20 -> x19
         preference -> x0 -> x29 - 0xc8
         viewController -> x1 -> x29 - 0xd0
         animated -> w2 -> x29 - 0xbc
         */
        // <+300>
        if self.presentationState.isDismissingFromSheetBridge {
            // <+380>
            if self.presentationState.isDismissalPreemptable && viewController._willPreemptRunningPresentationTransition {
                // <+464>
                if let presentedVC = self.presentationState.presentedVC {
                    presentedVC.wasPreempted = true
                }
                
                self.present(
                    preference,
                    from: viewController,
                    animated: animated,
                    existingPresentedVC: nil,
                    isPreempting: true
                )
            } else {
                // <+928>
                self.presentationState.enqueueDelayedPresentation_IsDismissing(preference, animated: animated)
            }
        } else {
            // <+592>
            // inlined
            if let existingPresentedVC = self.presentationState.configuraPresentation(sheetBridge: self, viewController: viewController, preference: preference, animated: animated) {
                self.present(
                    preference,
                    from: viewController,
                    animated: animated,
                    existingPresentedVC: existingPresentedVC,
                    isPreempting: false
                )
            }
        }
    }
    
    fileprivate final func dismissAndPresentAgain(
        preference: SheetPreference?,
        presented: PresentationHostingController<AnyView>,
        animated: Bool,
        hasNoModifier: Bool,
        presenter: UIViewController
    ) {
        self.presentationState.dismiss(willPresentAgain: true, hasNoModifier: true)
        presented.didPresenterLoseModifierRecursively = true
        
        let completion: () -> Void = { [weak self] in
            // $s7SwiftUI11SheetBridgeC22dismissAndPresentAgain33_9124433AF4D3FE5B3E95880733BE7575LL10preference9presented8animated13hasNoModifier9presenteryAA0C10PreferenceVSg_AA29PresentationHostingControllerCyAA7AnyViewVGS2bSo06UIViewY0CtFyycfU_AL12InspectorKeyV_Tg5TA
            // $s7SwiftUI11SheetBridgeC22dismissAndPresentAgain33_9124433AF4D3FE5B3E95880733BE7575LL10preference9presented8animated13hasNoModifier9presenteryAA0C10PreferenceVSg_AA29PresentationHostingControllerCyAA7AnyViewVGS2bSo06UIViewY0CtFyycfU_AL12InspectorKeyV_Tg5Tm
            // <+460>
            guard
                let self,
                let preference
            else {
                return
            }
            
            // <+584>
            guard self.presentationState.resolvedPresentedVC == nil else {
                return
            }
            
            // <+824>
            let host = presented.host
            host.rootView = preference.content
            // <+1072>
            host.environmentOverride = preference.environment
            // <+1256>
            presented.setupSheet(
                for: .sheetBridge,
                presenter: presenter,
                placement: preference.placement
            )
            
            if let popoverPresentationController = presented.popoverPresentationController {
                popoverPresentationController.configureSourceEntity(with: preference.entityContext)
            }
            
            // <+1320>
            if let presentationController = presented.presentationController as? UISheetPresentationController {
                // <+1432>
                presentationController.configureSourceEntity(with: preference.entityContext)
            } else {
                // <+1384>
                if let popoverPresentationController = presented.popoverPresentationController {
                    let adaptiveSheetPresentationController: UISheetPresentationController?
#if os(visionOS)
                    adaptiveSheetPresentationController = popoverPresentationController.msui_adaptiveSheetPresentationController
#else
                    adaptiveSheetPresentationController = popoverPresentationController.adaptiveSheetPresentationController
#endif
                    
                    if let adaptiveSheetPresentationController {
                        adaptiveSheetPresentationController.configureSourceEntity(with: preference.entityContext)
                    }
                }
            }
            
            // <+1448>
            presenter.present(presented, animated: animated, completion: nil)
            
            // <+1476>
            self.presentationState.present(preference, presentedVC: presented, presentationSeed: self.seed)
        }
        
        Update.enqueueAction(reason: nil) {
            // $s7SwiftUI11SheetBridgeC22dismissAndPresentAgain33_9124433AF4D3FE5B3E95880733BE7575LL10preference9presented8animated13hasNoModifier9presenteryAA0C10PreferenceVSg_AA29PresentationHostingControllerCyAA7AnyViewVGS2bSo06UIViewY0CtFyycfU0_TA
            if
                let transitionCoordinator = presented.transitionCoordinator,
                let presentationController = presented.presentationController
            {
                if presentationController.dismissing() {
                    // <+96>
                    transitionCoordinator.animate(alongsideTransition: nil) { context in
                        completion()
                    }
                    
                    return
                } else {
                    // <+400>
                }
            }
            
            // <+252>
            if animated {
                // <+256>
                let viewController = presented.presentingViewController ?? presented
                // <+288>
                viewController.dismiss(animated: true) {
                    completion()
                }
                
                return
            } else {
                // <+416>
                UIViewController._performWithoutDeferringTransitions {
                    // $s7SwiftUI11SheetBridgeC22dismissAndPresentAgain33_9124433AF4D3FE5B3E95880733BE7575LL10preference9presented8animated13hasNoModifier9presenteryAA0C10PreferenceVSg_AA29PresentationHostingControllerCyAA7AnyViewVGS2bSo06UIViewY0CtFyycfU0_yyXEfU0_TA
                    let viewController = presented.presentingViewController ?? presented
                    viewController.dismiss(animated: false) { 
                        completion()
                    }
                }
            }
        }
    }
}

extension SheetBridge : UIHostingViewDelegate {
    final func hostingView<Content>(_ hostingView: _UIHostingView<Content>, didMoveTo window: UIWindow?) where Content : MySwiftUICore::View {
        assertUnimplemented()
    }
    
    final func hostingView<Content>(_ hostingView: _UIHostingView<Content>, willUpdate values: inout MySwiftUICore::EnvironmentValues) where Content : MySwiftUICore::View {
        assertUnimplemented()
    }
    
    final func hostingView<Content>(_ hostingView: _UIHostingView<Content>, didUpdate values: MySwiftUICore::EnvironmentValues) where Content : MySwiftUICore::View {
        assertUnimplemented()
    }
    
    final func hostingView<Content>(_ hostingView: _UIHostingView<Content>, willUpdate: inout ViewGraphBridgeProperties) where Content : MySwiftUICore::View {
        // noop
    }
    
    final func hostingView<Content>(_ hostingView: _UIHostingView<Content>, didChangePreferences values: MySwiftUICore::PreferenceValues) where Content : MySwiftUICore::View {
        assertUnimplemented()
    }
    
    final func hostingView<Content>(_ hostingView: _UIHostingView<Content>, didChangePlatformItemList: PlatformItemList) where Content : MySwiftUICore::View {
        assertUnimplemented()
    }
    
    final func hostingView<Content>(_ hostingView: _UIHostingView<Content>, willModifyViewInputs inputs: inout MySwiftUICore::_ViewInputs) where Content : MySwiftUICore::View {
        assertUnimplemented()
    }
}

extension SheetBridge : PresentationHostingControllerDismissDelegate {
    nonisolated func didDismissViewController(_ viewController: UIViewController, wasPreempted: Bool) {
        assertUnimplemented()
    }
}

enum SheetBridgeNotifications {
    static let willDismis = Notification.Name(rawValue: "SheetBridgeWillDismiss")
}
