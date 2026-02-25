internal import MySwiftUICore
internal import MRUIKit

struct UpperLimbsVisibilityKey: MRUIBridgedPreferenceKey, HostPreferenceKey {
    static var defaultValue: UpperLimbsVisibilityKey.PreferredValue? {
        return nil
    }
    
    static func reduce(value: inout UpperLimbsVisibilityKey.PreferredValue?, nextValue: () -> UpperLimbsVisibilityKey.PreferredValue?) {
        fatalError("TODO")
    }
    
    static var bridgedKey: MRUIPreferenceKey<NSNumber>.Type {
        return MRUIUpperLimbsVisibilityPreferenceKey.self
    }
    
    static func bridgedValue(from value: UpperLimbsVisibilityKey.PreferredValue?) -> NSNumber? {
        fatalError()
    }
    
    static func value(from bridgedValue: NSNumber?) -> UpperLimbsVisibilityKey.PreferredValue? {
        fatalError()
    }
    
    static func animation(from value: UpperLimbsVisibilityKey.PreferredValue?) -> Animation? {
        fatalError()
    }
}

extension UpperLimbsVisibilityKey {
    struct PreferredValue {
        // TODO
    }
}
