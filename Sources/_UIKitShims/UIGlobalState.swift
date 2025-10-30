internal import Observation
private import Foundation

@Observable
@MainActor
final class UIGlobalState {
    static nonisolated let shared = UIGlobalState()
    
    private var storedIsLowPowerModeEnabled: Bool? = nil
    private var storedIsReduceTransparencyEnabled: Bool? = nil
    private var storedIsReduceMotionEnabled: Bool? = nil
    private var storedIsButtonShapesEnabled: Bool? = nil
    
    private nonisolated init() {}
    
    // ___lldb_unnamed_symbol318931
    var isLowPowerModeEnabled: Bool {
        if let storedIsLowPowerModeEnabled {
            return storedIsLowPowerModeEnabled
        }
        
        _ = NotificationCenter.default.addObserver(forName: .NSProcessInfoPowerStateDidChange, object: nil, queue: nil) { notification in
            Task { @MainActor in
                // ___lldb_unnamed_symbol318933
                self.storedIsLowPowerModeEnabled = ProcessInfo.processInfo.isLowPowerModeEnabled
            }
        }
        
        let isLowPowerModeEnabled = ProcessInfo.processInfo.isLowPowerModeEnabled
        storedIsButtonShapesEnabled = isLowPowerModeEnabled
        return isLowPowerModeEnabled
    }
}
