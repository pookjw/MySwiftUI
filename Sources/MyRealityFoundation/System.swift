private import CoreRE

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public protocol System {
    static var dependencies: [MyRealityFoundation::SystemDependency] { get }
    
    @preconcurrency @MainActor init(scene: Scene)
    @preconcurrency @MainActor mutating func update(context: SceneUpdateContext)
}

extension System {
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
                let systemID: Int32?
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
                        systemID = nil
                    }
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
                        systemID = nil
                    }
                case .beforePhysics:
                    // <+684>
                    systemID = RECustomSystemPhysicsID()
                }
                
                if let systemID {
                    reRESystemDependencies.append(
                        CoreRE::SystemDependency(
                            unknown0: id,
                            unknown1: systemID
                        )
                    )
                } else {
                    // <+992>
                    assertUnimplemented()
                }
            }
        }
        
        // <+1540>
        assertUnimplemented()
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public static var dependencies: [MyRealityFoundation::SystemDependency] {
        get {
            assertUnimplemented()
        }
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
}

enum _SystemUpdateRate : Hashable {
    case _renderRate(divider: Int)
    case _periodic(targetInterval: Double, alsoAtEngineRate: Bool)
    case _default
    case _manualSchedule
}

@_silgen_name("swift_isClassType")
fileprivate func swift_isClassType(metadata: UnsafeRawPointer) -> Bool 
