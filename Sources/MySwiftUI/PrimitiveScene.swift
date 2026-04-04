protocol PrimitiveScene : Scene {
}

extension PrimitiveScene {
    public var body: Never {
        sceneBodyError()
    }
}
