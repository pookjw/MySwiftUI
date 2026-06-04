@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public enum SystemDependency : Equatable, Sendable {
    case before(any System.Type)
    case after(any System.Type)
    
    public static func == (lhs: SystemDependency, rhs: SystemDependency) -> Bool {
        assertUnimplemented()
    }
}
