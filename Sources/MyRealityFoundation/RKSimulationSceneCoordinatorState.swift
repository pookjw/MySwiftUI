@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public enum __RKSimulationSceneCoordinatorState {
    case stopped
    case running
    
    public static func == (a: __RKSimulationSceneCoordinatorState, b: __RKSimulationSceneCoordinatorState) -> Bool {
        assertUnimplemented()
    }
    
    public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    public var hashValue: Int {
        get {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __RKSimulationSceneCoordinatorState : Equatable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __RKSimulationSceneCoordinatorState : Hashable {}
