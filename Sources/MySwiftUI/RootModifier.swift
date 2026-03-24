internal import MySwiftUICore
internal import UIKit

fileprivate nonisolated(unsafe) var appRootViewWrappers: [(AnyView) -> AnyView] = []

func registerAppRootModifier<T: ViewModifier>(_ modifier: T) {
    assertUnimplemented()
}

@inline(__always) // 원래 없음
func resolveAppRootView(_ view: AnyView) -> AnyView {
    var view = view
    for wrapper in unsafe appRootViewWrappers {
        view = wrapper(view)
    }
    return view
}

struct RootModifier: ViewModifier {
    private(set) weak var sceneBridge: SceneBridge?
    private(set) weak var sceneDelegateBox: AnyFallbackDelegateBox?
    private(set) weak var sceneStorageValues: SceneStorageValues?
    private(set) var presentationDataValue: AnyHashable?
    private(set) var scenePhase: ScenePhase
    private(set) var sceneID: SceneID?
    private(set) var connectionOptions: UIScene.ConnectionOptions?
    private(set) var _rootFocusScope: Namespace
    
    func body(content: _ViewModifier_Content<Self>) -> some View {
        assertUnimplemented()
    }
}
