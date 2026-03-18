// 605E5F75314C8FB4F25003DB33D535B5
private import MySwiftUICore
private import AttributeGraph
private import os.log

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
        let remoteDesiredClientOptions = ImmersiveSpaceAuthority.shared.remoteDesiredClientOptions
        
        let resolvedConfiguration = Attribute(
            WindowSceneList<T>.ResolvedConfiguration(
                _configuration: configurationAttribute,
                _allowedImmersionStyles: allowedImmersionStyles,
                _immersionStyleSelection: immersionStyleSelection,
                _sceneUpdateTransitionAnimation: immersiveSpaceSceneUpdateTransition,
                preferredUpperLimbVisibility: upperLimbVisibility,
                immersiveContentBrightness: immersiveContentBrightness,
                orderOutSceneSessionIdentifiersProvider: orderOutSceneSessionIdentifiers,
                _remoteDesiredClientOptions: remoteDesiredClientOptions
            )
        )
        
        var outptus = _SceneOutputs(preferences: PreferencesOutputs())
        
        let environment = inputs.base.environment
        let idValue = scene[{ .of(&$0.id )}]
        let idAttribute = idValue.value
        let contentTypeValue = scene[{ .of(&$0.contentType )}]
        let contentTypeAttribute = contentTypeValue.value
        
        let makeList = Attribute(
            WindowSceneList<T>.MakeList(
                _configuration: resolvedConfiguration,
                environment: environment,
                id: idAttribute,
                contentType: contentTypeAttribute,
                resolvedID: nil
            )
        )
        
        outptus.writeSceneList(inputs: inputs, value: makeList)
        return outptus
    }
}

extension WindowSceneList {
    fileprivate struct ResolvedConfiguration: Rule {
        private(set) var _configuration: Attribute<WindowSceneConfiguration<T>> // 0x0
        private(set) var _allowedImmersionStyles: OptionalAttribute<[any ImmersionStyle]> // 0x4
        private(set) var _immersionStyleSelection: OptionalAttribute<Binding<any ImmersionStyle>> // 0x8
        private(set) var _sceneUpdateTransitionAnimation: OptionalAttribute<ImmersiveSpaceSceneUpdateTransition> // 0xc
        @OptionalAttribute var preferredUpperLimbVisibility: UpperLimbVisibility? // 0x10
        @Attribute private(set) var immersiveContentBrightness: ImmersiveContentBrightness // 0x14
        private(set) var orderOutSceneSessionIdentifiersProvider: () -> Set<String> // 0x18
        private(set) var _remoteDesiredClientOptions: Attribute<ImmersiveSpaceConfigurationAttributes.ClientOptions?> // 0x28
        
        static var initialValue: WindowSceneConfiguration<T>? {
            return nil
        }
        
        var configuration: WindowSceneConfiguration<T> {
            return _configuration.value
        }
        
        var allowedImmersionStyles: [any ImmersionStyle]? {
            return _allowedImmersionStyles.wrappedValue
        }
        
        var immersionStyleSelection: Binding<any ImmersionStyle>? {
            return _immersionStyleSelection.wrappedValue
        }
        
        var sceneUpdateTransitionAnimation: ImmersiveSpaceSceneUpdateTransition? {
            return _sceneUpdateTransitionAnimation.wrappedValue
        }
        
        var remoteDesiredClientOptions: ImmersiveSpaceConfigurationAttributes.ClientOptions? {
            return _remoteDesiredClientOptions.wrappedValue
        }
        
        var value: WindowSceneConfiguration<T> {
            // self -> x20 -> x23
            // <+216>
            // x28
            let allowedImmersionStyles = self.allowedImmersionStyles
            // x29 - 0x90
            var immersionStyleSelection = self.immersionStyleSelection
            // x25
            let sceneUpdateTransitionAnimation = self.sceneUpdateTransitionAnimation
            // x19 + 0x90
            let remoteDesiredClientOptions = self.remoteDesiredClientOptions
            
            if let remoteDesiredClientOptions {
                // <+276>
                immersionStyleSelection = Binding.constant(remoteDesiredClientOptions.selectedStyle)
                
                if let remoteScenes = Log.remoteScenes {
                    remoteScenes.log(level: .debug, "Using remote overrides for ImmersiveSpace Selected Style: \(String(describing: immersionStyleSelection)) from allowed styles: \(String(describing: allowedImmersionStyles))")
                }
                
                // <+980>
            } else {
                // <+496>
                // <+984>
            }
            
            // <+984>
            // x21
            if var casted = self.configuration as? WindowSceneConfiguration<ImmersiveSpaceConfigurationAttributes> {
                // <+1040>
                casted.attributes.immersionStyleSelection = immersionStyleSelection
                casted.attributes.preferredUpperLimbVisibility = self.preferredUpperLimbVisibility
                casted.attributes.immersiveContentBrightness = self.immersiveContentBrightness
                casted.attributes.immersiveEnvironmentBehavior = .automatic
                casted.attributes.sceneUpdateTransitionAnimation = sceneUpdateTransitionAnimation
                
                return casted as! WindowSceneConfiguration<T>
            } else {
                // <+1208>
                return self.configuration
            }
        }
    }
    
    fileprivate struct MakeList: StatefulRule {
        private(set) var _configuration: Attribute<WindowSceneConfiguration<T>>
        @Attribute private(set) var environment: EnvironmentValues
        @Attribute private(set) var id: String?
        @Attribute private(set) var contentType: Any.Type
        private(set) var resolvedID: SceneID?
        
        typealias Value = SceneList
        
        var configuration: WindowSceneConfiguration<T> {
            return _configuration.value
        }
        
        mutating func updateValue() {
            // x29 - 0x80
            let resolvedID: SceneID
            if let _resolvedID = self.resolvedID {
                resolvedID = _resolvedID
            } else {
                // <+256>
                if let id {
                    resolvedID = .string(id)
                    self.resolvedID = resolvedID
                } else {
                    // <+336>
                    resolvedID = .type(contentType, 1)
                    self.resolvedID = resolvedID
                }
            }
            
            // <+396>
            // x23
            let item = SceneList.Item(
                value: self.configuration.sceneListValue(),
                id: resolvedID,
                version: DisplayList.Version(forUpdate: ()),
                environment: self.environment,
                options: [],
                accessibilityProperties: nil,
                activationConditions: nil,
                resizability: .automatic,
                defaultPosition: nil,
                defaultSize: nil,
                restorationBehavior: .automatic,
                windowManagerRole: .automatic,
                connectionOptionPayloadStorage: ConnectionOptionPayloadStorage(),
                defaultLaunchBehavior: .automatic,
                windowLayoutProvider: nil,
                defaultPlacementProvider: nil,
                idealPlacementLayout: nil,
                windowToolbarLabelStyle: .fixed(.automatic),
                isInternal: false,
                depth: nil,
                sizingUnit: .points,
                defaultScalingBehavior: .automatic,
                worldAlignmentBehavior: .automatic
            )
            
            let list = SceneList(items: [item], environment: EnvironmentValues())
            self.value = list
        }
    }
}
