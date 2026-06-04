@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct PhysicsJointsComponent : Component, Equatable {
    public init() {
        assertUnimplemented()
    }
    
    public var joints: PhysicsJoints
    
    public static func == (a: PhysicsJointsComponent, b: PhysicsJointsComponent) -> Bool {
        assertUnimplemented()
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension PhysicsJointsComponent {
    public static func __fromCore(_ coreComponent: __ComponentRef) -> PhysicsJointsComponent {
        assertUnimplemented()
    }
    
    public func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
    
    public static var __coreComponentType: __ComponentTypeRef {
        get {
            assertUnimplemented()
        }
    }
}
