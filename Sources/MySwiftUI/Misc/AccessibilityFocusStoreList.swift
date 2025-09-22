#warning("TODO")
internal import MySwiftUICore

struct AccessibilityFocusStoreList {
    private var items: [AccessibilityFocusStoreList.Item] = []
    
    var version: DisplayList.Version {
        fatalError("TODO")
    }
}

extension AccessibilityFocusStoreList {
    struct Item {
        // TODO
    }
    
    struct Key: HostPreferenceKey {
        static var defaultValue: AccessibilityFocusStoreList {
            return AccessibilityFocusStoreList()
        }
    }
}
