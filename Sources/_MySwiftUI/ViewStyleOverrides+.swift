package import MySwiftUICore

extension ViewStyleOverrides {
    package mutating func registerDefaultToggleStyleType<S: AnyDefaultStyle & ToggleStyle>(_ type: S.Type) {
        registerStyleOverride(type, for: PlatformFallbackToggleStyle.self)
    }
    
    package mutating func registerStyleOverride<T: AnyDefaultStyle & ToggleStyle, U: ToggleStyle>(_ : T.Type, for: U.Type) {
        registerStyleOverride(U.self, style: ToggleStyleModifier<T>.self)
    }
    
    package mutating func registerDefaultButtonStyleType<T: AnyDefaultStyle & PrimitiveButtonStyle>(_ type: T.Type) {
        registerStyleOverride(T.self, for: PlatformFallbackButtonStyle.self)
    }
    
    package func registerStyleOverride<T: AnyDefaultStyle & ButtonStyleConvertible & PrimitiveButtonStyle, U: ButtonStyleConvertible & PrimitiveButtonStyle>(_: T.Type, for: U.Type) where T.ButtonStyleRepresentation : AnyDefaultStyle {
        assertUnimplemented()
    }
    
    package mutating func registerStyleOverride<T: AnyDefaultStyle & PrimitiveButtonStyle, U: PrimitiveButtonStyle>(_: T.Type, for: U.Type) {
        registerStyleOverride(U.self, style: ButtonStyleModifier<T>.self)
    }
    
    package func registerDefaultButtonBehaviorStyleType<T: AnyDefaultStyle & ButtonBehaviorStyle>(_ type: T.Type) {
        assertUnimplemented()
    }
    
    package func registerDefaultSliderStyleType<T: AnyDefaultStyle & SliderStyle>(_ type: T.Type) {
        assertUnimplemented()
    }
    
    package func registerDefaultStepperStyleType<T: AnyDefaultStyle & StepperStyle>(_ type: T.Type) {
        assertUnimplemented()
    }
    
    package func registerDefaultGroupBoxStyleType<T: AnyDefaultStyle & GroupBoxStyle>(_ type: T.Type) {
        assertUnimplemented()
    }
    
    package func registerDefaultHelpStyleType<T: AnyDefaultStyle & HelpStyle>(_ type: T.Type) {
        assertUnimplemented()
    } 
}
