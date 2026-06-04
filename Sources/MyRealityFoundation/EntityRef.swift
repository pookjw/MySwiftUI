@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __EntityRef : Equatable {
    public func __as<T>(_ type: T.Type) -> T {
        assertUnimplemented()
    }
    
    public static func __fromCore(_ core: Any) -> __EntityRef {
        assertUnimplemented()
    }
    
    public static func == (a: __EntityRef, b: __EntityRef) -> Bool {
        assertUnimplemented()
    }
}
