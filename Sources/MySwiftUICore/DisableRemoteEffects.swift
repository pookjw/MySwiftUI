
struct DisableRemoteEffects : UserDefaultKeyedFeature {
    static var key: String {
        return "com.apple.SwiftUI.DisableRemoteEffects"
    }
    
    @safe nonisolated(unsafe) static var cachedValue: Bool? = nil
    @safe nonisolated(unsafe) static var defaultFeatureValue: Bool = false    
}

extension DisableRemoteEffects : PropertyKey {
    
}
