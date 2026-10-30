// FAF410D0B8C97A51B0FADAADE1A02F93
public import ARKit
public import MySwiftUICore

@available(visionOS 26.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public struct SurfaceSnappingInfo : Equatable, Sendable, CustomDebugStringConvertible {
    fileprivate static let __authorizationStatus = AtomicBox<AuthorizationStatus>(wrappedValue: .notDetermined)
    
    public internal(set) static var authorizationStatus: SurfaceSnappingInfo.AuthorizationStatus {
        get {
            return __authorizationStatus.wrappedValue
        }
        set {
            __authorizationStatus.wrappedValue = newValue
        }
    }
    
    public internal(set) var isSnapped = false
    public internal(set) var classification: ARKit::SurfaceClassification? = nil
    
    public var debugDescription: String {
        assertUnimplemented()
    }
}

extension SurfaceSnappingInfo {
    @available(visionOS 26.0, *)
    @available(iOS, unavailable)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    public enum AuthorizationStatus : Sendable, Hashable {
        case notDetermined
        case denied
        case authorized
        case restricted
    }
}

struct _SceneSnapState : Equatable, CustomDebugStringConvertible {
    private(set) var isSnapped: Bool = false
    private(set) var classification: _SurfaceClassificationStatus = .notDetermined
    
    var debugDescription: String {
        assertUnimplemented()
    }
}

enum _SurfaceClassificationStatus : Equatable, CustomDebugStringConvertible {
    case authorized(ARKit::SurfaceClassification?)
    case notDetermined
    case denied
    
    var debugDescription: String {
        assertUnimplemented()
    }
}

extension EnvironmentValues {
    @available(visionOS 26.0, *)
    @available(iOS, unavailable)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    public internal(set) var surfaceSnappingInfo: SurfaceSnappingInfo {
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
    
    struct SurfaceSnappingInfoKey : EnvironmentKey {
        static let defaultValue = SurfaceSnappingInfo() 
    }
    
    struct SceneSnapStateKey : EnvironmentKey {
        static let defaultValue = _SceneSnapState()
    }
}
