package protocol PrivacyReductionAccessibilityProvider {
    associatedtype Modifier : ViewModifier
    static func makeModifier(shouldRedact: Bool) -> Modifier
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
    
    fileprivate struct PrivacyReductionAccessibilityProviderKey : GraphInput {
        @safe static nonisolated(unsafe) let defaultValue: (any PrivacyReductionAccessibilityProvider.Type) = EmptyPrivacyReductionAccessibilityProvider.self
    }
}

struct EmptyPrivacyReductionAccessibilityProvider : PrivacyReductionAccessibilityProvider {
    static func makeModifier(shouldRedact: Bool) -> EmptyModifier {
        return EmptyModifier()
    }
}
