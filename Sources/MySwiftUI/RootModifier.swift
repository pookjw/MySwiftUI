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
        @Attribute private(set) var modifier: RootEnvironmentModifier // 0x0
        @Attribute private(set) var env: EnvironmentValues // 0x4
        private(set) var oldModifier: RootEnvironmentModifier? // 0x8
        
        typealias Value = EnvironmentValues
        
        func updateValue() {
            // self -> x20 -> x19
            // <+296>
            // x29 - 0xa8 / (w23 -> w25 -> x29 - 0x68)
            let (modifier, modifierChanged) = self.$modifier.changedValue(options: [])
            // x21 / (w20 -> x21 + x27)
            let (env, envChanged) = self.$env.changedValue(options: [])
            
            // <+412>
            if envChanged {
                // <+552>
            } else {
                // <+416>
                if modifierChanged {
                    // <+460>
                    // x29 - 0xf0
                    let oldModifier = self.oldModifier
                    
                    // x29 + 0x130
                    if let copy_1 = oldModifier {
                        // <+500>
                        if compareValues(copy_1, modifier, options: [.unknown1, .unknown8]) {
                            // <+420>
                            if hasValue {
                                // <+1556>
                                return
                            } else {
                                // <+552>
                            }
                        } else {
                            // <+552>
                        }
                    } else {
                        // <+552>
                    }
                } else {
                    // <+420>
                    if hasValue {
                        // <+432>
                        // <+1556>
                        return
                    } else {
                        // <+552>
                    }
                }
            }
            
            // <+552>
            assertUnimplemented()
        }
    }
}
