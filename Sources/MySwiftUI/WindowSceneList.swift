// 605E5F75314C8FB4F25003DB33D535B5
private import MySwiftUICore
private import AttributeGraph

struct WindowSceneList<T: WindowSceneConfigurationAttributes>: PrimitiveScene {
    private(set) var configuration: WindowSceneConfiguration<T>
    private(set) var id: String?
    private(set) var contentType: Any.Type
    
    nonisolated static func _makeScene(scene: _GraphValue<WindowSceneList<T>>, inputs: _SceneInputs) -> _SceneOutputs {
        let configurationValue = scene[{ .of(&$0.configuration) }]
        // x29 - 0x148
        let configurationAttribute = configurationValue.value
        // x29 - 0xc0
        let allowedImmersionStyles = inputs.base[AllowedImmersionStylesInput.self]
        // x29 - 0xe4
        let immersionStyleSelection = inputs.base[ImmersionStyleSelectionInput.self]
        // x29 - 0xe8
        let immersiveSpaceSceneUpdateTransition = inputs.base[SceneUpdateTransitionAnimationInput.self]
        // x29 - 0xec
        let upperLimbVisibility = inputs.base[UpperLimbVisibilitySceneInput.self]
        // x29 - 0xf0
        let immersiveContentBrightness = inputs.base[ImmersiveContentBrightnessInput.self]
        // x29 - 0x90
        let orderOutSceneSessionIdentifiers = inputs.base[OrderOutSceneSessionIdentifiersProviderInput.self]
        
        // <+636>
        ImmersiveSpaceAuthority.shared.remoteDesiredClientOptions
        assertUnimplemented()
    }
}

extension WindowSceneList {
    struct ResolvedConfiguration: Rule {
        @Attribute private var configuration: WindowSceneConfiguration<T>
        @OptionalAttribute private var allowedImmersionStyles: [any ImmersionStyle]?
        @OptionalAttribute private var immersionStyleSelection: Binding<any ImmersionStyle>?
        @OptionalAttribute private var sceneUpdateTransitionAnimation: ImmersiveSpaceSceneUpdateTransition?
        @OptionalAttribute private var preferredUpperLimbVisibility: UpperLimbVisibility?
        @Attribute private var immersiveContentBrightness: ImmersiveContentBrightness
        private var orderOutSceneSessionIdentifiersProvider: () -> Set<String>
        @Attribute private var remoteDesiredClientOptions: ImmersiveSpaceConfigurationAttributes.ClientOptions?
        
        static var initialValue: WindowSceneConfiguration<T>? {
            assertUnimplemented()
        }
        
        var value: WindowSceneConfiguration<T> {
            assertUnimplemented()
        }
    }
}
