private import Foundation
private import MySwiftUICore

enum UIKitUpdateCycle {
    static let defaultUseSetNeedsLayout: Bool = {
        let userDefaults = UserDefaults.standard
        if let object = UserDefaults.standard.object(forKey: "UseSetNeedsLayoutForUpdates") {
            return userDefaults.bool(forKey: "UseSetNeedsLayoutForUpdates")
        } else {
            return isLinkedOnOrAfter(.v7)
        }
    }()
}
