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
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        fatalError("TODO")
    }
    
    func pencilInteraction(_ interaction: UIPencilInteraction, didReceiveSqueeze squeeze: UIPencilInteraction.Squeeze) {
        fatalError("TODO")
    }
    
    func pencilInteraction(_ interaction: UIPencilInteraction, didReceiveTap tap: UIPencilInteraction.Tap) {
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
