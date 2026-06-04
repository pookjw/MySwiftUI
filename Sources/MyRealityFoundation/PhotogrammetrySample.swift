public import AVFoundation
public import CoreMotion
public import CoreVideo
public import Foundation
public import ImageIO
public import simd

@available(iOS 17.0, macOS 12.0, macCatalyst 15.0, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public struct PhotogrammetrySample : Identifiable {
    public let id: Int
    
    public let image: CVPixelBuffer
    
    public var metadata: [String : Any] {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var depthDataMap: CVPixelBuffer? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var gravity: CMAcceleration? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var objectMask: CVPixelBuffer? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public init(id: Int, image: CVPixelBuffer) {
        assertUnimplemented()
    }
    
    @available(iOS 17.0, macOS 12.0, macCatalyst 15.0, *)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(visionOS, unavailable)
    public typealias ID = Int
}

@available(macOS 12.0, macCatalyst 15.0, iOS 18.0, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension PhotogrammetrySample : CustomStringConvertible {
    public var description: String {
        get {
            assertUnimplemented()
        }
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension PhotogrammetrySample {
    @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    @available(visionOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    public init(contentsOf url: URL) throws {
        assertUnimplemented()
    }
    
    @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    @available(visionOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    public init(contentsOf url: URL) async throws {
        assertUnimplemented()
    }
    
    @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    @available(visionOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    public var captureTime: Date? {
        get {
            assertUnimplemented()
        }
    }
    
    @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    @available(visionOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    public var boundingBox: simd_float4x4? {
        get {
            assertUnimplemented()
        }
    }
    
    @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    @available(visionOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    public var depthConfidenceMap: CVPixelBuffer? {
        get {
            assertUnimplemented()
        }
    }
    
    @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    @available(visionOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    public struct Camera {
        public var id: UInt32
        
        public var intrinsics: simd_float3x3
        
        public var transform: simd_float4x4
        
        public var calibrationData: AVCameraCalibrationData?
    }
    
    @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    @available(visionOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    public var camera: PhotogrammetrySample.Camera? {
        get {
            assertUnimplemented()
        }
    }
    
    @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    @available(visionOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    public var sessionID: UUID? {
        get {
            assertUnimplemented()
        }
    }
    
    @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    @available(visionOS, unavailable)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    public var scanPassID: Int? {
        get {
            assertUnimplemented()
        }
    }
}

@available(macOS 26.0, iOS 26.0, macCatalyst 26.0, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension PhotogrammetrySample {
    public var orientation: CGImagePropertyOrientation {
        get {
            assertUnimplemented()
        }
    }
}
