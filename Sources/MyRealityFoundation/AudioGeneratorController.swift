internal import CoreAudio
internal import Foundation

@_hasMissingDesignatedInitializers @available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
@MainActor public class AudioGeneratorController {
    deinit {
        assertUnimplemented()
    }

    init(generatorRenderHandler: @escaping (UnsafeMutablePointer<ObjCBool>, UnsafePointer<AudioTimeStamp>, UInt32, UnsafeMutablePointer<AudioBufferList>) -> Int32, configuration: AudioGeneratorConfiguration, entity: Entity) throws {
        assertUnimplemented()
    }

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
