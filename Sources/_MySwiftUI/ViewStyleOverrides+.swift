package import MySwiftUICore

extension ViewStyleOverrides {
    package func registerDefaultToggleStyleType<S: AnyDefaultStyle & ToggleStyle>(_ type: S.Type) {
        assertUnimplemented()
    }
    
    package func registerStyleOverride<T: AnyDefaultStyle & ToggleStyle, U: ToggleStyle>(_: T.Type, for: U.Type) {
        assertUnimplemented()
    }
    
    package func registerDefaultButtonStyleType<T: AnyDefaultStyle & PrimitiveButtonStyle>(_ type: T.Type) {
        assertUnimplemented()
    }
    
    package func registerStyleOverride<T: AnyDefaultStyle & ButtonStyleConvertible & PrimitiveButtonStyle, U: ButtonStyleConvertible & PrimitiveButtonStyle>(_: T.Type, for: U.Type) where T.ButtonStyleRepresentation : AnyDefaultStyle {
        assertUnimplemented()
    }
}
