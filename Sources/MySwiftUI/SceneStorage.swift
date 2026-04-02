// 1700ED20D4EA891B02973E899ABDB425
private import MySwiftUICore
private import AttributeGraph

final class SceneStorageValues {
    private(set) var encodedValues: [AnyHashable: Any] // 0x10
    private var entries: [String: SceneStorageValues.Entry] = [:] // 0x18
    private var encodedValueCount: Int = 0 // 0x20
    private weak var associatedHost: ViewRendererHost? = nil // 0x28
    
    @inlinable init(encodedValues: [AnyHashable: Any]) {
        self.encodedValues = encodedValues
    }
    
    fileprivate func initialValue<T>(_: T.Type, key: String, transformBox: SceneStorageTransformBox) -> T? {
        assertUnimplemented()
    }
    
    fileprivate func getLocation<T>(_: T.Type, domain: String?, key: String, transformBox: SceneStorageTransformBox, signal: WeakAttribute<Void>, makeLocation: (T?) -> ObservableLocation<T>) -> ObservableLocation<T> {
        assertUnimplemented()
    }
    
    fileprivate func removeObserver<T>(_: T.Type, domain: String?, key: String, signal: WeakAttribute<Void>) {
        assertUnimplemented()
    }
    
    @inline(always) // 원래 없음
    func encode(into values: inout [AnyHashable: Any]) {
        for entry in entries.values {
            entry.encode(into: &values)
        }
        
        // merge -> values/encodedValues
        self.encodedValues.merge(values) { _, _ in
            // $sxq_xq_Iegnnrr_x3key_q_5valuetx_q_tIegnr_SHRzr0_lTRs11AnyHashableV_ypTg5070$sSD5merge_16uniquingKeysWithySDyxq_Gn_q_q__q_tKXEtKFx_q_tx_q_tcfU_s11cD7V_ypTg5Tf3nnpf_n
            assertUnimplemented()
        }
    }
}

extension SceneStorageValues {
    fileprivate final class Entry {
        private var key: String
        private var domain: String?
        private var valueType: Any.Type
        private var _location: AnyObject
        private var transformBox: SceneStorageTransformBox
        
        init<T>(_: String, _: String?, location: ObservableLocation<T>, transformBox: SceneStorageTransformBox) {
            assertUnimplemented()
        }
        
        func encode(into values: inout [AnyHashable: Any]) {
            func project<T>(type: T.Type) {
                // $s7SwiftUI18SceneStorageValuesC5Entry33_1700ED20D4EA891B02973E899ABDB425LLC6encode4intoySDys11AnyHashableVypGz_tF7projectL_4typeyxm_tlF
                assertUnimplemented()
            }
            
            _openExistential(valueType, do: project)
        }
    }
}

extension EnvironmentValues {
    @inline(always)
    var sceneStorageValues: SceneStorageValues? {
        get {
            if let box = self[SceneStorageValuesKey.self] {
                return box.base
            } else {
                return nil
            }
        }
        set {
            if let newValue {
                self[SceneStorageValuesKey.self] = WeakBox(newValue)
            } else {
                self[SceneStorageValuesKey.self] = nil
            }
        }
    }
    
}

fileprivate struct SceneStorageValuesKey : EnvironmentKey {
    @safe nonisolated(unsafe) static let defaultValue: WeakBox<SceneStorageValues>? = nil
}

class SceneStorageTransformBox {
    init() {}
    
    func transform(_ value: Any) -> Any? {
        return nil
    }
    
    func readValue(from encodedValues: [AnyHashable: Any], key: String, read: inout Bool) -> Any? {
        fatalError() //abstract
    }
    
    func writeValue(_ value: Any, to encodedValues: inout [AnyHashable: Any], key: String) {
        fatalError() //abstract
    }
}
