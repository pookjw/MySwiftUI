// 46AF493CB757ED2F6F4798255A451BB8
internal import MySwiftUICore
private import AttributeGraph

extension View {
    func resetTabViewEnvironment() -> some View {
        self.modifier(ResetTabViewEnvironmentModifier())
    }
}

fileprivate struct ResetTabViewEnvironmentModifier : EnvironmentModifier, PrimitiveViewModifier {
    static func makeEnvironment(modifier: Attribute<ResetTabViewEnvironmentModifier>, environment: inout EnvironmentValues) {
        assertUnimplemented()
    }
}
