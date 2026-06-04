@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
public struct SpatialAudioComponent {
    public var gain: Audio.Decibel
    
    public var directLevel: Audio.Decibel
    
    public var reverbLevel: Audio.Decibel
    
    public var directivity: Audio.Directivity
    
    public init(gain: Audio.Decibel = .zero, directLevel: Audio.Decibel = .zero, reverbLevel: Audio.Decibel = .zero, directivity: Audio.Directivity = .beam(focus: .zero)) {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension SpatialAudioComponent : Component {
    @MainActor @preconcurrency public static func __fromCore(_ coreComponent: __ComponentRef) -> SpatialAudioComponent {
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
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension SpatialAudioComponent : Equatable, Hashable, Codable {
    public static func == (a: SpatialAudioComponent, b: SpatialAudioComponent) -> Bool {
        assertUnimplemented()
    }
    
    public func encode(to encoder: any Encoder) throws {
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
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension SpatialAudioComponent {
    public init(gain: Audio.Decibel = .zero, directLevel: Audio.Decibel = .zero, reverbLevel: Audio.Decibel = .zero, directivity: Audio.Directivity = .beam(focus: .zero), distanceAttenuation: Audio.DistanceAttenuation) {
        assertUnimplemented()
    }
    
    public var distanceAttenuation: Audio.DistanceAttenuation {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}
