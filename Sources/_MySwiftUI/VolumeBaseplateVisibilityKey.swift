internal import MySwiftUICore
internal import MRUIKit

struct VolumeBaseplateVisibilityKey: MRUIBridgedPreferenceKey, HostPreferenceKey {
    static var defaultValue: VolumeBaseplateVisibilityKey.PreferredValue? {
        return nil
    }
    
    static func reduce(value: inout VolumeBaseplateVisibilityKey.PreferredValue?, nextValue: () -> VolumeBaseplateVisibilityKey.PreferredValue?) {
        if value == nil {
            value = nextValue()
        }
    }
    
    static var bridgedKey: MRUIPreferenceKey<NSNumber>.Type {
        return MRUIVolumeBaseplateVisibilityPreferenceKey.self
    }
    
    static func bridgedValue(from value: VolumeBaseplateVisibilityKey.PreferredValue?) -> NSNumber? {
        guard let value else {
            return nil
        }
        
        return value.visibility.rawValue as NSNumber
    }
    
    static func value(from bridgedValue: NSNumber?) -> VolumeBaseplateVisibilityKey.PreferredValue? {
        guard let bridgedValue else {
            return nil
        }
        
        guard let visibility = Visibility(rawValue: bridgedValue.intValue) else {
            return nil
        }
        
        return VolumeBaseplateVisibilityKey.PreferredValue(
            visibility: visibility,
            animation: nil
        )
    }
    
    static func animation(from value: VolumeBaseplateVisibilityKey.PreferredValue?) -> Animation? {
        return value?.animation
    }
}

extension VolumeBaseplateVisibilityKey {
    struct PreferredValue: Equatable {
        fileprivate private(set) var visibility: Visibility
        fileprivate private(set) var animation: Animation?
    }
}
