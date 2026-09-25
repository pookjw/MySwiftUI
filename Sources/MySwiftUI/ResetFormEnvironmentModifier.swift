// C6D6D0A9BE1249CB98B58BCAAEB4AE75
internal import MySwiftUICore
private import AttributeGraph

extension View {
    func resetFormEnvironment() -> some View {
        self.modifier(ResetFormEnvironmentModifier())
    }
}

fileprivate struct ResetFormEnvironmentModifier : EnvironmentModifier, PrimitiveViewModifier {
    static func makeEnvironment(modifier: Attribute<ResetFormEnvironmentModifier>, environment: inout EnvironmentValues) {
        environment.formInsets = FormInsetsKey.defaultValue
        environment.formRowInfoVisibility = .automatic
        environment.formRowAccessoryVisibility = .automatic
        environment.effectiveFormStyle = nil
    }
}
