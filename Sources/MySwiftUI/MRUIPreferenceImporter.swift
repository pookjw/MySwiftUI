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
    
    var aggregatedPreferences: [AnyHashable : Any] {
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
        private var key: MRUIPreferenceImporter.PreferenceNode.NodeKey
        private var invalidationSignal: WeakAttribute<Void>
    }
    
    fileprivate struct ImportVisitor: MRUIBridgedPreferenceKeyVisitor {
        let host: any MRUIPreferenceHostProtocol // TODO: MRUIPreferenceHost일 수도 있음
        let inputs: _ViewInputs
        private(set) var outputs: _ViewOutputs
        private(set) var result: MRUIPreferenceImporter.PreferenceNode?
        
        mutating func visit<T>(key: T.Type) where T : MRUIBridgedPreferenceKey {
            fatalError("TODO")
        }
        
        func writeCustomKeys(excluding: [AnyObject.Type]) {
            fatalError("TODO")
        }
    }
}

extension MRUIPreferenceImporter.PreferenceNode {
    fileprivate enum NodeKey {
        case bridged(AnyObject.Type)
        case customKeys
    }
}
