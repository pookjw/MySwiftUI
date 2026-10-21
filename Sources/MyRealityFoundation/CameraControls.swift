@available(iOS 18.0, macCatalyst 18.0, macOS 15.0, visionOS 2.0, *)
@available(tvOS, unavailable)
public struct CameraControls : Hashable, Sendable {
    public static var none: CameraControls {
        get {
            assertUnimplemented()
        }
    }
    
    public static var tilt: CameraControls {
        get {
            assertUnimplemented()
        }
    }
    
    public static var pan: CameraControls {
        get {
            assertUnimplemented()
        }
    }
    
    public static var orbit: CameraControls {
        get {
            assertUnimplemented()
        }
    }
    
    public static var dolly: CameraControls {
        get {
            assertUnimplemented()
        }
    }
    
    public var interactionMode: CameraControls.InteractionMode? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public enum InteractionMode : Hashable, CaseIterable {
        case orbitArcball
        case orbitTurntable
        case orbitAngleMapping
        case orbitCenteredArcball
        case fly
        case pan
        case truck
        
        public static func == (a: CameraControls.InteractionMode, b: CameraControls.InteractionMode) -> Bool {
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
    
    public static func == (a: CameraControls, b: CameraControls) -> Bool {
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
