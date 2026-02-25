internal import MySwiftUICore
internal import MRUIKit

struct SupportedVolumeViewpointsKey: MRUIBridgedPreferenceKey, HostPreferenceKey {
    static var defaultValue: SupportedVolumeViewpointsKey.PreferredValue? {
        return nil
    }
    
    static func reduce(value: inout SupportedVolumeViewpointsKey.PreferredValue?, nextValue: () -> SupportedVolumeViewpointsKey.PreferredValue?) {
        fatalError("TODO")
    }
    
    static var bridgedKey: MRUIPreferenceKey<AnyObject>.Type {
        fatalError()
    }
    
    static func bridgedValue(from value: SupportedVolumeViewpointsKey.PreferredValue?) -> AnyObject? {
        fatalError()
    }
    
    static func value(from bridgedValue: AnyObject?) -> SupportedVolumeViewpointsKey.PreferredValue? {
        fatalError()
    }
    
    static func animation(from value: SupportedVolumeViewpointsKey.PreferredValue?) -> Animation? {
        fatalError()
    }
}

extension SupportedVolumeViewpointsKey {
    struct PreferredValue {
        var supportedViewpoints: SquareAzimuth.Set
        var animation: Animation?
    }
}
