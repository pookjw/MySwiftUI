@_spi(Internal) internal import MySwiftUICore
internal import UIKit

class SheetBridge<T>: NSObject {
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
    private weak var presenterOverride: UIViewController? = nil
    private var lastEnvironment = EnvironmentValues()
    
    override init() {
        super.init()
    }
    
    @inlinable
    final func addPreferences(to viewGraph: ViewGraph) {
        viewGraph.addPreference(SheetPreference.Key.self)
        viewGraph.addPreference(ContainerBackgroundKeys.HostTransparency.self)
        viewGraph.addPreference(PresentationOptionsPreferenceKey.self)
        viewGraph.addPreference(InteractiveDismissAttemptKey.self)
        viewGraph.addPreference(InteractiveDismissDisabledKey.self)
        viewGraph.addPreference(RemotePresentationDelayKey.self)
    }
    
    @MainActor
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
            
            self.presentationState = presentationState
        } else {
            hasWindow = false
        }
    }
    
    @MainActor final func preferencesDidChange(_ preferenceValues: PreferenceValues) {
        /*
         self = x28
         preferenceValues = x21
         */
        // x29 - 0xe8
        let sheetPreferenceValue = preferenceValues[SheetPreference.Key.self]
        // x29 - 0x70
        let lastEnvironment = lastEnvironment
        // x29 - 0x88
        let presentationWantsTransparentBackground = lastEnvironment.presentationWantsTransparentBackground
        
        // x25
        let value: PreferenceValues.Value<ContainerBackgroundKeys.Transparency>
        if presentationWantsTransparentBackground {
            // <+1892>
            value = PreferenceValues.Value(value: .transparent, seed: .empty)
        } else {
            // <+1936>
            value = preferenceValues[ContainerBackgroundKeys.HostTransparency.self]
        }
        
        // <+1968>
        // x29 - 0xd8
        let presentationOptions = preferenceValues[PresentationOptionsPreferenceKey.self]
        
        // x22
        let interactiveDismissAttempt = preferenceValues[InteractiveDismissAttemptKey.self]
        
        if !interactiveDismissHandlerSeed.seed.matches(interactiveDismissAttempt.seed) {
            // <+2128>
            interactiveDismissHandlerSeed = VersionSeedTracker<InteractiveDismissAttemptKey>(seed: interactiveDismissAttempt.seed)
            interactiveDismissHandler = interactiveDismissAttempt.value
        }
        
        // <+2252>
        _ = consume presentationWantsTransparentBackground
        
        // x20
        // x23 = address
        let host = self.host!
        // x19
        if let uiViewController = host.uiViewController as? PresentationHostingController<AnyView> {
            // <+2376>
            fatalError("TODO")
        }
        
        // <+2824>
        if self.seed.matches(value.seed) {
            // <+2960>
            if self.host!.uiViewController != nil {
                // <+4384>
                return
            } else {
                // <+3036>
                fatalError("TODO")
            }
            fatalError("TODO")
        } else {
            // <+3816>
            fatalError("TODO")
        }
        fatalError("TODO")
    }
    
    // ___lldb_unnamed_symbol264926
    @MainActor
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
    
    private final func present(_: SheetPreference, from: UIViewController, animated: Bool, existingPresentedVC: PresentationHostingController<AnyView>?, isPreempting: Bool) {
        fatalError("TODO")
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
            fatalError("TODO")
        }
        
        // <+504>
        self.lastEnvironment = environment
    }
    
    func update(bridgeProperties: inout ViewGraphBridgeProperties) {
        // nop
    }
    
    final func removePreferences(from graph: ViewGraph) {
        fatalError("TODO")
    }
}

extension SheetBridge: UIHostingViewDelegate {
    final func hostingView<Content>(_ hostingView: _UIHostingView<Content>, didMoveTo window: UIWindow?) where Content : MySwiftUICore.View {
        fatalError("TODO")
    }
    
    final func hostingView<Content>(_ hostingView: _UIHostingView<Content>, willUpdate values: inout MySwiftUICore.EnvironmentValues) where Content : MySwiftUICore.View {
        fatalError("TODO")
    }
    
    final func hostingView<Content>(_ hostingView: _UIHostingView<Content>, didUpdate values: MySwiftUICore.EnvironmentValues) where Content : MySwiftUICore.View {
        fatalError("TODO")
    }
    
    final func hostingView<Content>(_ hostingView: _UIHostingView<Content>, willUpdate: inout ViewGraphBridgeProperties) where Content : MySwiftUICore.View {
        // nop
    }
    
    final func hostingView<Content>(_ hostingView: _UIHostingView<Content>, didChangePreferences values: MySwiftUICore.PreferenceValues) where Content : MySwiftUICore.View {
        fatalError("TODO")
    }
    
    final func hostingView<Content>(_ hostingView: _UIHostingView<Content>, didChangePlatformItemList: PlatformItemList) where Content : MySwiftUICore.View {
        fatalError("TODO")
    }
    
    final func hostingView<Content>(_ hostingView: _UIHostingView<Content>, willModifyViewInputs inputs: inout MySwiftUICore._ViewInputs) where Content : MySwiftUICore.View {
        fatalError("TODO")
    }
}
