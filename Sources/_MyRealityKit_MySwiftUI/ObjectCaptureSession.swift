public import Foundation
public import Observation

@available(iOS 17.0, *)
@available(watchOS, unavailable)
@available(macOS, unavailable, introduced: 15.0)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
@available(visionOS, unavailable)
@MainActor public class ObjectCaptureSession : Identifiable {
    public struct Updates<Element> : AsyncSequence, Sendable where Element : Sendable {
        public struct Iterator : AsyncIteratorProtocol {
            public mutating func next() async -> Element? {
                assertUnimplemented()
            }
            
            @available(iOS 18.0, *)
            @available(tvOS, unavailable, introduced: 18.0)
            @available(watchOS, unavailable, introduced: 11.0)
            @available(visionOS, unavailable, introduced: 2.0)
            @available(macOS, unavailable, introduced: 15.0)
            @available(macCatalyst, unavailable)
            @_implements(AsyncIteratorProtocol, Failure) public typealias __AsyncIteratorProtocol_Failure = Never
        }
        
        public func makeAsyncIterator() -> ObjectCaptureSession.Updates<Element>.Iterator {
            assertUnimplemented()
        }
        
        @available(iOS 17.0, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(visionOS, unavailable)
        @available(macOS, unavailable, introduced: 15.0)
        @available(macCatalyst, unavailable)
        public typealias AsyncIterator = ObjectCaptureSession.Updates<Element>.Iterator
        
        @available(iOS 18.0, *)
        @available(tvOS, unavailable, introduced: 18.0)
        @available(watchOS, unavailable, introduced: 11.0)
        @available(visionOS, unavailable, introduced: 2.0)
        @available(macOS, unavailable, introduced: 15.0)
        @available(macCatalyst, unavailable)
        @_implements(AsyncSequence, Failure) public typealias __AsyncSequence_Failure = Never
    }
    
    public enum Error : Swift.Error, LocalizedError {
        case directoryNotEmpty(URL)
        case insufficientStorage(requiredBytes: Int64)
        case cancelled
        case sensorFailed
        case trackingFailed
        
        public var localizedDescription: String {
            get {
                assertUnimplemented()
            }
        }
    }
    
    @MainActor public static var isSupported: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor public init() {
        assertUnimplemented()
    }
    
    public enum CaptureState : Equatable {
        case initializing
        case ready
        case detecting
        case capturing
        case finishing
        case completed
        case failed(any Swift.Error)
        
        public static func == (lhs: ObjectCaptureSession.CaptureState, rhs: ObjectCaptureSession.CaptureState) -> Bool {
            assertUnimplemented()
        }
    }
    
    @MainActor public var state: ObjectCaptureSession.CaptureState {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor public var stateUpdates: ObjectCaptureSession.Updates<ObjectCaptureSession.CaptureState> {
        get {
            assertUnimplemented()
        }
    }
    
    public enum Feedback : Equatable {
        case objectTooClose
        case objectTooFar
        case movingTooFast
        case environmentLowLight
        case environmentTooDark
        case outOfFieldOfView
        case objectNotFlippable
        case overCapturing
        @available(iOS 17.4, *)
        @available(watchOS, unavailable)
        @available(macOS, unavailable)
        @available(macCatalyst, unavailable)
        @available(tvOS, unavailable)
        @available(visionOS, unavailable)
        case objectNotDetected
        
        public static func == (a: ObjectCaptureSession.Feedback, b: ObjectCaptureSession.Feedback) -> Bool {
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
    
    @MainActor public var feedback: Set<ObjectCaptureSession.Feedback> {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor public var feedbackUpdates: ObjectCaptureSession.Updates<Set<ObjectCaptureSession.Feedback>> {
        get {
            assertUnimplemented()
        }
    }
    
    public enum Tracking : Equatable, Sendable {
        public enum Reason : Sendable {
            case initializing
            case relocalizing
            case excessiveMotion
            case insufficientFeatures
            
            public static func == (a: ObjectCaptureSession.Tracking.Reason, b: ObjectCaptureSession.Tracking.Reason) -> Bool {
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
        case notAvailable
        case limited(reason: ObjectCaptureSession.Tracking.Reason)
        case normal
        
        public static func == (a: ObjectCaptureSession.Tracking, b: ObjectCaptureSession.Tracking) -> Bool {
            assertUnimplemented()
        }
    }
    
    @MainActor public var cameraTracking: ObjectCaptureSession.Tracking {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor public var cameraTrackingUpdates: ObjectCaptureSession.Updates<ObjectCaptureSession.Tracking> {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor public var isPaused: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor public var isPausedUpdates: ObjectCaptureSession.Updates<Bool> {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor public var userCompletedScanPass: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor public var userCompletedScanPassUpdates: ObjectCaptureSession.Updates<Bool> {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor public var canRequestImageCapture: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor public var canRequestImageCaptureUpdates: ObjectCaptureSession.Updates<Bool> {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor public var numberOfShotsTaken: Int {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor public var numberOfShotsTakenUpdates: ObjectCaptureSession.Updates<Int> {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor public var maximumNumberOfInputImages: Int {
        get {
            assertUnimplemented()
        }
    }
    
    public struct Configuration {
        public init() {
            assertUnimplemented()
        }
        
        public var checkpointDirectory: URL?
        
        public var isOverCaptureEnabled: Bool
    }
    
    @MainActor public var configuration: ObjectCaptureSession.Configuration {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor public func start(imagesDirectory: URL, configuration: ObjectCaptureSession.Configuration = Configuration()) {
        assertUnimplemented()
    }
    
    @MainActor public func resume() {
        assertUnimplemented()
    }
    
    @MainActor public func pause() {
        assertUnimplemented()
    }
    
    @MainActor public func startDetecting() -> Bool {
        assertUnimplemented()
    }
    
    @discardableResult
    @MainActor public func resetDetection() -> Bool {
        assertUnimplemented()
    }
    
    @MainActor public func startCapturing() {
        assertUnimplemented()
    }
    
    @MainActor public func beginNewScanPassAfterFlip() {
        assertUnimplemented()
    }
    
    @MainActor public func beginNewScanPass() {
        assertUnimplemented()
    }
    
    @MainActor public func finish() {
        assertUnimplemented()
    }
    
    @MainActor public func cancel() {
        assertUnimplemented()
    }
    
    @MainActor public func requestImageCapture() {
        assertUnimplemented()
    }
    
    @available(iOS 17.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS, unavailable)
    @available(macOS, unavailable, introduced: 15.0)
    @available(macCatalyst, unavailable)
    public typealias ID = ObjectIdentifier
    }

@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension ObjectCaptureSession.CaptureState : Sendable {
}

@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension ObjectCaptureSession.Feedback : Sendable {
}

@available(iOS 18.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension ObjectCaptureSession {
    @MainActor public var shouldPlayHaptics: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @MainActor public var isAutoCaptureEnabled: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(iOS 17.0, *)
@available(watchOS, unavailable)
@available(macOS, unavailable, introduced: 15.0)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
@available(visionOS, unavailable)
extension ObjectCaptureSession : nonisolated Observable {
}

@available(iOS 17.0, *)
@available(watchOS, unavailable)
@available(macOS, unavailable, introduced: 15.0)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
@available(visionOS, unavailable)
extension ObjectCaptureSession : Sendable {}

@available(iOS 17.0, *)
@available(watchOS, unavailable)
@available(macOS, unavailable, introduced: 15.0)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
@available(visionOS, unavailable)
extension ObjectCaptureSession.Feedback : Hashable {}

@available(iOS 17.0, *)
@available(watchOS, unavailable)
@available(macOS, unavailable, introduced: 15.0)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
@available(visionOS, unavailable)
extension ObjectCaptureSession.Tracking.Reason : Equatable {}

@available(iOS 17.0, *)
@available(watchOS, unavailable)
@available(macOS, unavailable, introduced: 15.0)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
@available(visionOS, unavailable)
extension ObjectCaptureSession.Tracking.Reason : Hashable {}
