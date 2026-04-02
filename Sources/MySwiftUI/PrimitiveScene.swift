protocol PrimitiveScene : Scene {
}

extension PrimitiveScene {
    var body: Never {
        sceneBodyError()
    }
}
