internal import MySwiftUICore

struct RealityViewConvertibleKey : PreferenceKey {
    @safe static nonisolated(unsafe) let defaultValue: [RealityViewConvertible] = []
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        assertUnimplemented()
    }
}

struct RealityViewConvertible {
    // TODO
}
