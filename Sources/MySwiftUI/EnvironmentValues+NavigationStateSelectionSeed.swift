// FA9B221468DB7811B9A34680092C3E74
internal import MySwiftUICore

extension EnvironmentValues {
    var navigationSelectionSeed: NavigationState.SelectionSeed {
        get {
            return self[NavigationStateSelectionSeed.self]
        }
        set {
            self[NavigationStateSelectionSeed.self] = newValue
        }
    }
}

fileprivate struct NavigationStateSelectionSeed : EnvironmentKey {
    static let defaultValue = NavigationState.SelectionSeed.invalid
}
