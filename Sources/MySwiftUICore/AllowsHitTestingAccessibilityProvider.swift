package protocol AllowsHitTestingAccessibilityProvider {
    static func makeView(modifier: _GraphValue<_AllowsHitTestingModifier>, inputs: _ViewInputs, outputs: inout _ViewOutputs)
}

extension _GraphInputs {
    var allowsHitTestingAccessibilityProvider: (any AllowsHitTestingAccessibilityProvider.Type) {
        get {
            return self[AllowsHitTestingAccessibilityProviderKey.self]
        }
        set {
            self[AllowsHitTestingAccessibilityProviderKey.self] = newValue
        }
        _modify {
            yield &self[AllowsHitTestingAccessibilityProviderKey.self]
        }
    }
    
    fileprivate struct AllowsHitTestingAccessibilityProviderKey : GraphInput {
        @safe static nonisolated(unsafe) let defaultValue: (any AllowsHitTestingAccessibilityProvider.Type) = EmptyAllowsHitTestingAccessibilityProvider.self
    }
}

struct EmptyAllowsHitTestingAccessibilityProvider : AllowsHitTestingAccessibilityProvider {
    static func makeView(modifier: _GraphValue<_AllowsHitTestingModifier>, inputs: _ViewInputs, outputs: inout _ViewOutputs) {
        assertUnimplemented()
    }
}

@frozen public struct _AllowsHitTestingModifier : ViewModifier, Equatable, Sendable {
    public var allowsHitTesting: Bool

    @inlinable public init(allowsHitTesting: Bool) {
        self.allowsHitTesting = allowsHitTesting
    }

    nonisolated public static func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }

    public static func == (a: Self, b: Self) -> Bool {
        assertUnimplemented()
    }

    public typealias Body = Never
}

extension View {
    @inlinable nonisolated public func allowsHitTesting(_ enabled: Bool) -> some View {
        return modifier(_AllowsHitTestingModifier(allowsHitTesting: enabled))
    }
}
