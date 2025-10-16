package protocol RemoteEffectsAccessibilityProvider {
    
}

extension _GraphInputs {
    var remoteEffectsAccessibilityProvider: (any RemoteEffectsAccessibilityProvider.Type) {
        get {
            return self[RemoteEffectsAccessibilityProviderKey.self]
        }
        set {
            self[RemoteEffectsAccessibilityProviderKey.self] = newValue
        }
        _modify {
            yield &self[RemoteEffectsAccessibilityProviderKey.self]
        }
    }
    
    fileprivate struct RemoteEffectsAccessibilityProviderKey: GraphInput {
        static nonisolated(unsafe) let defaultValue: (any RemoteEffectsAccessibilityProvider.Type) = EmptyRemoteEffectsAccessibilityProvider.self
    }
}

struct EmptyRemoteEffectsAccessibilityProvider: RemoteEffectsAccessibilityProvider {
    
}
