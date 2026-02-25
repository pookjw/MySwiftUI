internal import MySwiftUICore
internal import MRUIKit

struct VideoPassthroughBrightnessKey: MRUIBridgedPreferenceKey, HostPreferenceKey {
    static var defaultValue: VideoPassthroughBrightnessKey.PreferredValue? {
        return VideoPassthroughBrightnessKey.PreferredValue(brightness: 0, animation: nil)
    }
    
    static func reduce(value: inout VideoPassthroughBrightnessKey.PreferredValue?, nextValue: () -> VideoPassthroughBrightnessKey.PreferredValue?) {
        fatalError("TODO")
    }
    
    static var bridgedKey: MRUIPreferenceKey<AnyObject>.Type {
        fatalError()
    }
    
    static func bridgedValue(from value: VideoPassthroughBrightnessKey.PreferredValue?) -> AnyObject? {
        fatalError()
    }
    
    static func value(from bridgedValue: AnyObject?) -> VideoPassthroughBrightnessKey.PreferredValue? {
        fatalError()
    }
    
    static func animation(from value: VideoPassthroughBrightnessKey.PreferredValue?) -> Animation? {
        fatalError()
    }
}

extension VideoPassthroughBrightnessKey {
    struct PreferredValue {
        var brightness: Double
        var animation: Animation?
    }
}
