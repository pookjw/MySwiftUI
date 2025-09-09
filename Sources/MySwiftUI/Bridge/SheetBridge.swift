#warning("TODO")
internal import MySwiftUICore
internal import Foundation
private import UIKit

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
    
    func addPreferences(to viewGraph: ViewGraph) {
        viewGraph.addPreference(SheetPreference.Key.self)
        viewGraph.addPreference(ContainerBackgroundKeys.HostTransparency.self)
        viewGraph.addPreference(PresentationOptionsPreferenceKey.self)
        viewGraph.addPreference(InteractiveDismissAttemptKey.self)
        viewGraph.addPreference(InteractiveDismissDisabledKey.self)
        viewGraph.addPreference(RemotePresentationDelayKey.self)
    }
}
