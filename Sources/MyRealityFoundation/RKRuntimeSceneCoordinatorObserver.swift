@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public protocol __RKRuntimeSceneCoordinatorObserver : AnyObject {
    @available(macOS 10.15, iOS 13.0, macCatalyst 14.0, *)
    func runtimeSceneCoordinator(_ coordinator: __RKRuntimeSceneCoordinator, willSwapFromEntity fromEntity: Entity, toEntity: Entity?, anchoringTarget: AnchoringComponent.Target?)
    @available(macOS 10.15, iOS 13.0, macCatalyst 14.0, *)
    func runtimeSceneCoordinator(_ coordinator: __RKRuntimeSceneCoordinator, didSwapFromEntity fromEntity: Entity, toEntity: Entity?, anchoringTarget: AnchoringComponent.Target?)
}
