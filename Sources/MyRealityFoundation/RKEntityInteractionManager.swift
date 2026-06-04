@_hasMissingDesignatedInitializers @available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public class __RKEntityInteractionManager : __RKEntityInteractionService {
    init(sceneRef: OpaquePointer) {
        assertUnimplemented()
    }
    
    public var areInteractionsEnabled: Bool
    
    public var interactionsDisabledForTests: Bool
    
    public var customTriggerIdentifiers: [String] {
        get {
            assertUnimplemented()
        }
    }
    
    public var customActionIdentifiers: [String] {
        get {
            assertUnimplemented()
        }
    }
    
    public var entitiesTargetedByATapTrigger: [Entity] {
        get {
            assertUnimplemented()
        }
    }
    
    @discardableResult
    public func performInteractions(matchingCustomTriggerWithIdentifier customTriggerIdentifier: String, customArguments: [String : String]? = nil, overrides: [String : Entity]?) -> Bool {
        assertUnimplemented()
    }
    
    public func setCustomActionHandler(for identifier: String, handler: ((Entity?) -> Void)?) {
        assertUnimplemented()
    }
    
    @discardableResult
    public func __performInteractions(matchingCustomTriggerWithIdentifier customTriggerIdentifier: String, with customArguments: [String : String], on entities: [Entity]?) -> Bool {
        assertUnimplemented()
    }
    
    public func __setCustomPackageActionHandler(withIdentifier identifier: String, actionHandler: ((Entity?, [String : String]?) -> Void)?) {
        assertUnimplemented()
    }
    
    public var automaticallyInvokesStartTrigger: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public func shutdown() {
        assertUnimplemented()
    }
    
    public var __entityLookupTable: __RKEntityLookupTable
    
    public var __simulationSceneCoordinator: __RKSimulationSceneCoordinator
    
    public var __runtimeSceneCoordinator: __RKRuntimeSceneCoordinator
    
    public var __interactions: [__RKEntityInteraction] {
        get {
            assertUnimplemented()
        }
    }
    
    public func __hasInteractionsForTrigger<T>(of objectType: T.Type) -> Bool where T : __RKEntityTrigger {
        assertUnimplemented()
    }
    
    public var __actions: [__RKEntityAction] {
        get {
            assertUnimplemented()
        }
    }
    
    public func __addInteraction(_ interaction: __RKEntityInteraction) {
        assertUnimplemented()
    }
    
    public func __removeInteraction(_ interaction: __RKEntityInteraction) {
        assertUnimplemented()
    }
    
    public func __removeAllInteractions() {
        assertUnimplemented()
    }
    
    public func __cloneInteractions(fromEntity: Entity, toEntity: Entity) {
        assertUnimplemented()
    }
    
    @discardableResult
    public func __performInteractions(matching trigger: __RKEntityTrigger, on entities: [Entity]? = nil) -> Bool {
        assertUnimplemented()
    }
    
    public func action(for specification: __RKEntityActionSpecification) -> __RKEntityAction {
        assertUnimplemented()
    }
}
