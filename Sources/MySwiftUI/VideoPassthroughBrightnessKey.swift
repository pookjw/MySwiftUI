internal import MySwiftUICore
internal import MRUIKit
internal import Foundation

struct VideoPassthroughBrightnessKey : MRUIBridgedPreferenceKey, HostPreferenceKey {
    static var defaultValue: VideoPassthroughBrightnessKey.PreferredValue? {
        return nil
    }
    
    static func reduce(value: inout VideoPassthroughBrightnessKey.PreferredValue?, nextValue: () -> VideoPassthroughBrightnessKey.PreferredValue?) {
        if value == nil {
            value = nextValue()
        }
    }
    
    static var bridgedKey: MRUIPreferenceKey<NSNumber>.Type {
        return MRUIVideoPassthroughBrightnessPreferenceKey.self
    }
    
    static func bridgedValue(from value: VideoPassthroughBrightnessKey.PreferredValue?) -> NSNumber? {
        guard let value else {
            return nil
        }
        
        return value.brightness as NSNumber
    }
    
    static func value(from bridgedValue: NSNumber?) -> VideoPassthroughBrightnessKey.PreferredValue? {
        guard let brightness = bridgedValue?.doubleValue else {
            return nil
        }
        
        return VideoPassthroughBrightnessKey.PreferredValue(
            brightness: (brightness + 1.0) * 0.5,
            animation: nil
        )
    }
    
    static func animation(from value: VideoPassthroughBrightnessKey.PreferredValue?) -> Animation? {
        return value?.animation
    }
}

extension VideoPassthroughBrightnessKey {
    struct PreferredValue : Equatable {
        fileprivate private(set) var brightness: Double
        fileprivate private(set) var animation: Animation?
    }
}
