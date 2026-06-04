public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public protocol __RKSimulationSceneCoordinatorDelegate : AnyObject {
    func coordinator(_ coordinator: __RKSimulationSceneCoordinator, didRequestToChangeToScene sceneIdentifier: UUID) -> Bool
}
