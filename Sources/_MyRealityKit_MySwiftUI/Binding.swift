public import MySwiftUICore

@available(visionOS 26.0, iOS 26.0, macCatalyst 26.0, tvOS 26.0, macOS 26.0, *)
extension Binding where Value == Entity.Observable.Components {
    public subscript<C>(componentType: C.Type) -> Binding<C?> where C : Component {
        get {
            assertUnimplemented()
        }
    }
}

@available(visionOS 26.0, iOS 26.0, macCatalyst 26.0, tvOS 26.0, macOS 26.0, *)
extension Binding where Value == Entity.Observable.Components {
    public subscript<C>(componentType: C.Type) -> Binding<C?> where C : _ImplicitlyAnimatableBuiltinComponent {
        get {
            assertUnimplemented()
        }
    }
}
