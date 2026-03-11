public import MySwiftUICore

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@preconcurrency @MainActor public protocol App {
    associatedtype Body : Scene
    @SceneBuilder @MainActor @preconcurrency var body: Self.Body { get }
    @MainActor @preconcurrency init()
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension App {
    @MainActor @preconcurrency public static func main() {
        fatalError("TODO")
    }
}
