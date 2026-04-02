internal import MySwiftUICore

struct ToggleStyleModifier<Style> : StyleModifier {
    var style: Style
    
    func styleBody(configuration: ToggleStyleConfiguration) -> some View {
        assertUnimplemented()
    }
}
