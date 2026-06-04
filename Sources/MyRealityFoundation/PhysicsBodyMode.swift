@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public enum PhysicsBodyMode : Hashable {
    case `static`
    case kinematic
    case dynamic
    
    public static func == (a: PhysicsBodyMode, b: PhysicsBodyMode) -> Bool {
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
