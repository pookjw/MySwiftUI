package import MySwiftUICore

extension ViewStyleOverrides {
    package mutating func registerDefaultToggleStyleType<S: AnyDefaultStyle & ToggleStyle>(_: S.Type) {
        registerStyleOverride(S.self, for: PlatformFallbackToggleStyle.self)
    }
    
    package mutating func registerStyleOverride<T: AnyDefaultStyle & ToggleStyle, U: ToggleStyle>(_ : T.Type, for: U.Type) {
        registerStyleOverride(U.self, style: ToggleStyleModifier<T>.self)
    }
    
    package mutating func registerDefaultButtonStyleType<T: AnyDefaultStyle & PrimitiveButtonStyle>(_: T.Type) {
        registerStyleOverride(T.self, for: PlatformFallbackButtonStyle.self)
    }
    
    package mutating func registerStyleOverride<T: AnyDefaultStyle & ButtonStyleConvertible & PrimitiveButtonStyle, U: ButtonStyleConvertible & PrimitiveButtonStyle>(_: T.Type, for: U.Type) where T.ButtonStyleRepresentation : AnyDefaultStyle {
        registerStyleOverride(U.self, style: ButtonStyleModifier<T>.self)
        registerStyleOverride(U.self, style: UIKitButtonStyleModifier<T>.self)
    }
    
    package mutating func registerStyleOverride<T: AnyDefaultStyle & PrimitiveButtonStyle, U: PrimitiveButtonStyle>(_: T.Type, for: U.Type) {
        registerStyleOverride(U.self, style: ButtonStyleModifier<T>.self)
    }
    
    package mutating func registerDefaultButtonBehaviorStyleType<T: AnyDefaultStyle & ButtonBehaviorStyle>(_: T.Type) {
        self.registeredStyles[ObjectIdentifier(ButtonBehaviorStyleConfiguration.self)] = ButtonBehaviorStyleModifier<T>.self
    }
    
    package mutating func registerDefaultSliderStyleType<T: AnyDefaultStyle & SliderStyle>(_ type: T.Type) {
        self.registeredStyles[ObjectIdentifier(SliderStyleConfiguration.self)] = DefaultSliderStyleModifier<T>.self
    }
    
    package mutating func registerDefaultStepperStyleType<T: AnyDefaultStyle & StepperStyle>(_ type: T.Type) {
        self.registeredStyles[ObjectIdentifier(StepperStyleConfiguration.self)] = StepperStyleModifier<T>.self
    }
    
    package mutating func registerDefaultGroupBoxStyleType<T: AnyDefaultStyle & GroupBoxStyle>(_ type: T.Type) {
        self.registeredStyles[ObjectIdentifier(GroupBoxStyleConfiguration.self)] = GroupBoxStyleModifier<T>.self
    }
    
    package mutating func registerDefaultHelpStyleType<T: AnyDefaultStyle & HelpStyle>(_ type: T.Type) {
        self.registerStyleOverride(T.self, for: DefaultHelpStyle.self)
    }
    
    mutating func registerStyleOverride<T: AnyDefaultStyle & HelpStyle, U: HelpStyle>(_: T.Type, for: U.Type) {
        registerStyleOverride(U.self, style: HelpStyleModifier<T>.self)
    }
}
