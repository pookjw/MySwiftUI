internal import MySwiftUICore
internal import AttributeGraph

struct AccessibilityFocusStore {
    // 기본 값들 : $s7SwiftUI22AccessibilityViewGraphV5graphAcA0dE0C_tcfC
    private var version = DisplayList.Version()
//    private var matchData: [AccessibilityEnabledTechnology : [AccessibilityFocus.Match : Set<UniqueID>]] = [:]
    private var plists: [ObjectIdentifier : PropertyList] = [:]
}

extension _GraphInputs {
    // 원래 없음
    var accessibilityFocusStore: OptionalAttribute<AccessibilityFocusStore> {
        get {
            return self[AccessibilityFocusStoreInputKey.self]
        }
        set {
            self[AccessibilityFocusStoreInputKey.self] = newValue
        }
        _modify {
            yield &self[AccessibilityFocusStoreInputKey.self]
        }
    }
}

fileprivate struct AccessibilityFocusStoreInputKey: ViewInput {
    static var defaultValue: OptionalAttribute<AccessibilityFocusStore> {
        return OptionalAttribute()
    }
}
