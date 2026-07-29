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

    @_spi(Internal) public static func __load(from ref: UnsafeRawPointer, offset: Int) -> any MyRealityFoundation::Component {
        assertUnimplemented()
    }

    @_spi(Internal) public static var coreComponentType: CoreComponentType {
        assertUnimplemented()
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
