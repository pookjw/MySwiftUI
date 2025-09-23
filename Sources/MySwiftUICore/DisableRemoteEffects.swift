#warning("TODO")

struct DisableRemoteEffects: @unsafe UserDefaultKeyedFeature {
    static var key: String {
        return "com.apple.SwiftUI.DisableRemoteEffects"
    }
    
    static nonisolated(unsafe) var cachedValue: Bool? = nil
    static nonisolated(unsafe) var defaultFeatureValue: Bool = false    
}

extension DisableRemoteEffects: @unsafe PropertyKey {
    
}
