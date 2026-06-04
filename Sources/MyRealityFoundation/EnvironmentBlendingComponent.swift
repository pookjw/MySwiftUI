@available(visionOS 26.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct EnvironmentBlendingComponent : Component, Equatable {
    public enum EnvironmentType : Equatable, Hashable, Sendable {
        case surroundings
        
        public static func == (a: EnvironmentBlendingComponent.EnvironmentType, b: EnvironmentBlendingComponent.EnvironmentType) -> Bool {
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
    
    public struct BlendingMode : Equatable, Hashable, Sendable {
        public static var `default`: EnvironmentBlendingComponent.BlendingMode {
            get {
                assertUnimplemented()
            }
        }
        
        public static func occluded(by environmentType: EnvironmentBlendingComponent.EnvironmentType) -> EnvironmentBlendingComponent.BlendingMode {
            assertUnimplemented()
        }
        
        public static func == (a: EnvironmentBlendingComponent.BlendingMode, b: EnvironmentBlendingComponent.BlendingMode) -> Bool {
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
    
    public var preferredBlendingMode: EnvironmentBlendingComponent.BlendingMode
    
    public init() {
        assertUnimplemented()
    }
    
    public init(preferredBlendingMode: EnvironmentBlendingComponent.BlendingMode) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func __fromCore(_ coreComponent: __ComponentRef) -> EnvironmentBlendingComponent {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
    
    public static var __coreComponentType: __ComponentTypeRef {
        get {
            assertUnimplemented()
        }
    }
    
    public static func == (a: EnvironmentBlendingComponent, b: EnvironmentBlendingComponent) -> Bool {
        assertUnimplemented()
    }
}
