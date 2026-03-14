internal import MySwiftUICore

final class SceneBridge {
    private(set) var isAnimatingSceneResize: Bool
    
    init() {
        assertUnimplemented()
    }
    
    final func preferencesDidChange(_ preferenceValues: PreferenceValues) {
        assertUnimplemented()
    }
}
