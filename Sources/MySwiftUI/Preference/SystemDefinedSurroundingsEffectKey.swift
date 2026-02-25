internal import MySwiftUICore
internal import MRUIKit

struct SystemDefinedSurroundingsEffectKey: MRUIBridgedPreferenceKey, HostPreferenceKey {
    static var defaultValue: SystemDefinedSurroundingsEffectKey.PreferredValue? {
        return nil
    }
    
    static func reduce(value: inout SystemDefinedSurroundingsEffectKey.PreferredValue?, nextValue: () -> SystemDefinedSurroundingsEffectKey.PreferredValue?) {
        fatalError("TODO")
    }
    
    static var bridgedKey: MRUIPreferenceKey<AnyObject>.Type {
        fatalError()
    }
    
    static func bridgedValue(from value: SystemDefinedSurroundingsEffectKey.PreferredValue?) -> AnyObject? {
        fatalError()
    }
    
    static func value(from bridgedValue: AnyObject?) -> SystemDefinedSurroundingsEffectKey.PreferredValue? {
        fatalError()
    }
    
    static func animation(from value: SystemDefinedSurroundingsEffectKey.PreferredValue?) -> Animation? {
        fatalError()
    }
}

extension SystemDefinedSurroundingsEffectKey {
    struct PreferredValue {
        // TODO
    }
}
