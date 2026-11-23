// CEFC69A04FB719EF82DE78FCEF5D6745
internal import AttributeGraph

struct LinksHoverEffectOverlayModifier : PrimitiveViewModifier, UnaryViewModifier {
    @safe private nonisolated(unsafe) var resolvedText: ResolvedStyledText
    
    nonisolated static func _makeView(modifier: _GraphValue<LinksHoverEffectOverlayModifier>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        // sp + 0x8
        let outputs_1 = body(_Graph(), inputs)
        
        guard
            EnableLinkHoverEffects.isEnabled,
            inputs.preferences.contains(DisplayList.Key.self)
        else {
            return outputs_1
        }
        
        let resolvedText = modifier.value.resolvedText
        
        let isEnabledInEnvironment = inputs.base.cachedEnvironment.value.attribute(id: .isEnabled) { environment in
            // $s7SwiftUI12_GraphInputsVAAE9isEnabled09AttributeC00G0VySbGvgSbAA17EnvironmentValuesVcfu_33_7d2e6c34e1c0007b52275b9ca45f339cAJSbTf3nnpk_n
            return environment.isEnabled
        }
        
        let hoverEffectEnabledInEnvironment = inputs.base.cachedEnvironment.value.attribute(id: .isHoverEffectEnabled) { environment in
            // $s7SwiftUI12_GraphInputsVAAE20isHoverEffectEnabled09AttributeC00I0VySbGvgSbAA17EnvironmentValuesVcfu_33_84321bcdf7c4e41aec47f63b940dad65AJSbTf3nnpk_n
            return environment.isHoverEffectEnabled
        }
        
        let remoteEffectsDisabledInEnvironment = inputs.base.cachedEnvironment.value.attribute(id: .remoteEffectsDisabled) { environment in
            // $s7SwiftUI12_GraphInputsVAAE21remoteEffectsDisabled09AttributeC00H0VySbGvgSbAA17EnvironmentValuesVcfu_33_7675a2f34a5dffdca958ee1fb59c2936AJSbTf3nnpk_n
            return environment.remoteEffectsDisabled
        }
        
        let configuration = LinksHoverEffectOverlayModifier.ConfigurationRule(
            resolvedText: resolvedText,
            isEnabledInEnvironment: isEnabledInEnvironment,
            hoverEffectEnabledInEnvironment: hoverEffectEnabledInEnvironment,
            remoteEffectsDisabledInEnvironment: remoteEffectsDisabledInEnvironment
        )
        
        let content = LinksHoverEffectOverlayModifier.OverlayContent(
            configuration: Attribute(configuration),
            size: inputs.size.cgSize()
        )
        
        let modifier = Attribute(content)
        
        var copy = inputs
        copy.preferences.keys = PreferenceKeys()
        copy.preferences.add(DisplayList.Key.self)
        
        // <+708>
        // sp + 0x18
        let outputs_2 = LinksHoverEffectOverlayModifier.OverlayContent.Value
            .makeDebuggableView(view: _GraphValue(modifier), inputs: copy)
        
        // <+1056>
        var visitor = PairwisePreferenceCombinerVisitor(outputs: (outputs_1.preferences, outputs_2.preferences))
        
        for key in inputs.preferences.keys {
            key.visitKey(&visitor)
        }
        
        return _ViewOutputs(
            preferences: visitor.result,
            layoutComputer: OptionalAttribute(outputs_1.layoutComputer)
        )
    }
    
    nonisolated static func _makeViewList(modifier: _GraphValue<LinksHoverEffectOverlayModifier>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
}

extension LinksHoverEffectOverlayModifier {
    struct ModifierRule : Rule, AsyncAttribute {
        @Attribute private(set) var text: ResolvedStyledText
        
        var value: LinksHoverEffectOverlayModifier {
            assertUnimplemented()
        }
    }
    
    fileprivate struct OverlayContent : AsyncAttribute, Rule {
        @Attribute private(set) var configuration: TextLinksHoverEffectViewConfiguration?
        @Attribute private(set) var size: CGSize
        
        // SwiftUI._ConditionalContent<SwiftUI.ModifiedContent<SwiftUI.TextLinksHoverEffectResolvedView, SwiftUI._FrameLayout>, SwiftUI.EmptyView>
        var value: some View {
            assertUnimplemented()
        }
    }
    
    fileprivate struct ConfigurationRule : AsyncAttribute, StatefulRule {
        @Attribute private(set) var resolvedText: ResolvedStyledText
        @Attribute private(set) var isEnabledInEnvironment: Bool
        @Attribute private(set) var hoverEffectEnabledInEnvironment: Bool
        @Attribute private(set) var remoteEffectsDisabledInEnvironment: Bool
        
        typealias Value = TextLinksHoverEffectViewConfiguration?
        
        func updateValue() {
            assertUnimplemented()
        }
    }
}
