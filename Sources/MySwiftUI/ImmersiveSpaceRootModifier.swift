internal import MySwiftUICore

struct ImmersiveSpaceRootModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .input(IsInImmersiveContext.self)
    }
}
