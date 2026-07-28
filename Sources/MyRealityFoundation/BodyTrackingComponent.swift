public import Foundation

@available(iOS 13.0, macCatalyst 14.0, *)
@available(macOS, unavailable, introduced: 26.0)
@available(visionOS, unavailable, introduced: 1.0)
@available(tvOS, unavailable, introduced: 26.0)
public struct BodyTrackingComponent : Component, Equatable {
    public enum Target : Hashable {
        case any
        case body(identifier: UUID)
        
        public static func == (lhs: BodyTrackingComponent.Target, rhs: BodyTrackingComponent.Target) -> Bool {
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
    
    public var target: BodyTrackingComponent.Target
    
    public var isPaused: Bool
    
    public init() {
        assertUnimplemented()
    }
    
    public init(_ target: BodyTrackingComponent.Target) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func __fromCore(_ coreComponent: __ComponentRef) -> BodyTrackingComponent {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func __toCore(_ component: __ComponentRef) {
        assertUnimplemented()
    }
    
    public static func == (a: BodyTrackingComponent, b: BodyTrackingComponent) -> Bool {
        assertUnimplemented()
    }

    @_spi(Internal) public static var componentName: String {
        get {
            assertUnimplemented()
        }
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
        get {
            assertUnimplemented()
        }
    }

    @_spi(Internal) public static func __load(from ref: UnsafeRawPointer, offset: Int) -> any MyRealityFoundation.Component {
        assertUnimplemented()
    }

    @_spi(Internal) public static var coreComponentType: CoreComponentType {
        assertUnimplemented()
    }
}
