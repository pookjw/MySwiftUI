internal import MySwiftUICore
internal import MRUIKit

struct VolumeBaseplateVisibilityKey: MRUIBridgedPreferenceKey, HostPreferenceKey {
    static var defaultValue: VolumeBaseplateVisibilityKey.PreferredValue? {
        return nil
    }
    
    static func reduce(value: inout VolumeBaseplateVisibilityKey.PreferredValue?, nextValue: () -> VolumeBaseplateVisibilityKey.PreferredValue?) {
        fatalError("TODO")
    }
    
    static var bridgedKey: MRUIPreferenceKey<AnyObject>.Type {
        fatalError()
    }
    
    static func bridgedValue(from value: VolumeBaseplateVisibilityKey.PreferredValue?) -> AnyObject? {
        fatalError()
    }
    
    static func value(from bridgedValue: AnyObject?) -> VolumeBaseplateVisibilityKey.PreferredValue? {
        fatalError()
    }
    
    static func animation(from value: VolumeBaseplateVisibilityKey.PreferredValue?) -> Animation? {
        fatalError()
    }
}

extension VolumeBaseplateVisibilityKey {
    struct PreferredValue {
        // TODO
    }
}
