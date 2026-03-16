// 605E5F75314C8FB4F25003DB33D535B5
private import MySwiftUICore

struct WindowSceneList<T: Scene>: PrimitiveScene {
    private var configuration: WindowSceneConfiguration<T>
    private var id: String?
    private var contentType: Any.Type
    
    nonisolated static func _makeScene(scene: _GraphValue<WindowSceneList<T>>, inputs: _SceneInputs) -> _SceneOutputs {
        assertUnimplemented()
    }
}
