internal import MySwiftUICore
internal import MRUIKit

struct VolumeBaseplateVisibilityKey: MRUIBridgedPreferenceKey, HostPreferenceKey {
    static var defaultValue: VolumeBaseplateVisibilityKey.PreferredValue? {
        return nil
    }
    
    static func reduce(value: inout VolumeBaseplateVisibilityKey.PreferredValue?, nextValue: () -> VolumeBaseplateVisibilityKey.PreferredValue?) {
        fatalError("TODO")
    }
    
    static var bridgedKey: MRUIPreferenceKey<NSNumber>.Type {
        return MRUIVolumeBaseplateVisibilityPreferenceKey.self
    }
    
    static func bridgedValue(from value: VolumeBaseplateVisibilityKey.PreferredValue?) -> NSNumber? {
        fatalError()
    }
    
    static func value(from bridgedValue: NSNumber?) -> VolumeBaseplateVisibilityKey.PreferredValue? {
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
