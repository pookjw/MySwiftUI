#warning("TODO")
@_spi(Internal) private import MySwiftUICore
internal import UIKit

final class PointerBridge: NSObject {
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
    
    @MainActor func preferencesDidChange(_ preferenceValues: PreferenceValues) {
        let pref = preferenceValues[HasHoverEffectKey.self]
        
        guard !pref.seed.matches(hasHoverEffectSeed) else {
            return
        }
        
        let host = host!
        
        if let uiView = host.uiView {
            // <+408>
            if let interaction {
                // <+424>
                if !pref.value {
                    uiView.removeInteraction(interaction)
                    self.interaction = nil
                    // <+616>
                } else {
                    // <+616>
                }
            } else {
                // <+520>
                if pref.value {
                    // <+548>
                    let interaction = UIPointerInteraction(delegate: self)
                    uiView.myswiftui_addManagedInteraction(interaction)
                    self.interaction = interaction
                    // <+616>
                } else {
                    // <+736>
                    // interaction이 존재하면 <+424>로 갈 것이며 이는 불가능함
                    // <+616>
                }
            }
             
            // <+616>
            hasHoverEffectSeed = pref.seed
        } else {
            // <+496>
            // nop
            return
        }
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
