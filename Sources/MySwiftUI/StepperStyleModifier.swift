struct StepperStyleModifier<Style> {
    private var style: Style
    
    init(style: Style) {
        self.style = style
    }
    
    func styleBody(configuration: StepperStyleConfiguration) -> some View {
        assertUnimplemented()
    }
}
