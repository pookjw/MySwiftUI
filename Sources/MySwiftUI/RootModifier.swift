// 4475FD12FD59DEBA453321BD91F6EA04
internal import MySwiftUICore
internal import UIKit
private import AttributeGraph

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
        content
            .modifier(
                RootEnvironmentModifier(
                    sceneBridge: sceneBridge,
                    sceneDelegateBox: sceneDelegateBox,
                    sceneStorageValues: sceneStorageValues,
                    scenePhase: scenePhase,
                    sceneID: sceneID,
                    connectionOptions: connectionOptions
                )
            )
        
        // TODO
    }
}

fileprivate struct RootEnvironmentModifier: PrimitiveViewModifier, _GraphInputsModifier {
    private(set) weak var sceneBridge: SceneBridge?
    private(set) weak var sceneDelegateBox: AnyFallbackDelegateBox?
    private(set) weak var sceneStorageValues: SceneStorageValues?
    private(set) var scenePhase: ScenePhase
    private(set) var sceneID: SceneID?
    private(set) var connectionOptions: UIScene.ConnectionOptions?
    
    static func _makeInputs(modifier: MySwiftUICore._GraphValue<RootEnvironmentModifier>, inputs: inout MySwiftUICore._GraphInputs) {
        assertUnimplemented()
    }
}

extension RootEnvironmentModifier {
    struct Child: StatefulRule {
        @Attribute private(set) var modifier: RootEnvironmentModifier
        @Attribute private(set) var env: EnvironmentValues
        private(set) var oldModifier: RootEnvironmentModifier?
        
        typealias Value = Never // TODO
        
        func updateValue() {
            assertUnimplemented()
        }
    }
}
