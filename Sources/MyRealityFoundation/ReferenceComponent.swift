public import Foundation

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct ReferenceComponent : Component {
    public enum LoadingPolicy {
        case immediate
        case onDemand
        
        public static func == (a: ReferenceComponent.LoadingPolicy, b: ReferenceComponent.LoadingPolicy) -> Bool {
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
    
    public enum ReferenceState {
        case notLoaded
        case loading
        case loaded
        
        public static func == (a: ReferenceComponent.ReferenceState, b: ReferenceComponent.ReferenceState) -> Bool {
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
    
    public var loadingPolicy: ReferenceComponent.LoadingPolicy {
        get {
            assertUnimplemented()
        }
    }
    
    public var state: ReferenceComponent.ReferenceState {
        get {
            assertUnimplemented()
        }
    }
    
    public var reference: Entity? {
        get {
            assertUnimplemented()
        }
    }
    
    public init(named name: String, at bundlePath: String = "", loadingPolicy: ReferenceComponent.LoadingPolicy = .onDemand) {
        assertUnimplemented()
    }
    
    public init(named name: String, in bundle: Bundle, loadingPolicy: ReferenceComponent.LoadingPolicy = .onDemand) {
        assertUnimplemented()
    }
    
    public init(named name: String, loadingPolicy: ReferenceComponent.LoadingPolicy = .onDemand) {
        assertUnimplemented()
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension ReferenceComponent {
    public static func __fromCore(_ coreComponent: __ComponentRef) -> ReferenceComponent {
        assertUnimplemented()
    }
    
    public func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
    
    public static var __coreComponentType: __ComponentTypeRef {
        get {
            assertUnimplemented()
        }
    }
    
    public static func loadReference(at entity: Entity) throws {
        assertUnimplemented()
    }
    
    @MainActor public static func loadReference(at entity: Entity) async throws {
        assertUnimplemented()
    }
    
    public static func releaseReference(at entity: Entity) throws {
        assertUnimplemented()
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension ReferenceComponent.LoadingPolicy : Equatable {}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension ReferenceComponent.LoadingPolicy : Hashable {}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension ReferenceComponent.ReferenceState : Equatable {}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension ReferenceComponent.ReferenceState : Hashable {}
