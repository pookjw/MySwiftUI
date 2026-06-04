@_hasMissingDesignatedInitializers @available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
@MainActor public class AudioGeneratorController {
    @MainActor weak public var entity: Entity? {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor final public let configuration: AudioGeneratorConfiguration = {
        assertUnimplemented()
    }()
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension AudioGeneratorController {
    @MainActor public var gain: Audio.Decibel {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension AudioGeneratorController {
    @MainActor public var isPlaying: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor public func play() {
        assertUnimplemented()
    }
    
    @MainActor public func stop() {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension AudioGeneratorController : Sendable {}
