#warning("TODO")
private import MySwiftUICore
internal import UIKit

class PointerBridge: NSObject {
    weak var host: ViewRendererHost? = nil
    private var interaction: UIPointerInteraction? = nil
    private var hasHoverEffectSeed = VersionSeed.empty
    
    @MainActor override init() {
        _ = UIDevice.current.userInterfaceIdiom
        super.init()
    }
    
    func addPreferences(to viewGraph: ViewGraph) {
        viewGraph.addPreference(HasHoverEffectKey.self)
    }
}

extension PointerBridge: UIPointerInteractionDelegate {
    func pointerInteraction(_ interaction: UIPointerInteraction, regionFor request: UIPointerRegionRequest, defaultRegion: UIPointerRegion) -> UIPointerRegion? {
        fatalError("TODO")
    }
    
    func pointerInteraction(_ interaction: UIPointerInteraction, styleFor region: UIPointerRegion) -> UIPointerStyle? {
        fatalError("TODO")
    }
}
