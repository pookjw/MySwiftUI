internal import MySwiftUICore

extension View {
    func clearNavigationContext() -> some View {
        self
            .modifier(ClearNavigationContextModifier())
            .environment(\.isNavigationEnabledInternal, .unknown)
            .environment(\.navigationSelectionSeed, .invalid)
    }
}

struct ClearNavigationContextModifier : PrimitiveViewModifier, ViewInputsModifier {
    nonisolated static func _makeViewInputs(modifier: _GraphValue<ClearNavigationContextModifier>, inputs: inout _ViewInputs) {
        // inputs -> x1 -> x19
        assertUnimplemented()
    }
}
