#warning("TODO")
internal import UIKit
internal import MySwiftUICore

class UIKitStatusBarBridge {
    var statusBarHidden: Bool? = nil
    var _shouldDeferToChildViewController: Bool? = nil
    var seedTracker: VersionSeedSetTracker = VersionSeedSetTracker()
    weak var host: ViewRendererHost? = nil
}
