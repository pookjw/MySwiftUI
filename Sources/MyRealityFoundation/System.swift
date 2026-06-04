@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public protocol System {
    static var dependencies: [SystemDependency] { get }
    
    @preconcurrency @MainActor init(scene: Scene)
    @preconcurrency @MainActor mutating func update(context: SceneUpdateContext)
}

extension System {
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    @preconcurrency @MainActor public static func registerSystem() {
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
