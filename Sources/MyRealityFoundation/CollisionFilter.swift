@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct CollisionFilter : Equatable, Sendable {
    public static let `default`: CollisionFilter = {
        assertUnimplemented()
    }()
    
    public static let sensor: CollisionFilter = {
        assertUnimplemented()
    }()
    
    public var group: CollisionGroup
    
    public var mask: CollisionGroup
    
    public init(group: CollisionGroup, mask: CollisionGroup) {
        assertUnimplemented()
    }
    
    public static func == (a: CollisionFilter, b: CollisionFilter) -> Bool {
        assertUnimplemented()
    }
}
