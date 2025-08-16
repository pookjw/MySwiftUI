#warning("TODO")
internal import UIKit
@_spi(Internal) internal import MySwiftUICore

class FocusBridge {
    var flags: Flags = []
    weak var _host: (UIView & FocusBridgeProvider & FocusHost)? = nil
    var focusStore: FocusStore = FocusStore()
    var currentEnvironment: EnvironmentValues = EnvironmentValues()
    var _focusItem: FocusItem? = nil
    weak var parentFocusBridge: FocusBridge? = nil
    var requestedFocusItem: FocusItem? = nil
    var defaultFocusNamespace: Namespace.ID? = nil
    var ignoreTextFocusEvents: Bool = false
}

extension FocusBridge {
    struct Flags: OptionSet {
        var rawValue: Int
    }
}

protocol FocusBridgeProvider {
    
}

protocol FocusHost: AnyObject {
    
}

struct FocusStore {
    var version: DisplayList.Version = DisplayList.Version()
    var focusedResponders: [WeakBox<ViewResponder>] = []
    var plists: [ObjectIdentifier: PropertyList] = [:]
}

struct FocusItem {
    
}
