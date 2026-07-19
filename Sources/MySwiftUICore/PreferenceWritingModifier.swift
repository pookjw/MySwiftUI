// E52508E85535897B9A366B470195B29D
private import AttributeGraph

extension View {
    @inlinable nonisolated public func preference<K>(key: K.Type = K.self, value: K.Value) -> some View where K : PreferenceKey {
        return modifier(_PreferenceWritingModifier<K>(value: value))
    }
}

@frozen public struct _PreferenceWritingModifier<Key> : ViewModifier where Key : PreferenceKey {
    @safe public nonisolated(unsafe) var value: Key.Value
    public typealias Body = Never
    
    @inlinable public nonisolated init(key: Key.Type = Key.self, value: Key.Value) {
        self.value = value
    }
    
    nonisolated public static func _makeView(modifier: _GraphValue<_PreferenceWritingModifier<Key>>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        /*
         modifier -> x0 -> w25
         inputs -> x1
         body -> x2/x3 -> x23/x24
         */
        var copy = inputs
        copy.preferences.remove(Key.self)
        var outputs = body(_Graph(), copy)
        
        outputs.preferences.makePreferenceWriter(
            inputs: inputs.preferences,
            key: Key.self,
            value: modifier.value[offset: { .of(&$0.value) }]
        )
        
        return outputs
    }
    
    nonisolated public static func _makeViewList(modifier: _GraphValue<_PreferenceWritingModifier<Key>>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        /*
         modifier -> x0 -> w26
         inputs -> x1 -> x23
         body -> x2/x3 -> x21/x19
         return pointer -> x8 -> x22
         */
        if
            isLinkedOnOrAfter(.v2_3),
            inputs.options.contains(.previewContext),
            self is _PreferenceWritingModifier<PreferredColorSchemeKey>.Type,
            let cassted = modifier as? _GraphValue<_PreferenceWritingModifier<PreferredColorSchemeKey>>
        {
            // <+332>
            // cassted -> w27
            // sp + 0x38
            var copy_1 = inputs
            // sp + 0x20
            let trait = _PreferenceWritingModifier<PreferredColorSchemeKey>
                .ColorSchemeTrait(
                    modifier: cassted.value,
                    traits: OptionalAttribute(inputs.$traits)
                )
            copy_1.$traits = Attribute(trait)
            
            // <+476>
            if var traitKeys = copy_1.traitKeys {
                copy_1.traitKeys = nil
                traitKeys.insert(PreviewColorSchemeTraitKey.self)
                copy_1.traitKeys = traitKeys
            }
            
            // <+552>
            // sp + 0x8
            let env = _PreferenceWritingModifier<PreferredColorSchemeKey>
                .ColorSchemeEnv(
                    modifier: cassted.value,
                    environment: inputs.base.environment
                )
            
            let envAttribute = Attribute(env)
            copy_1.base.environment = envAttribute
            
            return body(_Graph(), copy_1)
        } else {
            // <+868>
            return Self.makeMultiViewList(
                modifier: modifier,
                inputs: inputs,
                body: body
            )
        }
    }
}

@available(*, unavailable)
extension _PreferenceWritingModifier : Sendable {
}

extension _PreferenceWritingModifier : Equatable where Key.Value : Equatable {
    public static func == (a: _PreferenceWritingModifier<Key>, b: _PreferenceWritingModifier<Key>) -> Bool {
        assertUnimplemented()
    }
}

extension _PreferenceWritingModifier where Key == PreferredColorSchemeKey {
    fileprivate struct ColorSchemeTrait : Rule {
        @Attribute private(set) var modifier: _PreferenceWritingModifier<PreferredColorSchemeKey>
        @OptionalAttribute var traits: ViewTraitCollection?
        
        var value: ViewTraitCollection {
            assertUnimplemented()
        }
    }
    
    fileprivate struct ColorSchemeEnv : Rule {
        @Attribute var modifier: _PreferenceWritingModifier<PreferredColorSchemeKey>
        @Attribute var environment: EnvironmentValues
        
        var value: EnvironmentValues {
            assertUnimplemented()
        }
    }
}
