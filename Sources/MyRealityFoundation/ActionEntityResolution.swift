@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public enum ActionEntityResolution : Codable, Equatable {
    case entityPath(BindTarget.EntityPath)
    case entityNamed(String)
    
    public static var sourceEntity: ActionEntityResolution {
        get {
            assertUnimplemented()
        }
    }
    
    public static func == (lhs: ActionEntityResolution, rhs: ActionEntityResolution) -> Bool {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
}
