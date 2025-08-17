internal import MySwiftUICore
internal import RealitySimulationServices
internal import MRUIKit

struct PreferredAnchoredPlaneKey: MRUIBridgedPreferenceKey, HostPreferenceKey {
    static var defaultValue: PreferredValue? {
        return PreferredValue()
    }
    
    static var bridgedKey: MRUIPreferenceKey<RSSPlacementTarget>.Type {
        fatalError()
    }
    
    static func bridgedValue(from value: PreferredValue?) -> RSSPlacementTarget? {
        fatalError()
    }
    
    static func value(from bridgedValue: RSSPlacementTarget?) -> PreferredValue? {
        fatalError()
    }
    
    static func animation(from value: PreferredValue?) -> Animation? {
        fatalError()
    }
}

extension PreferredAnchoredPlaneKey {
    struct PreferredValue {
        var plane: AnchoredPlane = .vertical
        var animation: Animation?
    }
}
