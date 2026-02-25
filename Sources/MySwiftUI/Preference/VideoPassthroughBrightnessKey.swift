internal import MySwiftUICore
internal import MRUIKit

struct VideoPassthroughBrightnessKey: MRUIBridgedPreferenceKey, HostPreferenceKey {
    static var defaultValue: VideoPassthroughBrightnessKey.PreferredValue? {
        return nil
    }
    
    static func reduce(value: inout VideoPassthroughBrightnessKey.PreferredValue?, nextValue: () -> VideoPassthroughBrightnessKey.PreferredValue?) {
        fatalError("TODO")
    }
    
    static var bridgedKey: MRUIPreferenceKey<NSNumber>.Type {
        return MRUIVideoPassthroughBrightnessPreferenceKey.self
    }
    
    static func bridgedValue(from value: VideoPassthroughBrightnessKey.PreferredValue?) -> NSNumber? {
        fatalError()
    }
    
    static func value(from bridgedValue: NSNumber?) -> VideoPassthroughBrightnessKey.PreferredValue? {
        fatalError()
    }
    
    static func animation(from value: VideoPassthroughBrightnessKey.PreferredValue?) -> Animation? {
        fatalError()
    }
}

extension VideoPassthroughBrightnessKey {
    struct PreferredValue {
        // TODO
    }
}
