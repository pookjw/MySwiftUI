// 1700ED20D4EA891B02973E899ABDB425
private import MySwiftUICore
private import AttributeGraph

final class SceneStorageValues {
    private var encodedValues: [AnyHashable: Any]
    private var entries: [String: SceneStorageValues.Entry] = [:]
    private var encodedValueCount: Int = 0
    private weak var associatedHost: ViewRendererHost? = nil
    
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

fileprivate struct SceneStorageValuesKey: EnvironmentKey {
    @safe static nonisolated(unsafe) let defaultValue: WeakBox<SceneStorageValues>? = nil
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
