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
    private var base: FocusItem.Base
    private var prefersFocusSystem: Bool
    private weak var responder: FocusResponder?
    private var version: DisplayList.Version
}

extension FocusItem {
    struct ViewItem {
        private var id: ViewIdentity
        private var isFocusable: Bool
        private var options: FocusableOptions
        private var onFocusChange: (Bool) -> ()
    }
}

extension FocusItem {
    fileprivate enum Base {
        case view(FocusItem.ViewItem)
        case platformItem
        case platformResponder(WeakBox<UIView>)
    }
}

struct FocusableOptions: OptionSet {
    static var fromMouse: FocusableOptions { return FocusableOptions(rawValue: 1 << 0) }
    static var fromKeyboard: FocusableOptions { return FocusableOptions(rawValue: 1 << 1) }
    static var platformItemDrawsFocusRingMask: FocusableOptions { return FocusableOptions(rawValue: 1 << 2) }
    static var platformContainerHandlesFocus: FocusableOptions { return FocusableOptions(rawValue: 1 << 3) }
    static var preventNavigationToSubviews: FocusableOptions { return FocusableOptions(rawValue: 1 << 4) }
    static var all: FocusableOptions { return [.fromMouse, .fromKeyboard, .platformItemDrawsFocusRingMask] /* 0x7 */ }
    
    let rawValue: Int
}
