package protocol BridgedEnvironmentResolver {
    static func read<T : EnvironmentKey>(for key: T.Type, from environment: EnvironmentValues) -> T.Value
    
    static func write<T : EnvironmentKey>(for key: T.Type, to environment: inout EnvironmentValues, value: T.Value)
}
