internal import MySwiftUICore
internal import RealitySimulationServices
internal import MRUIKit

struct PreferredAnchoredPlaneKey: MRUIBridgedPreferenceKey, HostPreferenceKey {
    static var defaultValue: PreferredAnchoredPlaneKey.PreferredValue? {
        return nil
    }
    
    static func reduce(value: inout PreferredAnchoredPlaneKey.PreferredValue?, nextValue: () -> PreferredAnchoredPlaneKey.PreferredValue?) {
        fatalError("TODO")
    }
    
    static var bridgedKey: MRUIPreferenceKey<RSSPlacementTarget>.Type {
        return MRUIPlacementTargetKey.self
    }
    
    static func bridgedValue(from value: PreferredAnchoredPlaneKey.PreferredValue?) -> RSSPlacementTarget? {
        fatalError()
    }
    
    static func value(from bridgedValue: RSSPlacementTarget?) -> PreferredAnchoredPlaneKey.PreferredValue? {
        fatalError()
    }
    
    static func animation(from value: PreferredAnchoredPlaneKey.PreferredValue?) -> Animation? {
        fatalError()
    }
}

extension PreferredAnchoredPlaneKey {
    struct PreferredValue {
        var plane: AnchoredPlane
        var animation: Animation?
    }
}
