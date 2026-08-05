internal import CoreRE

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __ComponentTypeRef {
    var core: CoreRE::ComponentType
    
    public static func __fromCore(_ core: Any) -> __ComponentTypeRef {
        assertUnimplemented()
    }
    
    public func __as<T>(_ type: T.Type) -> T {
        assertUnimplemented()
    }
}
