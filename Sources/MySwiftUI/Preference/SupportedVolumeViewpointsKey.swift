internal import MySwiftUICore
internal import MRUIKit
internal import Foundation

struct SupportedVolumeViewpointsKey: MRUIBridgedPreferenceKey, HostPreferenceKey {
    static var defaultValue: SupportedVolumeViewpointsKey.PreferredValue? {
        return nil
    }
    
    static func reduce(value: inout SupportedVolumeViewpointsKey.PreferredValue?, nextValue: () -> SupportedVolumeViewpointsKey.PreferredValue?) {
        fatalError("TODO")
    }
    
    static var bridgedKey: MRUIPreferenceKey<NSNumber>.Type {
        return MRUISupportedVolumeViewpointsPreferenceKey.self
    }
    
    static func bridgedValue(from value: SupportedVolumeViewpointsKey.PreferredValue?) -> NSNumber? {
        guard let value else {
            return nil
        }
        
        return value.supportedViewpoints.rawValue as NSNumber
    }
    
    static func value(from bridgedValue: NSNumber?) -> SupportedVolumeViewpointsKey.PreferredValue? {
        guard let bridgedValue else {
            return nil
        }
        
        return SupportedVolumeViewpointsKey.PreferredValue(
            supportedViewpoints: SquareAzimuth.Set(rawValue: bridgedValue.intValue),
            animation: nil
        )
    }
    
    static func animation(from value: SupportedVolumeViewpointsKey.PreferredValue?) -> Animation? {
        return value?.animation
    }
}

extension SupportedVolumeViewpointsKey {
    struct PreferredValue: Equatable {
        var supportedViewpoints: SquareAzimuth.Set
        var animation: Animation?
    }
}
