internal import MySwiftUICore

extension ViewModifier {
    nonisolated func requiring<T : ViewInputPredicate>(_: T.Type) -> StaticIf<T, Self, EmptyModifier> {
        assertUnimplemented()
    }
}
