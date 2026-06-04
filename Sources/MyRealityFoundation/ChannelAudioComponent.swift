@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
public struct ChannelAudioComponent {
    public var gain: Audio.Decibel
    
    public init(gain: Audio.Decibel = .zero) {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension ChannelAudioComponent : Component {
    @MainActor @preconcurrency public static func __fromCore(_ coreComponent: __ComponentRef) -> ChannelAudioComponent {
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
extension ChannelAudioComponent : Equatable, Hashable, Codable {
    public static func == (a: ChannelAudioComponent, b: ChannelAudioComponent) -> Bool {
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
