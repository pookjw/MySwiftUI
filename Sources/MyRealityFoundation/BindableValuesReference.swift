@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public struct BindableValuesReference {
    @preconcurrency @MainActor public subscript<T>(bindTarget: BindTarget, type: T.Type = T.self) -> BindableValue<T>? where T : BindableData {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}
