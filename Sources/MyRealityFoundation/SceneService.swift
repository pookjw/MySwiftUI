@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public protocol __SceneService {
    var scenes: [Scene] { get }
    func append(scene: Scene)
    func remove(scene: Scene)
    var coreECSManager: __REECSManagerRef { get }
}
