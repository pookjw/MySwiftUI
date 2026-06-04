public import AVFoundation

@available(macOS 11.0, iOS 14.0, macCatalyst 14.0, tvOS 26.0, *)
public struct VideoMaterial : Material {
    public var __resource: __MaterialResource
    
    public var __parameterBlock: __RKMaterialParameterBlock
    
    public var __videoResource: __VideoResource
    
    @preconcurrency @MainActor public init(avPlayer: AVPlayer) {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public var avPlayer: AVPlayer? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var controller: VideoPlaybackController {
        get {
            assertUnimplemented()
        }
    }
    
    @preconcurrency @MainActor public static func __makeVideoMaterial(videoResource: __VideoResource) -> VideoMaterial {
        assertUnimplemented()
    }
    
    @available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    public typealias TriangleFillMode = MaterialParameterTypes.TriangleFillMode
    
    @available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    public var triangleFillMode: VideoMaterial.TriangleFillMode {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension VideoMaterial {
    public var writesDepth: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var readsDepth: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension VideoMaterial {
    public typealias FaceCulling = MaterialParameterTypes.FaceCulling
    
    public var faceCulling: VideoMaterial.FaceCulling {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension VideoMaterial {
    public var videoRenderer: AVSampleBufferVideoRenderer? {
        get {
            assertUnimplemented()
        }
    }
    
    public init(videoRenderer: AVSampleBufferVideoRenderer) {
        assertUnimplemented()
    }
}
