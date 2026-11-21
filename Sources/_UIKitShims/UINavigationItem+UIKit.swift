package import UIKit

extension UINavigationItem {
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS 1.0, *)
    package var msui_searchBarPlacementAllowsExternalIntegration: Bool {
        get {
            return (self as AnyObject).searchBarPlacementAllowsExternalIntegration()
        }
        set {
            (self as AnyObject).setSearchBarPlacementAllowsExternalIntegration(newValue)
        }
    }
    
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS 1.0, *)
    package var msui_subtitle: String? {
        get {
            return (self as AnyObject).subtitle() as String?
        }
        set {
            (self as AnyObject).setSubtitle(newValue as NSString?)
        }
    }
}

fileprivate final class PrivateSelectors {
    @objc(searchBarPlacementAllowsExternalIntegration) func searchBarPlacementAllowsExternalIntegration() -> Bool {
        fatalError()
    }

    @objc(setSearchBarPlacementAllowsExternalIntegration:) func setSearchBarPlacementAllowsExternalIntegration(_ value: Bool) {
        fatalError()
    }

    @objc(subtitle) func subtitle() -> NSString? {
        fatalError()
    }

    @objc(setSubtitle:) func setSubtitle(_ value: NSString?) {
        fatalError()
    }
}
