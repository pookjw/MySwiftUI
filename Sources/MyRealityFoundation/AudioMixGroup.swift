public import Foundation

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
public struct AudioMixGroup {
    public let name: String
    
    public var gain: Audio.Decibel {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var speed: Double
    
    public var isMuted: Bool
    
    public init(name: String) {
        assertUnimplemented()
    }
    
    public mutating func fade(to gain: Audio.Decibel, duration: TimeInterval) {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension AudioMixGroup : Equatable {
    public static func == (lhs: AudioMixGroup, rhs: AudioMixGroup) -> Bool {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension AudioMixGroup : Hashable {
    public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    public var hashValue: Int {
        get {
            assertUnimplemented()
        }
    }
}
