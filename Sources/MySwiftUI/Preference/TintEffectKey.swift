internal import MySwiftUICore
internal import MRUIKit

struct TintEffectKey: MRUIBridgedPreferenceKey, HostPreferenceKey {
    static var defaultValue: TintEffectKey.PreferredValue? {
        return nil
    }
    
    static func reduce(value: inout TintEffectKey.PreferredValue?, nextValue: () -> TintEffectKey.PreferredValue?) {
        fatalError("TODO")
    }
    
    static var bridgedKey: MRUIPreferenceKey<AnyObject>.Type {
        fatalError()
    }
    
    static func bridgedValue(from value: TintEffectKey.PreferredValue?) -> AnyObject? {
        fatalError()
    }
    
    static func value(from bridgedValue: AnyObject?) -> TintEffectKey.PreferredValue? {
        fatalError()
    }
    
    static func animation(from value: TintEffectKey.PreferredValue?) -> Animation? {
        fatalError()
    }
}

extension TintEffectKey {
    struct PreferredValue {
        // TODO
    }
}
