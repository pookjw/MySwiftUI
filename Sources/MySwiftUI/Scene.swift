// 0097A5536FDAF33A03BB54B9D6A80407
private import MySwiftUICore

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@preconcurrency @MainActor public protocol Scene {
    associatedtype Body : Scene
    @SceneBuilder @MainActor @preconcurrency var body: Self.Body { get }
    nonisolated static func _makeScene(scene: _GraphValue<Self>, inputs: _SceneInputs) -> _SceneOutputs
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Scene {
    nonisolated public static func _makeScene(scene: _GraphValue<Self>, inputs: _SceneInputs) -> _SceneOutputs {
        // <+332>
        let fields = DynamicPropertyCache.fields(of: self)
        var inputs = inputs
        let body = Self.makeBody(scene: scene, inputs: &inputs.base, fields: fields)
        assertUnimplemented()
    }
    
    nonisolated fileprivate static func makeBody(scene: _GraphValue<Self>, inputs: inout _GraphInputs, fields: DynamicPropertyCache.Fields) -> (_GraphValue<Self.Body>, _DynamicPropertyBuffer?) {
        assertUnimplemented()
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Never: Scene {}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension Scene {
    func sceneBodyError() -> Never {
        preconditionFailure("body() should not be called on \(type(of: self))")
    }
}

/*
 0x0~0x18 (total 0x20)
 nil -> 모두 0x0
 */
enum SceneID: Hashable {
    static func == (lhs: SceneID, rhs: SceneID) -> Bool {
        assertUnimplemented()
    }
    
    func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    case string(String)
    case type(Any.Type, UInt8)
}
