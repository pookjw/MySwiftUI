public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public enum SceneEvents {
    public struct Update : Event {
        public let scene: Scene
        
        public let deltaTime: TimeInterval
    }
    
    public struct AnchoredStateChanged : Event {
        public let isAnchored: Bool
        
        public let anchor: any HasAnchoring
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension SceneEvents {
    public struct DidAddEntity : Event {
        public let entity: Entity
    }
    
    public struct DidActivateEntity : Event {
        public let entity: Entity
    }
    
    public struct WillDeactivateEntity : Event {
        public let entity: Entity
    }
    
    public struct WillRemoveEntity : Event {
        public let entity: Entity
    }
    
    public struct DidReparentEntity : Event {
        public let child: Entity
        
        public let previousParent: Entity?
    }
}

@available(visionOS 26.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
extension SceneEvents {
    @available(visionOS 26.0, *)
    @available(iOS, unavailable)
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    @available(tvOS, unavailable)
    public struct TrackingStateUpdate : Event {
        @available(visionOS 26.0, *)
        @available(iOS, unavailable)
        @available(macOS, unavailable)
        @available(macCatalyst, unavailable)
        @available(tvOS, unavailable)
        public enum State : Sendable, Hashable {
            case tracked
            case untracked
            case orientationTracked
            
            public static func == (a: SceneEvents.TrackingStateUpdate.State, b: SceneEvents.TrackingStateUpdate.State) -> Bool {
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
        
        public let previous: SceneEvents.TrackingStateUpdate.State
        
        public let current: SceneEvents.TrackingStateUpdate.State
    }
}
