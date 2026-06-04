public import CoreMedia
public import Foundation
public import Observation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@preconcurrency @MainActor public class AnimationPlaybackController : Hashable {
    @MainActor @preconcurrency public var __identifier: __AnimationPlaybackTokenRef {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency weak public var entity: Entity? {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var isPaused: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var isComplete: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    nonisolated public static func == (lhs: AnimationPlaybackController, rhs: AnimationPlaybackController) -> Bool {
        assertUnimplemented()
    }
    
    nonisolated public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func pause() {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func resume() {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func stop() {
        assertUnimplemented()
    }
    
    nonisolated public var hashValue: Int {
        get {
            assertUnimplemented()
        }
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension AnimationPlaybackController {
    @MainActor @preconcurrency public var isValid: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var isPlaying: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var isStopped: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var speed: Float {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var time: TimeInterval {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var blendFactor: Float {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var duration: TimeInterval {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var clock: CMClockOrTimebase {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension AnimationPlaybackController {
    @MainActor @preconcurrency public func stop(blendOutDuration: TimeInterval) {
        assertUnimplemented()
    }
}

@available(visionOS 26.0, macOS 26.0, iOS 26.0, macCatalyst 26.0, tvOS 26.0, *)
extension AnimationPlaybackController : Observable {
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension AnimationPlaybackController : Sendable {}
