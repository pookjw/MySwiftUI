package protocol PrivacyReductionAccessibilityProvider: ViewModifier {
    
}

extension _GraphInputs {
    var privacyReductionAccessibilityProvider: (any PrivacyReductionAccessibilityProvider.Type) {
        get {
            return self[PrivacyReductionAccessibilityProviderKey.self]
        }
        set {
            self[PrivacyReductionAccessibilityProviderKey.self] = newValue
        }
        _modify {
            yield &self[PrivacyReductionAccessibilityProviderKey.self]
        }
    }
    
    fileprivate struct PrivacyReductionAccessibilityProviderKey: GraphInput {
        static let defaultValue: (any PrivacyReductionAccessibilityProvider.Type) = EmptyPrivacyReductionAccessibilityProvider.self
    }
}

struct EmptyPrivacyReductionAccessibilityProvider: PrivacyReductionAccessibilityProvider {
    func body(content: Content) -> some View {
        fatalError("TODO")
    }
}
