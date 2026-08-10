// B21176D76BE25DD1BEC9B79F48A5E748
internal import MySwiftUICore

extension EnvironmentValues {
    var currentSystemHoverEffect: SystemHoverEffect.Info? {
        return self[EnvironmentValues.CurrentSystemHoverEffect.self]
    }
    
    fileprivate struct CurrentSystemHoverEffect : EnvironmentKey {
        @safe static nonisolated(unsafe) let defaultValue: SystemHoverEffect.Info? = nil
    }
}
