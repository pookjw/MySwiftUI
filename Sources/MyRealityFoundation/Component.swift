internal import CoreRE
internal import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public protocol Component {
    @available(macOS, deprecated: 13.0, renamed: "componentName")
    @available(iOS, deprecated: 16.0, renamed: "componentName")
    @available(tvOS, unavailable)
    static var __typeName: String { get }
    @_spi(Internal) static var componentName: String { get }
    static var __size: Int { get }
    @_spi(Internal) static func __load(from ref: UnsafeRawPointer)
    @_spi(Internal) static func __store(attribute: any MyRealityFoundation::Component, to ref: UnsafeMutableRawPointer, offset: Int, deinitialize: Bool)
    @_spi(Internal) static func __store(attribute: any MyRealityFoundation::Component, to ref: UnsafeMutableRawPointer, offset: Int)
    static func __free(to buffer: UnsafeMutableRawPointer, offset: Int)
    @preconcurrency @MainActor static func __fromCore(_ coreComponent: __ComponentRef) -> Self
    @preconcurrency @MainActor func __toCore(_ coreComponent: __ComponentRef)
    @_spi(Internal) static var __coreComponentType: __ComponentTypeRef { get }
    @preconcurrency @MainActor static func __addIntrospectionData(_ builder: OpaquePointer?)
    @_spi(Internal) static func __load(from ref: UnsafeRawPointer, offset: Int) -> any MyRealityFoundation::Component
    @_spi(Internal) static var coreComponentType: CoreComponentType { get }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Component {
    @available(visionOS, introduced: 1.0, deprecated: 1.0, renamed: "componentName")
    @available(macOS, introduced: 10.15, deprecated: 13.0, renamed: "componentName")
    @available(iOS, introduced: 13.0, deprecated: 16.0, renamed: "componentName")
    @available(macCatalyst, introduced: 13.0, deprecated: 16.0, renamed: "componentName")
    @available(tvOS, unavailable)
    public static var __typeName: String {
        return Self.componentName
    }
    
    public static var __size: Int {
        return MemoryLayout<Self>.size
    }
    
    public static func __free(to buffer: UnsafeMutableRawPointer, offset: Int) {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public static func __fromCore(_ coreComponent: __ComponentRef) -> Self {
        preconditionFailure("Built-in component did not provide __fromCore method.")
    }
    
    @preconcurrency @MainActor public func __toCore(_ coreComponent: __ComponentRef) {
        preconditionFailure("Built-in component did not provide __toCore method.")
    }
    
    public static func __addIntrospectionData(_ builder: OpaquePointer?) {
        // nop
    }
    
    public static func registerComponent() {
        assertUnimplemented()
    }
    
    @_spi(Internal) public static var componentName: String {
        return String(reflecting: self)
    }

    @_spi(Internal) public static func __load(from ref: UnsafeRawPointer) {
        assertUnimplemented()
    }

    @_spi(Internal) public static func __store(attribute: any MyRealityFoundation::Component, to ref: UnsafeMutableRawPointer, offset: Int, deinitialize: Bool) {
        assertUnimplemented()
    }

    @_spi(Internal) public static func __store(attribute: any MyRealityFoundation::Component, to ref: UnsafeMutableRawPointer, offset: Int) {
        assertUnimplemented()
    }

    @_spi(Internal) public static var __coreComponentType: __ComponentTypeRef {
        return __ComponentTypeRef(core: .custom)
    }

    @_spi(Internal) public static func __load(from ref: UnsafeRawPointer, offset: Int) -> any MyRealityFoundation::Component {
        assertUnimplemented()
    }

    @_spi(Internal) public static var coreComponentType: CoreComponentType {
        return unsafe CoreComponentType(originType: .custom)
    }
}

protocol DefaultInitializable : MyRealityFoundation::Component {
    init()
}

@unsafe @_spi(Internal) public struct CoreComponentType {
    fileprivate private(set) var originType: CoreComponentType.OriginType
}

extension CoreComponentType {
    @unsafe enum OriginType {
        case system(CoreRE::Component.ClassPtr)
        case custom
    }
}

extension Component {
    static func registerBuiltin(
        bundle: Bundle,
        reComponentClass: CoreRE::Component.ClassPtr?,
        access: ComponentInfo.Access,
        availability: ComponentInfo.Availability
    ) {
        /*
         bundle -> x0 -> x27
         reComponentClass -> x1 -> x25
         access -> x2 -> w28
         availability -> x3 -> x22/x21/x23
         */
        // x24
        let engine = __ServiceLocator.__sharedEngine!
        assertUnimplemented()
    }
}
