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
    
    func body(content: Content) -> some View {
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
            .presentedSceneValue(presentationDataValue)
            .modifier(
                StaticIf(
                    ClientSideSceneClipping3DDuringResize.self,
                    then: Clipped3DDuringSceneResizeModifier()
                )
            )
    }
}

fileprivate struct RootEnvironmentModifier: PrimitiveViewModifier, _GraphInputsModifier {
    private(set) weak var sceneBridge: SceneBridge?
    private(set) weak var sceneDelegateBox: AnyFallbackDelegateBox?
    private(set) weak var sceneStorageValues: SceneStorageValues?
    private(set) var scenePhase: ScenePhase
    private(set) var sceneID: SceneID?
    private(set) var connectionOptions: UIScene.ConnectionOptions?
    
    static func _makeInputs(modifier: _GraphValue<RootEnvironmentModifier>, inputs: inout _GraphInputs) {
        /*
         modifier -> x0 -> x20
         inputs -> x1 -> x19
         */
        let child = RootEnvironmentModifier.Child(
            modifier: modifier.value,
            env: inputs.environment,
            oldModifier: nil
        )
        
        let attribute = Attribute(child)
        inputs.environment = attribute
    }
}

extension RootEnvironmentModifier {
    struct Child: StatefulRule {
        @Attribute private(set) var modifier: RootEnvironmentModifier
        @Attribute private(set) var env: EnvironmentValues
        private(set) var oldModifier: RootEnvironmentModifier?
        
        typealias Value = EnvironmentValues
        
        func updateValue() {
            // self -> x20 -> x19
            // <+296>
            // x19 - 0xa8 / (w23 -> w25 -> x19 - 0x68)
            let (modifier, modifierChanged) = self.$modifier.changedValue(options: [])
            // x21 / (w20 -> x21 + x27)
            let (env, envChanged) = self.$env.changedValue(options: [])
            
            // <+412>
            if envChanged {
                // <+552>
                assertUnimplemented()
            } else {
                // <+416>
                assertUnimplemented()
            }
            
            assertUnimplemented()
        }
    }
}
