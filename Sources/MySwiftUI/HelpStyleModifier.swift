internal import MySwiftUICore

struct HelpStyleModifier<Style> : StyleModifier {
    var style: Style
    
    init(style: Style) {
        self.style = style
    }
    
    func styleBody(configuration: HelpStyleConfiguration) -> some View {
        assertUnimplemented()
    }
}

struct HelpStyleConfiguration {
    // TODO
}
