// 605E5F75314C8FB4F25003DB33D535B5
private import MySwiftUICore

struct WindowSceneList<T: WindowSceneConfigurationAttributes>: PrimitiveScene {
    private(set) var configuration: WindowSceneConfiguration<T>
    private(set) var id: String?
    private(set) var contentType: Any.Type
    
    nonisolated static func _makeScene(scene: _GraphValue<WindowSceneList<T>>, inputs: _SceneInputs) -> _SceneOutputs {
        assertUnimplemented()
    }
}
