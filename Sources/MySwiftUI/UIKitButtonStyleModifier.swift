internal import MySwiftUICore

struct UIKitButtonStyleModifier<Style> : StyleModifier {
    var style: Style
    
    init(style: Style) {
        self.style = style
    }
    
    func styleBody(configuration: UIKitButtonConfiguration) -> some View {
        assertUnimplemented()
    }
}

struct UIKitButtonConfiguration {
    // TODO
}
