internal import MySwiftUICore
internal import RealitySimulationServices
internal import MRUIKit

struct PreferredAnchoredPlaneKey: MRUIBridgedPreferenceKey, HostPreferenceKey {
    static var defaultValue: PreferredAnchoredPlaneKey.PreferredValue? {
        return nil
    }
    
    static func reduce(value: inout PreferredAnchoredPlaneKey.PreferredValue?, nextValue: () -> PreferredAnchoredPlaneKey.PreferredValue?) {
        /*
         value -> x0 -> x19
         nextValue -> x1 -> x21
         */
        // <+108>
        if value == nil {
            value = nextValue()
        }
    }
    
    static var bridgedKey: MRUIPreferenceKey<RSSPlacementTarget>.Type {
        return MRUIPlacementTargetKey.self
    }
    
    static func bridgedValue(from value: PreferredAnchoredPlaneKey.PreferredValue?) -> RSSPlacementTarget? {
        // value -> x0 -> x23 -> x24
        guard let value else {
            return nil
        }
        
        // <+340>
        fatalError("TODO")
    }
    
    static func value(from bridgedValue: RSSPlacementTarget?) -> PreferredAnchoredPlaneKey.PreferredValue? {
        fatalError("TODO")
    }
    
    static func animation(from value: PreferredAnchoredPlaneKey.PreferredValue?) -> Animation? {
        return value?.animation
    }
}

extension PreferredAnchoredPlaneKey {
    struct PreferredValue: Equatable {
        var plane: AnchoredPlane
        var animation: Animation?
    }
}
