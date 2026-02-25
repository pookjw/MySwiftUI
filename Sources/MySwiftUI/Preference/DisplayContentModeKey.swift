internal import MySwiftUICore
internal import MRUIKit

struct DisplayContentModeKey: MRUIBridgedPreferenceKey, HostPreferenceKey {
    static var defaultValue: DisplayContentModeKey.PreferredValue? {
        return nil
    }
    
    static func reduce(value: inout DisplayContentModeKey.PreferredValue?, nextValue: () -> DisplayContentModeKey.PreferredValue?) {
        fatalError("TODO")
    }
    
    static var bridgedKey: MRUIPreferenceKey<AnyObject>.Type {
        fatalError()
    }
    
    static func bridgedValue(from value: DisplayContentModeKey.PreferredValue?) -> AnyObject? {
        fatalError()
    }
    
    static func value(from bridgedValue: AnyObject?) -> DisplayContentModeKey.PreferredValue? {
        fatalError()
    }
    
    static func animation(from value: DisplayContentModeKey.PreferredValue?) -> Animation? {
        fatalError()
    }
}

extension DisplayContentModeKey {
    struct PreferredValue {
        var displayContentMode: DisplayContentMode
        var animation: Animation?
    }
}
