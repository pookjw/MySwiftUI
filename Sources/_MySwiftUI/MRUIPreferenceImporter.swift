// B11042089ADA70985D65A5FF14C160F6
private import MySwiftUICore
internal import MRUIKit
private import AttributeGraph
internal import Foundation

final class MRUIPreferenceImporter: NSObject, MRUIPreferenceHostConformer {
    private weak var graph: ViewGraph? = nil // 0x8
    private let preferenceHost = MRUIPreferenceHost() // 0x10
    private var importedPreferences: [MRUIPreferenceImporter.PreferenceNode] = [] // 0x18
    private var customImportedPreference: MRUIPreferenceImporter.PreferenceNode? = nil
    
    init(graph: ViewGraph) {
        self.graph = graph
        super.init()
    }
    
    func writePreferences(to outputs: inout _ViewOutputs, inputs: _ViewInputs) {
        /*
         self -> x20 -> x26
         outputs -> x0 -> x22
         inputs -> x1 -> x20
         */
        // <+100>
        // x24
        var visitor = MRUIPreferenceImporter.ImportVisitor(host: preferenceHost, inputs: inputs, outputs: outputs, result: nil)
        
        let allKeys = MRUIPreferenceExporter.allKeys
        
        // x25
        var keys: [AnyObject.Type]
        if !allKeys.isEmpty {
            for key in allKeys {
                // <+348>
                key.visitKey(&visitor)
                
                if let result = visitor.result {
                    // <+388>
                    importedPreferences.append(result)
                }
            }
            
            // <+520>
            keys = []
            for key in allKeys {
                keys.append(key.anyBridgedKey)
            }
        } else {
            // <+692>
            keys = []
        }
        
        // <+716>
        visitor.writeCustomKeys(excluding: keys)
        
        self.customImportedPreference = nil
        outputs = visitor.outputs
    }
    
    // TODO
    
    var parentPreferenceHost: any MRUIPreferenceHostProtocol {
        fatalError("TODO")
    }
    
    func descendant(_ arg1: Any, changedToValue arg2: Any, forPreferenceKey arg3: AnyClass) {
        fatalError("TODO")
    }
    
    var aggregatedPreferences: [AnyHashable: Any] {
        fatalError("TODO")
    }
    
    func setValue(_ value: Any?, forPreferenceKey key: AnyClass) {
        fatalError("TODO")
    }
    
    func aggregatedPreference(forKey key: AnyClass) -> Any? {
        fatalError("TODO")
    }
}

extension MRUIPreferenceImporter {
    fileprivate struct PreferenceNode {
        private(set) var key: MRUIPreferenceImporter.PreferenceNode.NodeKey
        private(set) var invalidationSignal: WeakAttribute<Void>
    }
    
    fileprivate struct ImportVisitor: MRUIBridgedPreferenceKeyVisitor {
        let host: MRUIPreferenceHost
        let inputs: _ViewInputs
        private(set) var outputs: _ViewOutputs
        private(set) var result: MRUIPreferenceImporter.PreferenceNode?
        
        mutating func visit<T>(key: T.Type) where T : MRUIBridgedPreferenceKey {
            /*
             self -> x20 -> x19
             */
            // <+120>
            // w27
            let signal = Attribute(value: ())
            // w24
            let preference = Attribute(ImportedPreference<T>(host: host))
            signal.addInput(preference, options: .unknown2, token: 0)
            
            // <+400>
            outputs.preferences.makePreferenceWriter(inputs: inputs.preferences, key: T.self, value: {
                // $s7SwiftUI40TransactionalPreferenceTransformModifierV9_makeView8modifier6inputs4bodyAA01_H7OutputsVAA11_GraphValueVyACyxGG_AA01_H6InputsVAiA01_M0V_AOtctFZ09AttributeM00P0Vyy0N0QzzcGyXEfu_TA
                return preference
            }())
            
            // <+492>
            self.result = MRUIPreferenceImporter.PreferenceNode(key: .bridged(T.bridgedKey), invalidationSignal: WeakAttribute(signal))
        }
        
        mutating func writeCustomKeys(excluding: [AnyObject.Type]) {
            /*
             self -> x20 -> x19
             excluding -> x0 -> x20
             */
            // w23
            let signal = Attribute(value: ())
            // w24
            let preferences = Attribute(ImportedCustomPreferences(host: host, excludedKeys: excluding))
            signal.addInput(preferences, options: .unknown2, token: 0)
            
            outputs.preferences.makePreferenceWriter(inputs: inputs.preferences, key: MRUICustomPreferencesKey.self, value: {
                // $s7SwiftUI28ManipulationGeometryModifierV9_makeView8modifier6inputs4bodyAA01_G7OutputsVAA11_GraphValueVyACG_AA01_G6InputsVAiA01_L0V_ANtctFZ09AttributeL00O0VySDy10Foundation4UUIDVASyAA06ObjectcD0VGGGyXEfu_TA
                return preferences
            }())
            
            self.result = MRUIPreferenceImporter.PreferenceNode(key: .customKeys, invalidationSignal: WeakAttribute(signal))
        }
    }
}

extension MRUIPreferenceImporter.PreferenceNode {
    fileprivate enum NodeKey {
        case bridged(AnyObject.Type)
        case customKeys
    }
}

fileprivate struct ImportedPreference<T: MRUIBridgedPreferenceKey>: StatefulRule {
    private(set) weak var host: MRUIPreferenceHost?
    
    typealias Value = T.Value
    
    func updateValue() {
        let value: T.Value?
        if let host {
            value = host[T.self]
        } else {
            value = nil
        }
        
        self.value = value ?? T.defaultValue
    }
}

fileprivate struct ImportedCustomPreferences: StatefulRule {
    private(set) weak var host: MRUIPreferenceHost?
    private(set) var excludedKeys: [AnyObject.Type]
    
    typealias Value = [AnyHashable: Any]
    
    func updateValue() {
        guard let host else {
            value = [:]
            return
        }
        
        // <+48>
        value = host.aggregatedPreferences
    }
}

struct MRUICustomPreferencesKey: HostPreferenceKey {
    static nonisolated(unsafe) let defaultValue: [AnyHashable: Any] = [:]
    
    static func reduce(value: inout [AnyHashable: Any], nextValue: () -> [AnyHashable: Any]) {
        // value -> x0 -> x19
        // x20
        var next = nextValue()
        
        next.merge(value) { _, _ in
            // $sxq_xq_Iegnnrr_x3key_q_5valuetx_q_tIegnr_SHRzr0_lTRs11AnyHashableV_ypTg5070$sSD5merge_16uniquingKeysWithySDyxq_Gn_q_q__q_tKXEtKFx_q_tx_q_tcfU_s11cD7V_ypTg5Tf3nnpf_n
            fatalError("TODO")
        }
        
        value = next
    }
    
    static var _includesRemovedValues: Bool {
        fatalError("TODO")
    }
}
