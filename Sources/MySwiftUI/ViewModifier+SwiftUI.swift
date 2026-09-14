internal import MySwiftUICore

extension ViewModifier {
    nonisolated func requiring<T : ViewInputPredicate>(_: T.Type) -> StaticIf<T, Self, EmptyModifier> {
        return StaticIf(T.self, then: self)
    }
}
