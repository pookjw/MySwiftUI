// E46BD41EFF334731ECF41B7FAB200F18
internal import MySwiftUICore

extension EnvironmentValues {
    var isEagerNavigationTransitionEnabled: Bool {
        return self[IsEagerNavigationTransitionEnabled.self]
    }
    
    fileprivate struct IsEagerNavigationTransitionEnabled: EnvironmentKey {
        static var defaultValue: Bool {
            return false
        }
    }
}
