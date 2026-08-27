// 4D011D01EC1453F13E5F3D96598DE15E
private import CoreRE
public import Foundation

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public protocol System {
    static var dependencies: [MyRealityFoundation::SystemDependency] { get }
    
    @preconcurrency @MainActor init(scene: Scene)
    @preconcurrency @MainActor mutating func update(context: SceneUpdateContext)
}

extension System {
    static func coreCustomSystem(scene: MyRealityFoundation::Scene) -> OpaquePointer? {
        let reScene = unsafe unsafeBitCast(scene.coreScene, to: CoreRE::Scene.self)
        
        guard let ecsManager = reScene.ecsManager else {
            return nil
        }
        
        guard let id = SystemRegistry.shared.getId(of: Self.self) else {
            return nil
        }
        
        let customSystem = ecsManager.customSystem(atId: id)
        return unsafe unsafeBitCast(customSystem, to: OpaquePointer?.self)
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    @preconcurrency @MainActor public static func registerSystem() {
        /*
         self -> x20
         Self.self -> x0 -> x26
         witness table -> x1 -> x25
         */
        let registry = SystemRegistry.shared
        
        if
            Self.self == PhysicsSystem.self ||
                Self.self == NetworkSendSystem.self ||
                Self.self == NetworkReceiveSystem.self ||
                Self.self == AnimationPlaybackSystem.self ||
                Self.self == SkeletalPoseSystem.self ||
                Self.self == MeshDeformerSystem.self
        {
            return
        }
        
        // <+156>
        // registry -> x23
        for registeredSystem in registry.registeredSystems {
            if registeredSystem == Self.self {
                return
            }
        }
        
        // w24
        let isClassType = unsafe swift_isClassType(
            metadata: unsafeBitCast(Self.self, to: UnsafeRawPointer.self)
        )
        // w27
        let isSystemUpdateRate = Self.self is (any _SystemUpdateRateProtocol.Type)
        
        // <+316>
        // sp + 0x28
        let registrationIndex = registry.registeredSystems.count
        registry.registeredSystems.append(Self.self)
        
        // <+412>
        // w23
        let id = registry.getOrAddId(of: self)
        // x25
        let dependencies = self.dependencies
        var reRESystemDependencies: [CoreRE::SystemDependency]
        
        if dependencies.isEmpty {
            reRESystemDependencies = []
        } else {
            reRESystemDependencies = []
            reRESystemDependencies.reserveCapacity(dependencies.count)
            
            for dependency in dependencies {
                let systemID: Int32
                switch dependency {
                case .before(let beforeSystem):
                    if beforeSystem == PhysicsSystem.self {
                        systemID = RECustomSystemPhysicsID()
                    } else if beforeSystem == NetworkSendSystem.self {
                        systemID = RECustomSystemNetworkSendID()
                    } else if beforeSystem == NetworkReceiveSystem.self {
                        systemID = RECustomSystemNetworkReceiveID()
                    } else if beforeSystem == AnimationPlaybackSystem.self {
                        systemID = RECustomSystemAnimationPlaybackID()
                    } else if beforeSystem == SkeletalPoseSystem.self {
                        systemID = RECustomSkeletalPoseID()
                    } else if beforeSystem == MeshDeformerSystem.self {
                        systemID = RECustomSystemMeshDeformerID()
                    } else {
                        systemID = registry.getOrAddId(of: beforeSystem)
                    }
                    
                    reRESystemDependencies.append(
                        CoreRE::SystemDependency(
                            unknown0: id,
                            unknown1: systemID
                        )
                    )
                case .after(let afterSystem):
                    if afterSystem == PhysicsSystem.self {
                        systemID = RECustomSystemPhysicsID()
                    } else if afterSystem == NetworkSendSystem.self {
                        systemID = RECustomSystemNetworkSendID()
                    } else if afterSystem == NetworkReceiveSystem.self {
                        systemID = RECustomSystemNetworkReceiveID()
                    } else if afterSystem == AnimationPlaybackSystem.self {
                        systemID = RECustomSystemAnimationPlaybackID()
                    } else if afterSystem == SkeletalPoseSystem.self {
                        systemID = RECustomSkeletalPoseID()
                    } else if afterSystem == MeshDeformerSystem.self {
                        systemID = RECustomSystemMeshDeformerID()
                    } else {
                        systemID = registry.getOrAddId(of: afterSystem)
                    }
                    
                    reRESystemDependencies.append(
                        CoreRE::SystemDependency(
                            unknown0: systemID,
                            unknown1: id
                        )
                    )
                case .beforePhysics:
                    // <+684>
                    systemID = RECustomSystemPhysicsID()
                    
                    reRESystemDependencies.append(
                        CoreRE::SystemDependency(
                            unknown0: id,
                            unknown1: systemID
                        )
                    )
                }
            }
        }
        
        // <+1540>
        let block_1: (OpaquePointer, OpaquePointer) -> UnsafeMutableRawPointer = { ptr0, ptr1 in
            // $s17RealityFoundation6SystemPAAE08registerC0yyFZSvs13OpaquePointerV_AFtcfU0_TA
            /*
             ptr0 -> x0 -> x29 - 0xb8, x29 - 0x80
             ptr1 -> x1 -> x29 - 0xc0
             isClassType -> w2 -> w27
             Self.self -> x3 -> x19
             witness table -> x4 -> x28
             */
            // <+148>
            let reScene = unsafe unsafeBitCast(ptr0, to: CoreRE::Scene.self)
            
            let scene: MyRealityFoundation::Scene
#if RealityKitCompatibility
            if let myRealityKitRef = reScene.myRealityKitRef {
                scene = myRealityKitRef
            } else {
                scene = unsafe MyRealityFoundation::Scene(
                    coreScene: unsafeBitCast(reScene, to: OpaquePointer.self)
                )
            }
#else
            if let swiftObject = reScene.swiftObject {
                scene = unsafe unsafeBitCast(swiftObject, to: AnyObject.self) as! MyRealityFoundation::Scene
            } else {
                scene = unsafe MyRealityFoundation::Scene(
                    coreScene: unsafeBitCast(reScene, to: OpaquePointer.self)
                )
            }
#endif
            
            // <+328>
            // x21
            let system = Self.init(scene: scene)
            
            // x27
            let object: AnyObject
            if isClassType {
                // <+352>
                object = system as AnyObject
            } else {
                object = SystemBox(system: system)
            }
            
            // <+460>
            // x24
            let copy_1 = system
            
            if let casted = copy_1 as? (any _SystemUpdateRateProtocol) {
                // <+532>
                let updateRate = casted._preferredUpdateRate
                
                unsafe casted.setUpdateRate(
                    coreCustomSystem: ptr1,
                    coreScene: ptr0,
                    updateRate: updateRate
                )
            } else {
                // <+640>
                unsafe unsafeBitCast(ptr1, to: CoreRE::CustomSystem.self)
                    .setScheduleTypeForScene(reScene, .unknown4)
            }
            
            // <+720>
            return unsafe Unmanaged.passRetained(object).toOpaque()
        }
        
        let block_2: (UnsafeMutableRawPointer, OpaquePointer?, OpaquePointer) -> Void = { ptr0, ptr1, ptr2 in
            // $s17RealityFoundation6SystemPAAE08registerC0yyFZySv_s13OpaquePointerVSgAFtcfU1_TA
            /*
             ptr0 -> x0 -> x22
             ptr1 -> x1 -> x20
             ptr2 -> x2 -> x27
             isClassType -> w3 -> x29 - 0xb4
             isSystemUpdateRate -> w4 -> x29 - 0xb8
             Self.self -> x5 -> x19
             witness table -> x6 -> x24
             */
            // <+132>
            var system: Self
            if isClassType {
                // <+136>
                system = unsafe unsafeBitCast(ptr0, to: AnyObject.self) as! Self
            } else {
                // <+184>
                let box = unsafe Unmanaged<AnyObject>
                    .fromOpaque(ptr0)
                    .takeUnretainedValue() as! SystemBox<Self>
                
                system = box.system
            }
            
            // <+308>
            if unsafe ptr1 == nil {
                _ = unsafe TimeInterval(
                    unsafeBitCast(
                        ptr2,
                        to: CoreRE::CustomSystem.UpdateContext.self
                    )
                    .deltaTime
                )
            }
            
            let reScene = unsafe unsafeBitCast(ptr1!, to: CoreRE::Scene.self)
            let scene: MyRealityFoundation::Scene!
#if RealityKitCompatibility
            if let myRealityKitRef = reScene.myRealityKitRef {
                scene = myRealityKitRef
            } else {
                scene = unsafe MyRealityFoundation::Scene(
                    coreScene: unsafeBitCast(reScene, to: OpaquePointer.self)
                )
            }
#else
            if let swiftObject = reScene.swiftObject {
                scene = unsafe unsafeBitCast(swiftObject, to: AnyObject.self) as! MyRealityFoundation::Scene
            } else {
                scene = unsafe MyRealityFoundation::Scene(
                    coreScene: unsafeBitCast(reScene, to: OpaquePointer.self)
                )
            }
#endif
            
            let deltaTime = unsafe TimeInterval(
                unsafeBitCast(ptr2, to: CoreRE::CustomSystem.UpdateContext.self)
                    .deltaTime
            )
            
            let systemsArePausedInEditor = unsafe unsafeBitCast(
                ptr2,
                to: CoreRE::CustomSystem.UpdateContext.self
            )
                .systemsArePausedInEditor
            
            let stats = SceneUpdateContext.Stats()
            
            let context = SceneUpdateContext(
                scene: scene!,
                deltaTime: deltaTime,
                stats: stats,
                systemsArePausedInEditor: systemsArePausedInEditor
            )
            
            system.update(context: context)
            
            if
                SceneUpdateContext.queryBasedUpdateRate &&
                    !isSystemUpdateRate
            {
                if
                    let coreCustomSystem = unsafe Self.coreCustomSystem(scene: scene),
                    !(stats.queriesExecuted <= 0),
                    !(stats.entityCount < 1)
                {
                    // <+712>
                    unsafe unsafeBitCast(
                        coreCustomSystem,
                        to: CoreRE::CustomSystem.self
                    )
                    .enqueueUpdateWithDeadlineForScene(reScene, 0)
                    
                    // <+752>
                } else {
                    // <+752>
                }
            } else {
                // <+752>
            }
            
            // <+752>
            if !isClassType {
                // <+768>
                let casted = unsafe unsafeBitCast(ptr0, to: AnyObject.self) as! SystemBox<Self>
                casted.system = system
            }
            
            // <+880>
        }
        
        reRESystemDependencies.withUnsafeBufferPointer { pointer in
            unsafe RERegisterCustomSystem(
                id,
                registrationIndex,
                unsafeBitCast(
                    block_1,
                    to: ((UnsafeRawPointer, UnsafeRawPointer) -> UnsafeMutableRawPointer).self
                ),
                unsafeBitCast(
                    block_2,
                    to: ((UnsafeMutableRawPointer, UnsafeRawPointer?, UnsafeRawPointer) -> Void).self
                ),
                pointer.baseAddress.unsafelyUnwrapped,
                pointer.count
            )
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public static var dependencies: [MyRealityFoundation::SystemDependency] {
        return []
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public mutating func update(context: SceneUpdateContext) {
        assertUnimplemented()
    }
}

final class SystemRegistry {
    @safe static nonisolated(unsafe) let shared = SystemRegistry()
    
    private var knownSystems: [any System.Type] = [] // 0x10
    fileprivate var registeredSystems: [any System.Type] = [] // 0x18
    
    func getId(of system: any System.Type) -> Int32? {
        for (index, element) in self.knownSystems.enumerated() {
            if element == system {
                return Int32(index)
            }
        }
        
        return nil
    }
    
    func getOrAddId(of system: any System.Type) -> Int32 {
        if let id = self.getId(of: system) {
            return id
        }
        
        let index = self.knownSystems.count
        self.knownSystems.append(system)
        return Int32(index)
    }
}

protocol _SystemUpdateRateProtocol : System {
    var _preferredUpdateRate: _SystemUpdateRate { get }
    func _scheduleUpdate(scene: MyRealityFoundation::Scene, in time: Double)
}

extension _SystemUpdateRateProtocol {
    var _preferredUpdateRate: _SystemUpdateRate {
        assertUnimplemented()
    }
    
    func _scheduleUpdate(scene: MyRealityFoundation::Scene, in time: Double) {
        assertUnimplemented()
    }
    
    func setUpdateRate(coreCustomSystem: OpaquePointer, coreScene: OpaquePointer, updateRate: _SystemUpdateRate) {
        assertUnimplemented()
    } 
}

enum _SystemUpdateRate : Hashable {
    case _renderRate(divider: Int)
    case _periodic(targetInterval: Double, alsoAtEngineRate: Bool)
    case _default
    case _manualSchedule
}

@_silgen_name("swift_isClassType")
fileprivate func swift_isClassType(metadata: UnsafeRawPointer) -> Bool 

fileprivate final class SystemBox<T : System> {
    var system: T
    
    init(system: T) {
        self.system = system
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public struct SceneUpdateContext {
    static let queryBasedUpdateRate = UserDefaults.standard.bool(forKey: "com.apple.re.queryBasedSystemUpdateRate", default: true)
    
    public var scene: MyRealityFoundation::Scene // 0x0
    public var deltaTime: TimeInterval // 0x8
    fileprivate private(set) var stats: SceneUpdateContext.Stats? // 0x10
    fileprivate private(set) var systemsArePausedInEditor: Bool // 0x18
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension SceneUpdateContext {
    @available(visionOS, unavailable, renamed: "entities(matching:updatingSystemWhen:)")
    @available(macOS, unavailable, renamed: "entities(matching:updatingSystemWhen:)")
    @available(iOS, unavailable, renamed: "entities(matching:updatingSystemWhen:)")
    @available(tvOS, unavailable, renamed: "entities(matching:updatingSystemWhen:)")
    @available(watchOS, unavailable, renamed: "entities(matching:updatingSystemWhen:)")
    public func entities(matching query: EntityQuery, when condition: SystemUpdateCondition) -> QueryResult<Entity> {
        assertUnimplemented()
    }
    
    public func entities(matching query: EntityQuery, updatingSystemWhen condition: SystemUpdateCondition) -> QueryResult<Entity> {
        let scene = self.scene
        let stats = self.stats
        
        let result = scene.performQuery(query)
        
        guard let stats else {
            return result
        }
        
        stats.queriesExecuted += 1
        stats.entityCount += result.elements.count
        
        return result
    }
}

extension SceneUpdateContext {
    fileprivate final class Stats {
        var queriesExecuted: Int = 0
        var entityCount: Int = 0
    }
}

extension UserDefaults {
    fileprivate func bool(forKey key: String, default: Bool) -> Bool {
        guard let value = self.object(forKey: key) as? Bool else {
            return `default`
        }
        
        return value
    }
}
