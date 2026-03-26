internal import MySwiftUICore
private import Foundation

@MainActor
final class ScenePresentationBridge {
    private var presentedSceneValueSeed = VersionSeedTracker<PresentedSceneValueKey>(seed: .invalid)
    private let encoder = JSONEncoder()
    weak var host: ViewRendererHost? = nil
    
    init() {}
    
    final func preferencesDidChange(_ preferenceValues: PreferenceValues) {
        assertUnimplemented()
    }
}

struct PresentedSceneValueKey: HostPreferenceKey {
    static var defaultValue: Never {
        assertUnimplemented()
    }
    
    static func reduce(value: inout Never, nextValue: () -> Never) {
        assertUnimplemented()
    }
}
