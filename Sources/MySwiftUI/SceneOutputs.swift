// 51ADE71499A9765E37CE861215422D5D
internal import MySwiftUICore
internal import AttributeGraph

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct _SceneOutputs {
    var preferences: PreferencesOutputs
    
    mutating func writeSceneList(inputs: _SceneInputs, value: @autoclosure () -> Attribute<SceneList>) {
        let sceneList = WriteSceneList(namespace: .app, list: value(), environment: inputs.base.environment)
        
        preferences.makePreferenceWriter(inputs: inputs.preferences, key: SceneList.Key.self, value: {
            // $s7SwiftUI13_SceneOutputsV05writeC4List6inputs5valueyAA01_C6InputsV_14AttributeGraph0J0VyAA0cF0VGyXKtFAKySDyAM9NamespaceOAMGGyXEfu_TA
            return Attribute(sceneList)
        }())
    }
}

@available(*, unavailable)
extension _SceneOutputs : Sendable {
}

fileprivate struct WriteSceneList : StatefulRule {
    private(set) var namespace: SceneList.Namespace
    @Attribute private(set) var list: SceneList // 0x14
    @Attribute private(set) var environment: EnvironmentValues // 0x18
    
    typealias Value = [SceneList.Namespace: SceneList]
    
    func updateValue() {
        // self -> x20
        // (x24, w27 -> x24 + x19)
        var (list, changed) = $list.changedValue(options: [])
        // (x21, w28 -> (x21/x28) + x24)
        let environment = $environment.changedValue(options: [])
        
        guard changed || environment.changed || !hasValue else {
            return
        }
        
        list.environment = self.environment
        
        // <+452>
        value = [namespace: list]
    }
}

fileprivate struct TransformSceneListModifier: _SceneModifier, PrimitiveSceneModifier {
    let transform: (inout SceneList) -> ()
    
    static func _makeScene(modifier: _GraphValue<TransformSceneListModifier>, inputs: _SceneInputs, body: @escaping (_Graph, _SceneInputs) -> _SceneOutputs) -> _SceneOutputs {
        let namespace = inputs.sceneNamespace
        let modifierAttribute = modifier.value
        let map = Map<TransformSceneListModifier, (inout SceneList) -> Void>(modifierAttribute) { modifier in
            // $s14AttributeGraph0A0VyACyxGqd__c5ValueQyd__RszAA4RuleRd__lufcADSPyqd__GXEfU_ySv_So11AGAttributeatcyXEfU_y7SwiftUI9SceneListVzc_AA3MapVyAK09TransformhI8Modifier33_51ADE71499A9765E37CE861215422D5DLLVyAMzcGTg5
            return modifier.transform
        }
        let mapAttribute = Attribute(map)
        
        var outputs = body(_Graph(), inputs)
        outputs.preferences.makePreferenceTransformer(
            inputs: inputs.preferences,
            key: SceneList.Key.self,
            transform: {
                // $s7SwiftUI26TransformSceneListModifier33_51ADE71499A9765E37CE861215422D5DLLV05_makeD08modifier6inputs4bodyAA01_D7OutputsVAA11_GraphValueVyADG_AA01_D6InputsVAjA01_Q0V_AOtctFZ09AttributeQ00T0VyySDyAA0dE0V9NamespaceOAVGzcGyXEfu_TA
                let rule = TransformSceneListModifier.SceneListTransform(namespace: namespace, transform: mapAttribute)
                return Attribute(rule)
            }()
        )
        
        return outputs
    }
}

extension Scene {
    nonisolated func transformSceneList(transform: @escaping (inout SceneList) -> Void) -> some Scene {
        self.modifier(TransformSceneListModifier(transform: transform))
    }
}

extension _SceneInputs {
    @inline(always) // 원래 없음
    var sceneNamespace: SceneList.Namespace {
        return self.base[_SceneInputs.NamespaceInput.self]
    }
    
    fileprivate struct NamespaceInput: SceneInput {
        static var defaultValue: SceneList.Namespace {
            return .app
        }
    }
}

extension TransformSceneListModifier {
    fileprivate struct SceneListTransform: Rule {
        private(set) var namespace: SceneList.Namespace
        @Attribute private(set) var transform: (inout SceneList) -> Void
        
        var value: (inout [SceneList.Namespace : SceneList]) -> Void {
            return { values in
                // $s7SwiftUI26TransformSceneListModifier33_51ADE71499A9765E37CE861215422D5DLLV0deC0V5valueyySDyAA0dE0V9NamespaceOAIGzcvgyALzcfU_TA
                let transform = transform
                var value = values.removeValue(forKey: namespace) ?? SceneList()
                transform(&value)
                values[namespace] = value
            }
        }
    }
}
