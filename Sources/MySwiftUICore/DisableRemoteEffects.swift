
struct DisableRemoteEffects: UserDefaultKeyedFeature {
    static var key: String {
        return "com.apple.SwiftUI.DisableRemoteEffects"
    }
    
    @safe static nonisolated(unsafe) var cachedValue: Bool? = nil
    @safe static nonisolated(unsafe) var defaultFeatureValue: Bool = false    
}

extension DisableRemoteEffects: PropertyKey {
    
}
