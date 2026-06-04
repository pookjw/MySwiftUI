@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public protocol Component {
    @available(macOS, deprecated: 13.0, renamed: "componentName")
    @available(iOS, deprecated: 16.0, renamed: "componentName")
    @available(tvOS, unavailable)
    static var __typeName: String { get }
    
    static var __size: Int { get }
    
    static func __free(to buffer: UnsafeMutableRawPointer, offset: Int)
    
    @preconcurrency @MainActor static func __fromCore(_ coreComponent: __ComponentRef) -> Self
    @preconcurrency @MainActor func __toCore(_ coreComponent: __ComponentRef)
    @preconcurrency @MainActor static func __addIntrospectionData(_ builder: OpaquePointer?)
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Component {
    @available(visionOS, introduced: 1.0, deprecated: 1.0, renamed: "componentName")
    @available(macOS, introduced: 10.15, deprecated: 13.0, renamed: "componentName")
    @available(iOS, introduced: 13.0, deprecated: 16.0, renamed: "componentName")
    @available(macCatalyst, introduced: 13.0, deprecated: 16.0, renamed: "componentName")
    @available(tvOS, unavailable)
    public static var __typeName: String {
        get {
            assertUnimplemented()
        }
    }
    
    public static var __size: Int {
        get {
            assertUnimplemented()
        }
    }
    
    public static func __free(to buffer: UnsafeMutableRawPointer, offset: Int) {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public static func __fromCore(_ coreComponent: __ComponentRef) -> Self {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
    
    public static func __addIntrospectionData(_ builder: OpaquePointer?) {
        assertUnimplemented()
    }
    
    public static func registerComponent() {
        assertUnimplemented()
    }
}
