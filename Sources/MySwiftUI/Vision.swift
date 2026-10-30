private import UIKit

@MainActor func isVisionInterfaceIdiom() -> Bool {
    struct Cache {
        @MainActor static let isEnabled = UIDevice.current.userInterfaceIdiom == .vision
    }
    
    return Cache.isEnabled
}
