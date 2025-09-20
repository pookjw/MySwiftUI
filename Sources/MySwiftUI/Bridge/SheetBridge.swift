#warning("TODO")
@_spi(Internal) internal import MySwiftUICore
internal import UIKit

final class SheetBridge<T>: NSObject {
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
    
    // inlined from $s7SwiftUI14_UIHostingViewC04rootD0ACyxGx_tcfcTf4gn_n
    // 원래 없음
    @inlinable
    func addPreferences(to viewGraph: ViewGraph) {
        viewGraph.addPreference(SheetPreference.Key.self)
        viewGraph.addPreference(ContainerBackgroundKeys.HostTransparency.self)
        viewGraph.addPreference(PresentationOptionsPreferenceKey.self)
        viewGraph.addPreference(InteractiveDismissAttemptKey.self)
        viewGraph.addPreference(InteractiveDismissDisabledKey.self)
        viewGraph.addPreference(RemotePresentationDelayKey.self)
    }
    
    @MainActor
    func didMoveToWindow() {
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
    
    func preferencesDidChange(_ preferenceValues: PreferenceValues) {
        fatalError("TODO")
    }
    
    private func present(_: SheetPreference, from: UIViewController, animated: Bool, existingPresentedVC: PresentationHostingController<AnyView>?, isPreempting: Bool) {
        fatalError("TODO")
    }
}
