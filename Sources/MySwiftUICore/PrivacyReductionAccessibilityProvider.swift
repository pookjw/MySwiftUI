package protocol PrivacyReductionAccessibilityProvider: ViewModifier {
    
}

extension _GraphInputs {
    var privacyReductionAccessibilityProvider: (any PrivacyReductionAccessibilityProvider.Type) {
        get {
            return unsafe self[PrivacyReductionAccessibilityProviderKey.self]
        }
        set {
            unsafe self[PrivacyReductionAccessibilityProviderKey.self] = newValue
        }
        _modify {
            yield unsafe &self[PrivacyReductionAccessibilityProviderKey.self]
        }
    }
    
    fileprivate struct PrivacyReductionAccessibilityProviderKey: @unsafe GraphInput {
        static nonisolated(unsafe) let defaultValue: (any PrivacyReductionAccessibilityProvider.Type) = EmptyPrivacyReductionAccessibilityProvider.self
    }
}

struct EmptyPrivacyReductionAccessibilityProvider: PrivacyReductionAccessibilityProvider {
    func body(content: Content) -> some View {
        fatalError("TODO")
    }
}
