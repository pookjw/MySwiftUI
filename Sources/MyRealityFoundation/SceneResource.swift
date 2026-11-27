@_hasMissingDesignatedInitializers @available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@preconcurrency @MainActor final public class __SceneResource {
    private let coreAssetInternal: OpaquePointer

    deinit {
        assertUnimplemented()
    }

    @MainActor @preconcurrency final var coreAsset: __AssetRef {
        get {
            assertUnimplemented()
        }
    }
    
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
    
    init(core: OpaquePointer) {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor final func makeAnchorEntity(fileName: String) throws -> AnchorEntity {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor final func makeRootEntity(withAnchoringComponent: Bool, hasAnchoringComponent: inout Bool, preferAnchorEntity: Bool) throws -> Entity {
        assertUnimplemented()
    }
    
    fileprivate func findREAnchoringComponent(root: Entity) -> __REAnchoringType? {
        assertUnimplemented()
    }
    
    fileprivate func makeAnchorEntity(from roots: [Entity], fileName: String) -> AnchorEntity {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __SceneResource : Sendable {}

extension __SceneResource : @MainActor __CoreConvertible {
    var core: OpaquePointer {
        assertUnimplemented()
    }
}
