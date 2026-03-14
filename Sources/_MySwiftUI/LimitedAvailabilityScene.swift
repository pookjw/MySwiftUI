internal import MySwiftUICore

@available(iOS 16.1, macOS 13.0, tvOS 16.1, watchOS 9.1, *)
@usableFromInline
@frozen @MainActor @preconcurrency internal struct LimitedAvailabilityScene : Scene, _LimitedAvailabilitySceneMarker {
    @usableFromInline
    @MainActor @preconcurrency internal var storage: LimitedAvailabilitySceneStorageBase
    
    @usableFromInline
    @MainActor @preconcurrency internal init<S>(_ scene: S) where S : Scene {
        assertUnimplemented()
    }
    
    @usableFromInline
    @MainActor @preconcurrency internal var body: Swift.Never {
        assertUnimplemented()
    }
    
    @usableFromInline
    nonisolated internal static func _makeScene(scene: _GraphValue<LimitedAvailabilityScene>, inputs: _SceneInputs) -> _SceneOutputs {
        assertUnimplemented()
    }
    
    @available(iOS 16.1, tvOS 16.1, watchOS 9.1, macOS 13.0, *)
    @usableFromInline
    internal typealias Body = Never
}

@available(*, unavailable)
extension LimitedAvailabilityScene : Sendable {
}

@_hasMissingDesignatedInitializers @available(iOS 16.1, macOS 13.0, tvOS 16.1, watchOS 9.1, *)
@usableFromInline
internal class LimitedAvailabilitySceneStorageBase {
    // TODO
}

@available(*, unavailable)
extension LimitedAvailabilitySceneStorageBase : Sendable {
}
