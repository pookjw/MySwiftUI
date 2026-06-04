@_hasMissingDesignatedInitializers @available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@preconcurrency @MainActor final public class __SceneResource {
    @MainActor @preconcurrency final public var coreHandle: __AssetRef {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public static func fromCoreRetained(_ asset: __AssetRef) -> __SceneResource {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func fromCoreUnretained(_ asset: __AssetRef) -> __SceneResource {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor final public func makeScene(named name: String) -> Scene? {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __SceneResource : Sendable {}
