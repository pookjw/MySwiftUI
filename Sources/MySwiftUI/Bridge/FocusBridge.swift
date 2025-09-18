#warning("TODO")
internal import UIKit
@_spi(Internal) internal import MySwiftUICore

final class FocusBridge {
    private var flags: Flags = []
    weak var _host: (UIView & FocusBridgeProvider & FocusHost)? = nil
    private(set) var focusStore = FocusStore()
    private var currentEnvironment: EnvironmentValues = EnvironmentValues()
    private var _focusItem: FocusItem? = nil
    private weak var parentFocusBridge: FocusBridge? = nil
    private var requestedFocusItem: FocusItem? = nil
    private var defaultFocusNamespace: Namespace.ID? = nil
    private var ignoreTextFocusEvents: Bool = false
    
    var host: (UIView & FocusBridgeProvider & FocusHost)? {
        guard let host = _host else {
            if let logger = Log.focus {
                logger.log(level: .default, "Focus bridge \(String(describing: self)) has no host.")
            }
            return nil
        }
        
        return host
    }
    
    // inlined from $s7SwiftUI14_UIHostingViewC04rootD0ACyxGx_tcfcTf4gn_n
    // 원래 없음
    @inlinable
    func addPreferences(to viewGraph: ViewGraph) {
        if let host = self.host {
            let viewGraph = host.viewGraph
            viewGraph.addPreference(FocusedValueList.Key.self)
            viewGraph.addPreference(FocusStoreList.Key.self)
        }
    }
}

extension FocusBridge {
    struct Flags: OptionSet {
        var rawValue: Int
    }
}

protocol FocusBridgeProvider: ViewRendererHost {
    
}

protocol FocusHost: AnyObject {
    
}

struct FocusStore {
    var version = DisplayList.Version()
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

struct FocusedValueList {
    private var items: [FocusedValueList.Item]
}

extension FocusedValueList {
    struct Item {
        private var version: DisplayList.Version
        private var isFocused: Bool
        private var update: (inout FocusedValues) -> ()
    }
    
    struct Key: HostPreferenceKey {
        typealias Value = Never? // TODO
    }
}

struct FocusStoreList {
    private var items: [FocusStoreList.Item]
}

extension FocusStoreList {
    struct Item {
        private var version: DisplayList.Version
        private var propertyID: ObjectIdentifier
//        private var bindingUpdateAction: FocusStateBindingUpdateAction
//        private var storeUpdateAction: FocusStoreUpdateAction
        private weak var responder: ResponderNode?
        private weak var bridge: FocusBridge?
        private var isFocused: Bool
    }
    
    struct Key: HostPreferenceKey {
        typealias Value = Never? // TODO
    }
}
