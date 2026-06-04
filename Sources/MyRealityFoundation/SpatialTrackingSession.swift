@available(visionOS 2.0, iOS 18.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable, introduced: 26.0)
final public class SpatialTrackingSession : Sendable {
    public struct Configuration {
        public struct AnchorCapability : Equatable, Hashable, Sendable {
            public static func == (a: SpatialTrackingSession.Configuration.AnchorCapability, b: SpatialTrackingSession.Configuration.AnchorCapability) -> Bool {
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
    }
    
    public struct UnavailableCapabilities : Sendable {
        public init() {
            assertUnimplemented()
        }
    }
    
    public init() {
        assertUnimplemented()
    }
    }

@available(visionOS 2.0, iOS 18.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
extension SpatialTrackingSession.Configuration.AnchorCapability {
    @safe public static nonisolated(unsafe) let world: SpatialTrackingSession.Configuration.AnchorCapability = {
        assertUnimplemented()
    }()
    
    @safe public static nonisolated(unsafe) let plane: SpatialTrackingSession.Configuration.AnchorCapability = {
        assertUnimplemented()
    }()
    
    @safe public static nonisolated(unsafe) let image: SpatialTrackingSession.Configuration.AnchorCapability = {
        assertUnimplemented()
    }()
    
    @safe public static nonisolated(unsafe) let object: SpatialTrackingSession.Configuration.AnchorCapability = {
        assertUnimplemented()
    }()
}

@available(visionOS 2.0, iOS 18.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
extension SpatialTrackingSession.UnavailableCapabilities {
    public var anchor: Set<SpatialTrackingSession.Configuration.AnchorCapability> {
        get {
            assertUnimplemented()
        }
    }
}

@available(visionOS 2.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension SpatialTrackingSession.Configuration.AnchorCapability {
    @safe public static nonisolated(unsafe) let hand: SpatialTrackingSession.Configuration.AnchorCapability = {
        assertUnimplemented()
    }()
}

@available(visionOS 26.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension SpatialTrackingSession.Configuration.AnchorCapability {
    @safe public static nonisolated(unsafe) let accessory: SpatialTrackingSession.Configuration.AnchorCapability = {
        assertUnimplemented()
    }()
}

@available(visionOS 2.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension SpatialTrackingSession.Configuration {
    @available(visionOS 2.0, *)
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    @available(iOS, unavailable)
    public init(tracking capabilities: Set<SpatialTrackingSession.Configuration.AnchorCapability>) {
        assertUnimplemented()
    }
}

@available(visionOS 26.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension SpatialTrackingSession.Configuration {
    public init(tracking anchorCapabilities: Set<SpatialTrackingSession.Configuration.AnchorCapability> = [], sceneUnderstanding: Set<SpatialTrackingSession.Configuration.SceneUnderstandingCapability> = []) {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, iOS 18.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension SpatialTrackingSession {
    @discardableResult
    final public func run(_ spatialTrackingConfiguration: SpatialTrackingSession.Configuration) async -> SpatialTrackingSession.UnavailableCapabilities? {
        assertUnimplemented()
    }
    
    final public func stop() async {
        assertUnimplemented()
    }
}

@available(iOS 18.0, *)
@available(visionOS, unavailable)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
extension SpatialTrackingSession.Configuration.AnchorCapability {
    @safe public static nonisolated(unsafe) let camera: SpatialTrackingSession.Configuration.AnchorCapability = {
        assertUnimplemented()
    }()
    
    @safe public static nonisolated(unsafe) let face: SpatialTrackingSession.Configuration.AnchorCapability = {
        assertUnimplemented()
    }()
    
    @safe public static nonisolated(unsafe) let body: SpatialTrackingSession.Configuration.AnchorCapability = {
        assertUnimplemented()
    }()
}

@available(visionOS 26.0, iOS 18.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
extension SpatialTrackingSession.Configuration {
    public struct SceneUnderstandingCapability : Equatable, Hashable, Sendable {
        public static func == (a: SpatialTrackingSession.Configuration.SceneUnderstandingCapability, b: SpatialTrackingSession.Configuration.SceneUnderstandingCapability) -> Bool {
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
    
    @available(visionOS, unavailable)
    public enum Camera {
        case back
        case front
        
        public static func == (a: SpatialTrackingSession.Configuration.Camera, b: SpatialTrackingSession.Configuration.Camera) -> Bool {
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
}

@available(iOS 18.0, *)
@available(visionOS, unavailable)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
extension SpatialTrackingSession.Configuration.SceneUnderstandingCapability {
    @safe public static nonisolated(unsafe) let shadow: SpatialTrackingSession.Configuration.SceneUnderstandingCapability = {
        assertUnimplemented()
    }()
    
    @safe public static nonisolated(unsafe) let occlusion: SpatialTrackingSession.Configuration.SceneUnderstandingCapability = {
        assertUnimplemented()
    }()
}

@available(visionOS 26.0, iOS 18.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
extension SpatialTrackingSession.Configuration.SceneUnderstandingCapability {
    @safe public static nonisolated(unsafe) let collision: SpatialTrackingSession.Configuration.SceneUnderstandingCapability = {
        assertUnimplemented()
    }()
    
    @safe public static nonisolated(unsafe) let physics: SpatialTrackingSession.Configuration.SceneUnderstandingCapability = {
        assertUnimplemented()
    }()
}

@available(iOS 18.0, *)
@available(visionOS, unavailable)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
extension SpatialTrackingSession.Configuration {
    @available(iOS 18.0, *)
    @available(visionOS, unavailable)
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    public init(tracking anchorCapabilities: Set<SpatialTrackingSession.Configuration.AnchorCapability> = [], sceneUnderstanding: Set<SpatialTrackingSession.Configuration.SceneUnderstandingCapability> = [], camera: SpatialTrackingSession.Configuration.Camera = .back) {
        assertUnimplemented()
    }
}

@available(visionOS 26.0, iOS 18.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
extension SpatialTrackingSession.UnavailableCapabilities {
    public var sceneUnderstanding: Set<SpatialTrackingSession.Configuration.SceneUnderstandingCapability> {
        get {
            assertUnimplemented()
        }
    }
}

@available(iOS 18.0, *)
@available(visionOS, unavailable)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
extension SpatialTrackingSession.UnavailableCapabilities {
    public var missingCameraAuthorization: Bool? {
        get {
            assertUnimplemented()
        }
    }
}

@available(visionOS 2.0, iOS 18.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
extension SpatialTrackingSession.Configuration.AnchorCapability : CustomStringConvertible {
    public var description: String {
        get {
            assertUnimplemented()
        }
    }
    
    public var debugDescription: String {
        get {
            assertUnimplemented()
        }
    }
}

@available(visionOS 26.0, iOS 18.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
extension SpatialTrackingSession.Configuration.SceneUnderstandingCapability : CustomStringConvertible {
    public var description: String {
        get {
            assertUnimplemented()
        }
    }
    
    public var debugDescription: String {
        get {
            assertUnimplemented()
        }
    }
}

@available(visionOS 2.0, iOS 18.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
extension SpatialTrackingSession.Configuration : CustomStringConvertible {
    public var description: String {
        get {
            assertUnimplemented()
        }
    }
    
    public var debugDescription: String {
        get {
            assertUnimplemented()
        }
    }
}

@available(iOS 18.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
@available(visionOS, unavailable)
extension SpatialTrackingSession.Configuration.Camera : Equatable {}

@available(iOS 18.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
@available(visionOS, unavailable)
extension SpatialTrackingSession.Configuration.Camera : Hashable {}
