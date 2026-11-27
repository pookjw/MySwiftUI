internal import MySwiftUICore

struct UITraitBridgedEnvironmentResolver : BridgedEnvironmentResolver {
    static func read<T : EnvironmentKey>(for key: T.Type, from environment: EnvironmentValues) -> T.Value {
        assertUnimplemented()
    }

    static func write<T : EnvironmentKey>(for key: T.Type, to environment: inout EnvironmentValues, value: T.Value) {
        assertUnimplemented()
    }
}
