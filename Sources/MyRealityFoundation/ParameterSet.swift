@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public struct ParameterSet {
    @preconcurrency @MainActor public subscript<T>(name: String, type: T.Type = T.self) -> BindableValue<T>? where T : BindableData {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}
