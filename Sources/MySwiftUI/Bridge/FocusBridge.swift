#warning("TODO")
internal import UIKit
@_spi(Internal) internal import MySwiftUICore
internal import AttributeGraph

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
    
    var isHostContainedInFocusedItem: Bool {
        guard let host else {
            return false
        }
        
        guard let focusSystem = UIFocusSystem.focusSystem(for: host) else {
            return false
        }
        
        guard let focusedItem = focusSystem.focusedItem else {
            return false
        }
        
        return focusedItem.contains(host)
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
    
    func preferencesDidChange(_ preferenceValues: PreferenceValues) {
        /*
         self = x29, #-0xf8
         preferenceValues = x29, #-0xa8
         */
        guard let host else {
            return
        }
        
        // x21 / x29 - 0x8 - 0x100
        let focusStoreList = preferenceValues[FocusStoreList.Key.self]
        let value_1 = focusStoreList.value
        
        // x27
        var version_1 = DisplayList.Version()
        for item in value_1 {
            version_1.combine(with: item.version)
        }
        
        // <+840>
        // self = x28
        // x24
        let focusStore = self.focusStore
        
        if focusStore.version != version_1 {
            // <+1024>
            //x29 - 0x88
            let value = focusStoreList.value
            // x22
            var version = DisplayList.Version()
            fatalError("TODO")
        }
        
        // <+1244>
        // x22
        let focusedValueList = preferenceValues[FocusedValueList.Key.self]
        // x29 - 0x88
        let values_2 = focusedValueList.value
        // x27
        let version_2 = values_2.version
        // x24
        let focusedValues = host.focusedValues
        
        if focusedValues.version == version_2 {
            // <+1484>
            // <+1864>
            return
        } else {
            // <+1516>
            fatalError("TODO")
        }
        fatalError("TODO")
    }
    
    func updateEnvironment(_ environmentValues: inout EnvironmentValues) {
        guard let host else {
            return
        }
        
        environmentValues.focusBridge = self
        
        if !environmentValues.isFocused {
            environmentValues.isFocused = isHostContainedInFocusedItem
        }
        
        // <+360>
        // x24
        if let window = host.window {
            environmentValues.isPlatformFocusSystemEnabled = (UIFocusSystem.focusSystem(for: window) != nil)
        }
        
        // <+480>
        if self.currentEnvironment.preferenceBridge != nil {
            if environmentValues.preferenceBridge != nil {
                // <+796>
            } else {
                // <+688>
                if let host = self.host {
                    // <+700>
                    host.viewGraph.addPreference(FocusedValueList.Key.self)
                    host.viewGraph.addPreference(FocusStoreList.Key.self)
                    // <+796>
                } else {
                    // <+792>
                }
            }
        } else {
            // <+572>
            if environmentValues.preferenceBridge != nil {
                // <+584>
                if let host = self.host {
                    // <+600>
                    host.viewGraph.removePreference(FocusedValueList.Key.self)
                    host.viewGraph.removePreference(FocusStoreList.Key.self)
                    // <+784>
                } else {
                    // <+792>
                }
            } else {
                // <+792>
            }
        }
        
        // <+796>
        self.currentEnvironment = environmentValues
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
    var focustedItem: FocusItem? {
        get
    }
    
    var focusedValues: FocusedValues {
        get
        set
    }
    
    func focus(item: FocusItem)
    func focusDidChange()
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
    private var items: [FocusedValueList.Item] = []
    
    var version: DisplayList.Version {
        var version = DisplayList.Version()
        
        for item in items {
            version = max(version, item.version)
        }
        
        return version
    }
}

extension FocusedValueList {
    struct Item {
        fileprivate var version: DisplayList.Version
        private var isFocused: Bool
        private var update: (inout FocusedValues) -> ()
    }
    
    struct Key: HostPreferenceKey {
        static var defaultValue: FocusedValueList {
            return FocusedValueList()
        }
        
        static func reduce(value: inout FocusedValueList, nextValue: () -> FocusedValueList) {
            fatalError("TODO")
        }
    }
}

struct FocusStoreList: Equatable, Collection {
    private var items: [FocusStoreList.Item]
    
    init() {
        items = []
    }
    
    func index(after i: [FocusStoreList.Item].Index) -> [FocusStoreList.Item].Index {
        return items.index(after: i)
    }
    
    var indices: [FocusStoreList.Item].Indices {
        return items.indices
    }
    
    var startIndex: [FocusStoreList.Item].Index {
        return items.startIndex
    }
    
    var endIndex: [FocusStoreList.Item].Index {
        return items.endIndex
    }
    
    func makeIterator() -> [FocusStoreList.Item].Iterator {
        return items.makeIterator()
    }
    
    subscript(position: Int) -> FocusStoreList.Item {
        _read {
            yield items[position]
        }
    }
    
    static func == (lhs: FocusStoreList, rhs: FocusStoreList) -> Bool {
        var displayList_1 = DisplayList.Version()
        for item in lhs.items {
            displayList_1.combine(with: item.version)
        }
        
        var displayList_2 = DisplayList.Version()
        for item in rhs.items {
            displayList_2.combine(with: item.version)
        }
        
        return displayList_1 == displayList_2
    }
    
    func replaceSubrange<C>(_ subrange: Range<[FocusStoreList.Item].Index>, with newElements: C) where C : Collection, C.Element == FocusStoreList.Item {
        fatalError("TODO")
    }
}

extension FocusStoreList {
    struct Item {
        private(set) var version: DisplayList.Version
        private var propertyID: ObjectIdentifier
//        private var bindingUpdateAction: FocusStateBindingUpdateAction
//        private var storeUpdateAction: FocusStoreUpdateAction
        private weak var responder: ResponderNode?
        private weak var bridge: FocusBridge?
        private var isFocused: Bool
    }
    
    struct Key: HostPreferenceKey {
        static var defaultValue: FocusStoreList {
            return FocusStoreList()
        }
        
        static func reduce(value: inout FocusStoreList, nextValue: () -> FocusStoreList) {
            fatalError("TODO")
        }
    }
}

extension EnvironmentValues {
    var focusBridge: FocusBridge? {
        get {
            return self[FocusBridgeKey.self].base
        }
        set {
            self[FocusBridgeKey.self] = WeakBox(newValue)
        }
    }
}

fileprivate struct FocusBridgeKey: EnvironmentKey {
    static var defaultValue: WeakBox<FocusBridge> {
        return WeakBox(nil)
    }
}

struct UIKitHostContainerFocusItemInput: ViewInput {
    static nonisolated(unsafe) let defaultValue = Attribute<WeakBox<UIView>>(identifier: .empty) 
}

extension _ViewInputs {
    // 원래 없음
    var uiKitHostContainerFocusItem: Attribute<WeakBox<UIView>> {
        get {
            return self[UIKitHostContainerFocusItemInput.self]
        }
        set {
            self[UIKitHostContainerFocusItemInput.self] = newValue
        }
        _modify {
            yield &self[UIKitHostContainerFocusItemInput.self]
        }
    }
}
