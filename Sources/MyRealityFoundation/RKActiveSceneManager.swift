@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@available(*, deprecated, message: "Please use the per-interaction-service runtime scene coordinator. __RKRuntimeSceneCoordinator")
public class __RKActiveSceneManager {
    @safe public static nonisolated(unsafe) let shared: __RKActiveSceneManager = {
        assertUnimplemented()
    }()
    
    public init() {
        assertUnimplemented()
    }
    
    public var activeScene: Scene? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public func addObserver(observer: any __RKActiveSceneObserver) {
        assertUnimplemented()
    }
    
    public func removeObserver(observer: any __RKActiveSceneObserver) {
        assertUnimplemented()
    }
    }
