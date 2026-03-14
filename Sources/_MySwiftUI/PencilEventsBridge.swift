// 529D8C04C25882F5257970E33225224A
internal import UIKit
@_spi(Internal) internal import MySwiftUICore

final class PencilEventsBridge: NSObject, UIPencilInteractionDelegate {
    weak var host: ViewRendererHost? = nil
    private var wantsPencilEventsSeed: VersionSeed = .empty
    private var pencilInteraction: UIPencilInteraction? = nil
    private var preferredTapActionContext: UInt8 = 0
    private var preferredSqueezeActionContext: UInt8 = 0
    private var pencilDoubleTapSerial: Int = 0
    private var pencilSqueezeSerial: Int = 0
    
    override init() {
        super.init()
    }
    
    // 원래 없음
    @inlinable
    func addPreferences(to viewGraph: ViewGraph) {
        viewGraph.addPreference(WantsPencilEventsKey.self)
    }
    
    // 원래 없음
    @inlinable
    func preferencesDidChange(_ preferenceValues: PreferenceValues) {
        self.updateState(wantsPencilEvents: preferenceValues[WantsPencilEventsKey.self])
    }
    
    func updateEnvironment(_ environmentValues: inout EnvironmentValues) {
        // environmentValues -> x0 -> x20
        environmentValues.preferredPencilDoubleTapAction = PencilPreferredAction(UIPencilInteraction.preferredTapAction)
        environmentValues.preferredPencilSqueezeAction = PencilPreferredAction(UIPencilInteraction.preferredSqueezeAction)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        fatalError("TODO")
    }
    
    func pencilInteraction(_ interaction: UIPencilInteraction, didReceiveSqueeze squeeze: UIPencilInteraction.Squeeze) {
        fatalError("TODO")
    }
    
    func pencilInteraction(_ interaction: UIPencilInteraction, didReceiveTap tap: UIPencilInteraction.Tap) {
        fatalError("TODO")
    }
    
    fileprivate func updateState(wantsPencilEvents: PreferenceValues.Value<Bool>) {
        /*
         self -> x20 -> x19
         wantsPencilEvents -> x0 -> x22
         */
        guard !wantsPencilEvents.seed.matches(self.wantsPencilEventsSeed) else {
            return
        }
        
        fatalError("TODO")
    }
}

struct WantsPencilEventsKey: HostPreferenceKey {
    static var defaultValue: Bool {
        return false
    }
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        fatalError("TODO")
    }
}

extension PencilPreferredAction {
    @_transparent fileprivate init(_ uiPencilPreferredAction: UIPencilPreferredAction) {
        switch uiPencilPreferredAction {
        case .ignore:
            self = .ignore
        case .switchEraser:
            self = .switchEraser
        case .switchPrevious:
            self = .switchPrevious
        case .showColorPalette:
            self = .showColorPalette
        case .showInkAttributes:
            self = .showInkAttributes
        case .showContextualPalette:
            self = .showContextualPalette
        case .runSystemShortcut:
            self = .runSystemShortcut
        @unknown default:
            self = .ignore
        }
    }
}
