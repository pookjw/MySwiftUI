public import Spatial
public import simd

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension Transform : BindableData {
}

@available(visionOS 1.0, macOS 15.0, macCatalyst 18.0, iOS 18.0, tvOS 26.0, *)
extension Transform {
    public init(_ transform: AffineTransform3D) {
        assertUnimplemented()
    }
}

@available(macOS 26.0, iOS 26.0, tvOS 26.0, macCatalyst 26.0, visionOS 26.0, *)
extension Transform : _ImplicitlyAnimatableBuiltinComponent {
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension Transform : AnimatableData {
}

@available(visionOS 26.0, iOS 26.0, tvOS 26.0, macCatalyst 26.0, macOS 26.0, *)
@available(watchOS, unavailable)
extension Transform : ProjectiveTransformable3DFloat {
    public func applying(_ transform: ProjectiveTransform3DFloat) -> Transform {
        assertUnimplemented()
    }
}

@available(visionOS 26.0, iOS 26.0, tvOS 26.0, macCatalyst 26.0, macOS 26.0, *)
@available(watchOS, unavailable)
extension Transform {
    public init(projectiveTransform: ProjectiveTransform3D) {
        assertUnimplemented()
    }
    
    public init(projectiveTransform: ProjectiveTransform3DFloat) {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@frozen public struct Transform : Component, Hashable {
    public static let identity: Transform = {
        assertUnimplemented()
    }()
    
    public var scale: SIMD3<Float> = .one
    
    public var rotation: simd_quatf = .identity
    
    public var translation: SIMD3<Float> = .zero
    
    public var __coreSRT: __SRTRef {
        get {
            assertUnimplemented()
        }
    }
    
    @inlinable public var matrix: float4x4 {
        get {
                        let reMatrix = REMatrix4x4F(translation: translation, rotation: rotation, scale: scale)
                        return reMatrix
                }
        set {
                        let reMatrix = newValue as REMatrix4x4F
                        let srt = reMatrix.decompose()
                        scale = srt.scale
                        rotation = srt.rotation
                        translation = srt.translation
                }
    }
    
    public init() {
        assertUnimplemented()
    }
    
    @inlinable public init(scale: SIMD3<Float> = SIMD3<Float>(x: 1, y: 1, z: 1), rotation: simd_quatf = simd_quaternion(0, 0, 0, 1), translation: SIMD3<Float> = SIMD3<Float>(x: 0, y: 0, z: 0)) {
                self.scale = scale
                self.rotation = rotation
                self.translation = translation
        }
    
    @inlinable public init(pitch x: Float = 0, yaw y: Float = 0, roll z: Float = 0) {
                let angles = SIMD3<Float>(x, y, z)
                self.init(scale: .one,
                          rotation: simd_quatf(eulerAngles: angles, order: .yxz),
                          translation: .zero)
        }
    
    public init(matrix: float4x4) {
        assertUnimplemented()
    }
    
    @inlinable public func hash(into hasher: inout Hasher) {
                hasher.combine(scale)
                hasher.combine(rotation.vector)
                hasher.combine(translation)
        }
    
    public static func == (a: Transform, b: Transform) -> Bool {
        assertUnimplemented()
    }
    
    public var hashValue: Int {
        get {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Transform {
    public static func __fromCore(_ coreSRT: __SRTRef) -> Transform {
        assertUnimplemented()
    }
    
    public static func __fromCore(_ coreComponent: __ComponentRef) -> Transform {
        assertUnimplemented()
    }
    
    public func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
    
    public static var __coreComponentType: __ComponentTypeRef {
        get {
            assertUnimplemented()
        }
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension Transform : Codable {
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Transform : Sendable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Transform : BitwiseCopyable {}
