public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public class __RKSimulationSceneCoordinator {
    @available(*, deprecated, message: "Please use the per-interaction-service scene coordinator.")
    public static var shared: __RKSimulationSceneCoordinator {
        assertUnimplemented()
    }
    
    public init() {
        assertUnimplemented()
    }
    weak public var delegate: (any __RKSimulationSceneCoordinatorDelegate)?
    
    public var simulationState: __RKSimulationSceneCoordinatorState
    
    public func changeToScene(with identifier: UUID) -> Bool {
        assertUnimplemented()
    }
    }
