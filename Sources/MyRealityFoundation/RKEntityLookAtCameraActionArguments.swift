public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __RKEntityLookAtCameraActionArguments : Codable, Equatable, __RKSpecificationHasTarget {
    public var target: UUID
    
    public var duration: Float?
    
    public var animationDuration: Float?
    
    public var direction: SIMD3<Float>?
    
    public var rotation: Float?
    
    public var upVector: SIMD3<Float>?
    
    public var loops: Bool?
    
    public init(target: UUID, duration: Float = 1.0, animationDuration: Float = 0.0, direction: SIMD3<Float> = SIMD3<Float>(0, 1, 0), rotation: Float = 0.0, upVector: SIMD3<Float> = SIMD3<Float>(0, 1, 0), loops: Bool = false) {
        assertUnimplemented()
    }
    
    public static func == (a: __RKEntityLookAtCameraActionArguments, b: __RKEntityLookAtCameraActionArguments) -> Bool {
        assertUnimplemented()
    }
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}
