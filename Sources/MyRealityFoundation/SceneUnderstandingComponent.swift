@available(iOS 13.4, macCatalyst 14.0, visionOS 1.0, *)
@available(macOS, unavailable, introduced: 26.0)
@available(tvOS, unavailable, introduced: 26.0)
public struct SceneUnderstandingComponent : Component {
    @available(iOS 15.0, macCatalyst 15.0, visionOS 1.0, *)
    @available(macOS, unavailable, introduced: 26.0)
    public enum EntityType : Hashable {
        case meshChunk
        @available(visionOS, unavailable)
        case face
        
        public static func == (a: SceneUnderstandingComponent.EntityType, b: SceneUnderstandingComponent.EntityType) -> Bool {
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
    
    @available(iOS 15.0, macCatalyst 15.0, visionOS 1.0, *)
    @available(macOS, unavailable, introduced: 26.0)
    public init(entityType: SceneUnderstandingComponent.EntityType?) {
        assertUnimplemented()
    }
    
    @available(iOS 15.0, macCatalyst 15.0, visionOS 1.0, *)
    @available(macOS, unavailable, introduced: 26.0)
    public init() {
        assertUnimplemented()
    }
    
    @available(iOS 15.0, macCatalyst 15.0, visionOS 1.0, *)
    @available(macOS, unavailable, introduced: 26.0)
    public var entityType: SceneUnderstandingComponent.EntityType?
}

@available(iOS 18.0, macCatalyst 18.0, visionOS 1.0, *)
@available(macOS, unavailable, introduced: 26.0)
@available(tvOS, unavailable, introduced: 26.0)
extension SceneUnderstandingComponent {
    public enum Origin : Hashable {
        case system
        case user
        
        public static func == (a: SceneUnderstandingComponent.Origin, b: SceneUnderstandingComponent.Origin) -> Bool {
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
    
    public var origin: SceneUnderstandingComponent.Origin {
        get {
            assertUnimplemented()
        }
    }
}

@available(iOS 13.4, macCatalyst 14.0, *)
@available(macOS, unavailable, introduced: 26.0)
@available(tvOS, unavailable, introduced: 26.0)
extension SceneUnderstandingComponent {
    public static func __fromCore(_ coreComponent: __ComponentRef) -> SceneUnderstandingComponent {
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
}
