public import Foundation
public import simd

@available(iOS 17.0, macOS 12.0, macCatalyst 15.0, *)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension PhotogrammetrySession.Output : Sendable {
}

@available(iOS 17.0, macOS 12.0, macCatalyst 15.0, *)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension PhotogrammetrySession.Result : Sendable {
}

@available(macOS 14.0, iOS 17.0, macCatalyst 17.0, *)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension PhotogrammetrySession.Output.ProcessingStage : Sendable {
}

@available(macOS 14.0, iOS 17.0, macCatalyst 17.0, *)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension PhotogrammetrySession.Output.ProgressInfo : Sendable {
}

@available(iOS 17.0, macOS 12.0, macCatalyst 15.0, *)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension PhotogrammetrySession.Request : Sendable {
}

@available(iOS 17.0, macOS 12.0, macCatalyst 15.0, *)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension PhotogrammetrySession.Request.Geometry : Sendable {
}

@available(iOS 17.0, macOS 12.0, macCatalyst 15.0, *)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension PhotogrammetrySession.Request.Detail : Sendable {
}

@available(macOS 14.0, iOS 17.0, macCatalyst 17.0, *)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension PhotogrammetrySession.Limits : Sendable {
}

@available(iOS 17.0, macOS 12.0, macCatalyst 15.0, *)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension PhotogrammetrySession.Configuration : Sendable {
}

@available(iOS 17.0, macOS 12.0, macCatalyst 15.0, *)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension PhotogrammetrySession.Configuration.SampleOrdering : Sendable {
}

@available(iOS 17.0, macOS 12.0, macCatalyst 15.0, *)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension PhotogrammetrySession.Configuration.FeatureSensitivity : Sendable {
}

@available(macOS 14.0, iOS 17.0, macCatalyst 17.0, *)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension PhotogrammetrySession.Error : Sendable {
}

@available(iOS 17.0, macOS 13.0, macCatalyst 16.0, *)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension PhotogrammetrySession.PointCloud : Sendable {
}

@available(iOS 17.0, macOS 13.0, macCatalyst 16.0, *)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension PhotogrammetrySession.PointCloud.Point : Sendable {
}

@available(macOS 14.0, iOS 17.0, macCatalyst 17.0, *)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension PhotogrammetrySession.Pose : Sendable {
}

@available(macOS 14.0, iOS 17.0, macCatalyst 17.0, *)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension PhotogrammetrySession.Poses : Sendable {
}

@_hasMissingDesignatedInitializers @available(iOS 17.0, macOS 12.0, macCatalyst 15.0, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public class PhotogrammetrySession {
    convenience public init(input: URL, configuration: PhotogrammetrySession.Configuration = Configuration()) throws {
        assertUnimplemented()
    }
    
    convenience public init<S>(input: S, configuration: PhotogrammetrySession.Configuration = Configuration()) throws where S : Sequence, S.Element == PhotogrammetrySample {
        assertUnimplemented()
    }
    
    @available(macOS 14.0, iOS 17.0, macCatalyst 17.0, *)
    public struct Limits {
        public var maximumInputImageDimension: Int {
            get {
                assertUnimplemented()
            }
        }
        
        public var maximumNumberOfInputImages: Int {
            get {
                assertUnimplemented()
            }
        }
    }
    
    @available(macOS 14.0, iOS 17.0, macCatalyst 17.0, *)
    @safe public static nonisolated(unsafe) let limits: PhotogrammetrySession.Limits = {
        assertUnimplemented()
    }()
    
    @available(macOS 14.0, iOS 17.0, macCatalyst 17.0, *)
    public enum Error : Swift.Error, LocalizedError {
        case invalidImages(URL)
        case invalidOutput(URL)
        case insufficientStorage(requiredBytes: Int64)
        
        public var localizedDescription: String {
            get {
                assertUnimplemented()
            }
        }
    }
    
    public struct Configuration : Equatable {
        public enum SampleOrdering {
            case unordered
            case sequential
            
            public static func == (a: PhotogrammetrySession.Configuration.SampleOrdering, b: PhotogrammetrySession.Configuration.SampleOrdering) -> Bool {
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
        
        public enum FeatureSensitivity {
            case normal
            case high
            
            public static func == (a: PhotogrammetrySession.Configuration.FeatureSensitivity, b: PhotogrammetrySession.Configuration.FeatureSensitivity) -> Bool {
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
        
        public var isObjectMaskingEnabled: Bool
        
        public var sampleOrdering: PhotogrammetrySession.Configuration.SampleOrdering
        
        public var featureSensitivity: PhotogrammetrySession.Configuration.FeatureSensitivity
        
        @available(macOS 14.0, iOS 17.0, macCatalyst 17.0, *)
        public var checkpointDirectory: URL?
        
        @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
        @available(visionOS, unavailable)
        public var ignoreBoundingBox: Bool
        
        public init() {
            assertUnimplemented()
        }
        
        @available(macOS 14.0, iOS 17.0, macCatalyst 17.0, *)
        public init(checkpointDirectory: URL) {
            assertUnimplemented()
        }
        
        public static func == (a: PhotogrammetrySession.Configuration, b: PhotogrammetrySession.Configuration) -> Bool {
            assertUnimplemented()
        }
    }
    
    public enum Request : Hashable {
        case modelFile(url: URL, detail: PhotogrammetrySession.Request.Detail = .reduced, geometry: PhotogrammetrySession.Request.Geometry? = nil)
        case modelEntity(detail: PhotogrammetrySession.Request.Detail = .reduced, geometry: PhotogrammetrySession.Request.Geometry? = nil)
        case bounds
        @available(iOS 17.0, macOS 13.0, macCatalyst 16.0, *)
        case pointCloud
        @available(macOS 14.0, iOS 17.0, macCatalyst 17.0, *)
        case poses
        
        public enum Detail : Int, Hashable {
            case reduced
            
            public init?(rawValue: Int) {
                assertUnimplemented()
            }
            
            @available(iOS 17.0, macOS 12.0, macCatalyst 15.0, *)
            @available(tvOS, unavailable)
            @available(watchOS, unavailable)
            @available(visionOS, unavailable)
            public typealias RawValue = Int
            
            public var rawValue: Int {
                get {
                    assertUnimplemented()
                }
            }
        }
        
        public struct Geometry : Hashable {
            @available(iOS 17.0, macOS 13.0, macCatalyst 16.0, *)
            public var orientedBounds: OrientedBoundingBox {
                get {
                    assertUnimplemented()
                }
                set {
                    assertUnimplemented()
                }
            }
            
            public var bounds: BoundingBox {
                get {
                    assertUnimplemented()
                }
                set {
                    assertUnimplemented()
                }
            }
            
            public var transform: Transform
            
            @available(iOS 17.0, macOS 13.0, macCatalyst 16.0, *)
            public init(orientedBounds: OrientedBoundingBox, transform: Transform = Transform.identity) {
                assertUnimplemented()
            }
            
            public init(bounds: BoundingBox = BoundingBox.empty, transform: Transform = Transform.identity) {
                assertUnimplemented()
            }
            
            public static func == (a: PhotogrammetrySession.Request.Geometry, b: PhotogrammetrySession.Request.Geometry) -> Bool {
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
        
        public init(modelFile: URL) {
            assertUnimplemented()
        }
        
        public static func == (a: PhotogrammetrySession.Request, b: PhotogrammetrySession.Request) -> Bool {
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
    
    public enum Result {
        case modelFile(URL)
        case modelEntity(ModelEntity)
        case bounds(BoundingBox)
        @available(iOS 17.0, macOS 13.0, macCatalyst 16.0, *)
        case pointCloud(PhotogrammetrySession.PointCloud)
        @available(macOS 14.0, iOS 17.0, macCatalyst 17.0, *)
        case poses(PhotogrammetrySession.Poses)
    }
    
    @available(macOS 14.0, iOS 17.0, macCatalyst 17.0, *)
    public struct Pose {
        public let translation: SIMD3<Float> = {
            assertUnimplemented()
        }()
        
        public let rotation: simd_quatf = {
            assertUnimplemented()
        }()
        
        public var transform: Transform {
            get {
                assertUnimplemented()
            }
        }
    }
    
    @available(macOS 14.0, iOS 17.0, macCatalyst 17.0, *)
    public struct Poses {
        public let posesBySample: [Int : PhotogrammetrySession.Pose] = {
            assertUnimplemented()
        }()
        
        public var urlsBySample: [Int : URL] {
            get {
                assertUnimplemented()
            }
        }
    }
    
    @available(iOS 17.0, macOS 13.0, macCatalyst 16.0, *)
    public struct PointCloud {
        public struct Point {
            public let position: SIMD3<Float> = {
                assertUnimplemented()
            }()
            
            public let color: SIMD4<UInt8> = {
                assertUnimplemented()
            }()
        }
        
        public let points: [PhotogrammetrySession.PointCloud.Point] = {
            assertUnimplemented()
        }()
    }
    
    public enum Output {
        case inputComplete
        case requestError(PhotogrammetrySession.Request, any Swift.Error)
        case requestComplete(PhotogrammetrySession.Request, PhotogrammetrySession.Result)
        case requestProgress(PhotogrammetrySession.Request, fractionComplete: Double)
        case processingComplete
        case processingCancelled
        case invalidSample(id: Int, reason: String)
        case skippedSample(id: Int)
        case automaticDownsampling
        @available(macOS 14.0, iOS 17.0, macCatalyst 17.0, *)
        case requestProgressInfo(PhotogrammetrySession.Request, PhotogrammetrySession.Output.ProgressInfo)
        
        @available(macOS 14.0, iOS 17.0, macCatalyst 17.0, *)
        public struct ProgressInfo {
            public let estimatedRemainingTime: TimeInterval? = {
                assertUnimplemented()
            }()
            
            public let processingStage: PhotogrammetrySession.Output.ProcessingStage? = {
                assertUnimplemented()
            }()
        }
        
        @available(macOS 14.0, iOS 17.0, macCatalyst 17.0, *)
        public enum ProcessingStage {
            case preProcessing
            case imageAlignment
            case pointCloudGeneration
            case meshGeneration
            case textureMapping
            case optimization
            
            public static func == (a: PhotogrammetrySession.Output.ProcessingStage, b: PhotogrammetrySession.Output.ProcessingStage) -> Bool {
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
        @available(macOS 14.0, iOS 17.0, macCatalyst 17.0, *)
        case stitchingIncomplete
        
        public var localizedDescription: String {
            get {
                assertUnimplemented()
            }
        }
    }
    
    public struct Outputs : AsyncSequence {
        public typealias Element = PhotogrammetrySession.Output
        
        public struct Iterator : AsyncIteratorProtocol {
            public mutating func next() async throws -> PhotogrammetrySession.Outputs.Element? {
                assertUnimplemented()
            }
            
            @available(iOS 17.0, macOS 12.0, macCatalyst 15.0, *)
            @available(tvOS, unavailable)
            @available(watchOS, unavailable)
            @available(visionOS, unavailable)
            public typealias Element = PhotogrammetrySession.Outputs.Element
            
            @available(iOS 18.0, macOS 15.0, macCatalyst 15.0, *)
            @available(tvOS, unavailable, introduced: 18.0)
            @available(watchOS, unavailable, introduced: 11.0)
            @available(visionOS, unavailable, introduced: 2.0)
            @_implements(AsyncIteratorProtocol, Failure) public typealias __AsyncIteratorProtocol_Failure = any Swift.Error
        }
        
        public func makeAsyncIterator() -> PhotogrammetrySession.Outputs.Iterator {
            assertUnimplemented()
        }
        
        @available(iOS 17.0, macOS 12.0, macCatalyst 15.0, *)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        @available(visionOS, unavailable)
        public typealias AsyncIterator = PhotogrammetrySession.Outputs.Iterator
        
        @available(iOS 18.0, macOS 15.0, macCatalyst 15.0, *)
        @available(tvOS, unavailable, introduced: 18.0)
        @available(watchOS, unavailable, introduced: 11.0)
        @available(visionOS, unavailable, introduced: 2.0)
        @_implements(AsyncSequence, Failure) public typealias __AsyncSequence_Failure = any Swift.Error
    }
    
    public func process(requests: [PhotogrammetrySession.Request]) throws {
        assertUnimplemented()
    }
    
    public func cancel() {
        assertUnimplemented()
    }
    
    public var activeRequests: [PhotogrammetrySession.Request] {
        get {
            assertUnimplemented()
        }
    }
    
    public var isProcessing: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    public var configuration: PhotogrammetrySession.Configuration {
        get {
            assertUnimplemented()
        }
    }
    
    public var outputs: PhotogrammetrySession.Outputs {
        get {
            assertUnimplemented()
        }
    }
    
    @available(iOS 17.0, macOS 13.0, macCatalyst 16.0, *)
    public static var isSupported: Bool {
        get {
            assertUnimplemented()
        }
    }
    }

@available(macOS 14.0, iOS 17.0, macCatalyst 17.0, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension PhotogrammetrySession : Identifiable {
    public var id: UUID {
        get {
            assertUnimplemented()
        }
    }
    
    @available(iOS 17.0, macOS 14.0, macCatalyst 17.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS, unavailable)
    public typealias ID = UUID
}

@available(macOS 26.0, iOS 26.0, macCatalyst 26.0, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension PhotogrammetrySession.Pose {
    public var intrinsics: simd_float3x3? {
        get {
            assertUnimplemented()
        }
    }
    
    public var lensDistortionData: LensDistortionData? {
        get {
            assertUnimplemented()
        }
    }
}

@available(macOS 14.0, iOS 17.0, macCatalyst 17.0, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension PhotogrammetrySession.Output.ProcessingStage : Equatable {}

@available(macOS 14.0, iOS 17.0, macCatalyst 17.0, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension PhotogrammetrySession.Output.ProcessingStage : Hashable {}

@available(iOS 17.0, macOS 12.0, macCatalyst 15.0, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension PhotogrammetrySession.Request.Detail : RawRepresentable {}

@available(iOS 17.0, macOS 12.0, macCatalyst 15.0, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension PhotogrammetrySession.Configuration.SampleOrdering : Equatable {}

@available(iOS 17.0, macOS 12.0, macCatalyst 15.0, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension PhotogrammetrySession.Configuration.SampleOrdering : Hashable {}

@available(iOS 17.0, macOS 12.0, macCatalyst 15.0, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension PhotogrammetrySession.Configuration.FeatureSensitivity : Equatable {}

@available(iOS 17.0, macOS 12.0, macCatalyst 15.0, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension PhotogrammetrySession.Configuration.FeatureSensitivity : Hashable {}
