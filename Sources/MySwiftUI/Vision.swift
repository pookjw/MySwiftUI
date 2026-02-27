private import UIKit

@MainActor fileprivate let isEnabled = UIDevice.current.userInterfaceIdiom == .vision

@MainActor func isVisionInterfaceIdiom() -> Bool {
    return isEnabled
}
