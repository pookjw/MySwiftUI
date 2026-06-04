@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct ForceEffectComponent : Component {
    public var effects: [any ForceEffectBase]
    
    public init(effects: [any ForceEffectBase], simulationState: ForceEffectComponent.SimulationState = .start) {
        assertUnimplemented()
    }
    
    public init(effect: any ForceEffectBase) {
        assertUnimplemented()
    }
    
    public enum SimulationState {
        case start
        case pause
        case resume
        
        public static func == (a: ForceEffectComponent.SimulationState, b: ForceEffectComponent.SimulationState) -> Bool {
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
    
    public var simulationState: ForceEffectComponent.SimulationState?
    
    @MainActor @preconcurrency public static func __fromCore(_ coreComponent: __ComponentRef) -> ForceEffectComponent {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
    
    public static var __coreComponentType: __ComponentTypeRef {
        get {
            assertUnimplemented()
        }
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension ForceEffectComponent.SimulationState : Equatable {}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension ForceEffectComponent.SimulationState : Hashable {}
