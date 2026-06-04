@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public protocol __RKActiveSceneObserver : AnyObject {
    @preconcurrency @MainActor func manager(_ manager: __RKActiveSceneManager, activeSceneDidChange scene: Scene?)
}
