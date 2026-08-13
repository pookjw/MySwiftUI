@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public protocol System {
    static var dependencies: [SystemDependency] { get }
    
    @preconcurrency @MainActor init(scene: Scene)
    @preconcurrency @MainActor mutating func update(context: SceneUpdateContext)
}

extension System {
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    @preconcurrency @MainActor public static func registerSystem() {
        /*
         self -> x0 -> x26
         witness table -> x1 -> x25
         */
        let registry = SystemRegistry.shared
        
        assertUnimplemented()
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public static var dependencies: [SystemDependency] {
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
    private(set) var registeredSystems: [any System.Type] = [] // 0x18
    
    func getId(of system: any System.Type) -> Int32? {
        assertUnimplemented()
    }
    
    func getOrAddId(of system: any System.Type) -> Int32 {
        assertUnimplemented()
    }
}
