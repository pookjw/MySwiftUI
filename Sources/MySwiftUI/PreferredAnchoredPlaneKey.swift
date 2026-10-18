@_spi(Internal) internal import MySwiftUICore
internal import RealitySimulationServices
internal import MRUIKit

struct PreferredAnchoredPlaneKey : MRUIBridgedPreferenceKey, HostPreferenceKey {
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
        guard value != nil else {
            return nil
        }
        
        // <+340>
        assertUnimplemented()
    }
    
    static func value(from bridgedValue: RSSPlacementTarget?) -> PreferredAnchoredPlaneKey.PreferredValue? {
        /*
         bridgedValue -> x0 -> x21
         return pointer -> x8 -> x19
         */
        // <+188>
        guard let bridgedValue else {
            return nil
        }
        
        let plane: AnchoredPlane?
        switch bridgedValue.anchoredPlane() {
        case .vertical:
            // <+212>
            plane = .vertical
        case .horizontal:
            // <+276>
            plane = .horizontal
        default:
            // <+332>
            plane = nil
        }
        
        // <+336>
        guard let plane else {
            return nil
        }
        
        // <+444>
        return PreferredAnchoredPlaneKey.PreferredValue(plane: plane, animation: nil)
    }
    
    static func animation(from value: PreferredAnchoredPlaneKey.PreferredValue?) -> Animation? {
        return value?.animation
    }
}

extension PreferredAnchoredPlaneKey {
    struct PreferredValue : Equatable {
        var plane: AnchoredPlane
        var animation: Animation?
    }
}
