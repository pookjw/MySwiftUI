internal import MySwiftUICore

struct ButtonStyleModifier<Style>: StyleModifier {
    var style: Style
    
    func styleBody(configuration: PrimitiveButtonStyleConfiguration) -> some View {
        assertUnimplemented()
    }
}
