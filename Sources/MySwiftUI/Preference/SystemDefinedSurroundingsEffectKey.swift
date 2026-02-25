internal import MySwiftUICore
internal import MRUIKit

struct SystemDefinedSurroundingsEffectKey: MRUIBridgedPreferenceKey, HostPreferenceKey {
    static var defaultValue: SystemDefinedSurroundingsEffectKey.PreferredValue? {
        return nil
    }
    
    static func reduce(value: inout SystemDefinedSurroundingsEffectKey.PreferredValue?, nextValue: () -> SystemDefinedSurroundingsEffectKey.PreferredValue?) {
        fatalError("TODO")
    }
    
    static var bridgedKey: MRUIPreferenceKey<NSNumber>.Type {
        return MRUIPreferredDarknessPreferenceKey.self
    }
    
    static func bridgedValue(from value: SystemDefinedSurroundingsEffectKey.PreferredValue?) -> NSNumber? {
        fatalError()
    }
    
    static func value(from bridgedValue: NSNumber?) -> SystemDefinedSurroundingsEffectKey.PreferredValue? {
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
