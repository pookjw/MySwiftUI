private import Foundation
private import MySwiftUICore

enum UIKitUpdateCycle {
    static let defaultUseSetNeedsLayout: Bool = {
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: "UseSetNeedsLayoutForUpdates") != nil {
            return userDefaults.bool(forKey: "UseSetNeedsLayoutForUpdates")
        } else {
            return isLinkedOnOrAfter(.v7)
        }
    }()
}
