// 333E2209AFE841F0F3215E9AA4F7EA22
internal import MySwiftUICore

struct ResetScrollEnvironmentModifier : ViewModifier {
    fileprivate private(set) var axes: Axis.Set
    
    func body(content: Content) -> some View {
        assertUnimplemented()
    }
}

extension ResetScrollEnvironmentModifier {
    fileprivate struct ResetTransform {
        private var axes: Axis.Set
    }
    
    fileprivate struct AdditionalResetModifier {
    }
}

extension View {
    func resetScrollEnvironment() -> some View {
        self.modifier(ResetScrollEnvironmentModifier(axes: .both))
    }
}
