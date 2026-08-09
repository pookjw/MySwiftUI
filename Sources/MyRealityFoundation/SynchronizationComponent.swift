private import CoreRE
#if RealityKitCompataibility
private import RealityKit
#endif

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct SynchronizationComponent : Component, Equatable {
    public enum OwnershipTransferMode {
        case autoAccept
        case manual
        
        public static func == (a: SynchronizationComponent.OwnershipTransferMode, b: SynchronizationComponent.OwnershipTransferMode) -> Bool {
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
    
    public enum OwnershipTransferCompletionResult {
        case granted
        case timedOut
        
        public static func == (a: SynchronizationComponent.OwnershipTransferCompletionResult, b: SynchronizationComponent.OwnershipTransferCompletionResult) -> Bool {
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
    
    public private(set) var identifier: UInt64 // 0x0
    public private(set) var isOwner: Bool // 0x8
    private var _shouldMigrateOwnershipWhenAbandoned: Bool // 0x9
    public private(set) var ownershipTransferMode: SynchronizationComponent.OwnershipTransferMode // 0xa
    private var ownershipCompletion: (Double, ((SynchronizationComponent.OwnershipTransferCompletionResult) -> Void)?)? // 0x10
    
    public init() {
        self.identifier = 0
        self.isOwner = false
        self._shouldMigrateOwnershipWhenAbandoned = false
        self.ownershipTransferMode = .autoAccept
        self.ownershipCompletion = nil
    }
    
    @MainActor @preconcurrency public static func __fromCore(_ coreComponent: __ComponentRef) -> SynchronizationComponent {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func __toCore(_ coreComponent: __ComponentRef) {
        /*
         self -> x20
         coreComponent -> x0 -> x19
         */
        // x25
        let core = unsafe unsafeBitCast(coreComponent.core, to: CoreRE::Component.self)
        let copy_1 = self
        core.network_setAlwaysMigrate(copy_1._shouldMigrateOwnershipWhenAbandoned)
        
        if core.isOwnershipLocked {
            switch copy_1.ownershipTransferMode {
            case .manual:
                // <+180>
                break
            default:
                // <+192>
                core.network_unlockEntity()
            }
        } else {
            // <+160>
            switch copy_1.ownershipTransferMode {
            case .autoAccept:
                // <+180>
                break
            case .manual:
                // <+172>
                core.network_lockEntity()
            }
        }
        
        guard let ownershipCompletion else {
            return
        }
        
        // <+208>
        if core.network_isAuthoritative {
            if let block = ownershipCompletion.1 {
                block(.granted)
            }
        } else {
            // <+300>
            unsafe core.network_requestOwnershipV2(
                core.isOwnershipLocked,
                nil,
                0,
                ownershipCompletion.0
            )
            
            guard let block = ownershipCompletion.1 else {
                return
            }
            
            if let reScene = core.entity.scene {
                // <+368>
                // scene -> x20
                let subscription = BoxedSubscription()
                
                let scene: MyRealityFoundation::Scene
#if RealityKitCompataibility
                if let bridgedScene = reScene.myRealityKitRef {
                    scene = bridgedScene
                } else {
                    scene = unsafe MyRealityFoundation::Scene(coreScene: unsafeBitCast(reScene, to: OpaquePointer.self))
                }
#else
                if let swiftObject = unsafe reScene.swiftObject {
                    scene = unsafe unsafeBitCast(swiftObject, to: AnyObject.self) as! MyRealityFoundation::Scene
                } else {
                    scene = unsafe MyRealityFoundation::Scene(coreScene: unsafeBitCast(reScene, to: OpaquePointer.self))
                }
#endif
                
                // <+572>
                let cancellable = scene
                    .publisher(for: SynchronizationEvents.OwnershipResponse.self, on: nil, componentType: nil)
                    .first { [identifier = copy_1.identifier] response in
                        // $s10RealityKit24SynchronizationComponentV8__toCoreyyAA02__D3RefVFSbAA0C6EventsO17OwnershipResponseVcfU_TA
                        guard let component = response
                            .entity
                            .components
                            .doGet(SynchronizationComponent.self, borrowStrongReference: false)
                        else {
                            return false
                        }
                        
                        return component.identifier == identifier
                    }
                    .sink { output in
                        // $s10RealityKit24SynchronizationComponentV8__toCoreyyAA02__D3RefVFyAA0C6EventsO17OwnershipResponseVcfU0_TA
                        /*
                         output -> x0
                         subscription -> x1
                         block -> x2/x3
                         */
                        subscription.value!.cancel()
                        block((output.response != .granted) ? .timedOut : .granted)
                    }
                
                subscription.value = cancellable
            } else {
                // <+476>
            }
        }
    }
    
    public static func == (lhs: SynchronizationComponent, rhs: SynchronizationComponent) -> Bool {
        assertUnimplemented()
    }

    @_spi(Internal) public static var componentName: String {
        get {
            assertUnimplemented()
        }
    }

    @_spi(Internal) public static func __load(from ref: UnsafeRawPointer) {
        assertUnimplemented()
    }

    @_spi(Internal) public static func __store(attribute: any MyRealityFoundation::Component, to ref: UnsafeMutableRawPointer, offset: Int, deinitialize: Bool) {
        assertUnimplemented()
    }

    @_spi(Internal) public static func __store(attribute: any MyRealityFoundation::Component, to ref: UnsafeMutableRawPointer, offset: Int) {
        assertUnimplemented()
    }

    @_spi(Internal) public static var __coreComponentType: __ComponentTypeRef {
        return __ComponentTypeRef(core: .network)
    }

    @_spi(Internal) public static func __load(from ref: UnsafeRawPointer, offset: Int) -> any MyRealityFoundation::Component {
        assertUnimplemented()
    }

    @_spi(Internal) public static var coreComponentType: CoreComponentType {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension SynchronizationComponent.OwnershipTransferMode : Equatable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension SynchronizationComponent.OwnershipTransferMode : Hashable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension SynchronizationComponent.OwnershipTransferCompletionResult : Equatable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension SynchronizationComponent.OwnershipTransferCompletionResult : Hashable {}

extension SynchronizationComponent : DefaultInitializable {
}
