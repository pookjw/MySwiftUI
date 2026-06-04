@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public enum CollisionCastQueryType : Hashable {
    case nearest
    case all
    case any
    
    public static func == (a: CollisionCastQueryType, b: CollisionCastQueryType) -> Bool {
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
