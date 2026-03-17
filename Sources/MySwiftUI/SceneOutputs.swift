// 51ADE71499A9765E37CE861215422D5D
internal import MySwiftUICore
internal import AttributeGraph

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct _SceneOutputs {
    private(set) var preferences: PreferencesOutputs
    
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

fileprivate struct WriteSceneList: StatefulRule {
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
