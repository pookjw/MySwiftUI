package protocol RemoteEffectsAccessibilityProvider {
    
}

extension _GraphInputs {
    var remoteEffectsAccessibilityProvider: (any RemoteEffectsAccessibilityProvider.Type) {
        get {
            return unsafe self[RemoteEffectsAccessibilityProviderKey.self]
        }
        set {
            unsafe self[RemoteEffectsAccessibilityProviderKey.self] = newValue
        }
        _modify {
            yield unsafe &self[RemoteEffectsAccessibilityProviderKey.self]
        }
    }
    
    fileprivate struct RemoteEffectsAccessibilityProviderKey: @unsafe GraphInput {
        static nonisolated(unsafe) let defaultValue: (any RemoteEffectsAccessibilityProvider.Type) = EmptyRemoteEffectsAccessibilityProvider.self
    }
}

struct EmptyRemoteEffectsAccessibilityProvider: RemoteEffectsAccessibilityProvider {
    
}
