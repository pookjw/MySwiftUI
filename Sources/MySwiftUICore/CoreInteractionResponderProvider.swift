
package protocol CoreInteractionResponderProvider {
    // TODO
}

extension _GraphInputs {
    package var coreInteractionResponderProvider: (any CoreInteractionResponderProvider.Type)? {
        get {
            return self[CoreInteractionResponderProviderKey.self]
        }
        set {
            self[CoreInteractionResponderProviderKey.self] = newValue
        }
        _modify {
            yield &self[CoreInteractionResponderProviderKey.self]
        }
    }
    
    fileprivate struct CoreInteractionResponderProviderKey: GraphInput {
        static var defaultValue: (any CoreInteractionResponderProvider.Type)? {
            return nil
        }
    }
}
