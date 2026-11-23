// FEF45AF34C8E88359DA7C644F5D6873A

extension EnvironmentValues {
    var remoteEffectsDisabled: Bool {
        get {
            return self[RemoteEffectsDisabledTypeKey.self]
        }
        set {
            self[RemoteEffectsDisabledTypeKey.self] = newValue
        }
    }
}

fileprivate struct RemoteEffectsDisabledTypeKey : EnvironmentKey {
    static var defaultValue: Bool {
        return false
    }
}
