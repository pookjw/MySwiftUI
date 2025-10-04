public import ARKit
public import MySwiftUICore

public struct SurfaceSnappingInfo: Equatable, Sendable, CustomDebugStringConvertible {
    public static var authorizationStatus: SurfaceSnappingInfo.AuthorizationStatus {
        fatalError("TODO")
    }
    
    public private(set) var isSnapped = false
    public private(set) var classification: ARKit.SurfaceClassification? = nil
    
    public var debugDescription: String {
        fatalError("TODO")
    }
}

extension SurfaceSnappingInfo {
    public enum AuthorizationStatus: Sendable, Hashable {
        case notDetermined
        case denied
        case authorized
        case restricted
    }
}

struct _SceneSnapState: Equatable, CustomDebugStringConvertible {
    private var isSnapped: Bool = false
    private var classification: _SurfaceClassificationStatus = .notDetermined
    
    var debugDescription: String {
        fatalError("TODO")
    }
}

enum _SurfaceClassificationStatus: Equatable, CustomDebugStringConvertible {
    case authorized(ARKit.SurfaceClassification?)
    case notDetermined
    case denied
    
    var debugDescription: String {
        fatalError("TODO")
    }
}

extension EnvironmentValues {
    public private(set) var surfaceSnappingInfo: SurfaceSnappingInfo {
        get {
            return self[SurfaceSnappingInfoKey.self]
        }
        set {
            self[SurfaceSnappingInfoKey.self] = newValue
        }
    }
    
    var _sceneSnapState: _SceneSnapState {
        get {
            return self[SceneSnapStateKey.self]
        }
        set {
            self[SceneSnapStateKey.self] = newValue
        }
    }
    
    struct SurfaceSnappingInfoKey: EnvironmentKey {
        static let defaultValue = SurfaceSnappingInfo() 
    }
    
    struct SceneSnapStateKey: EnvironmentKey {
        static let defaultValue = _SceneSnapState()
    }
}
