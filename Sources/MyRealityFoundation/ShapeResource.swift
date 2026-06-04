public import Foundation
public import simd

@_hasMissingDesignatedInitializers @available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@preconcurrency @MainActor public class ShapeResource : Resource, Hashable, Sendable {
    @available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    nonisolated public var bounds: BoundingBox {
        assertUnimplemented()
    }
    
    @objc deinit {
        assertUnimplemented()
    }
    
    nonisolated public static func == (lhs: ShapeResource, rhs: ShapeResource) -> Bool {
        assertUnimplemented()
    }
    
    nonisolated public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    nonisolated public var hashValue: Int {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension ShapeResource {
    @MainActor @preconcurrency public static func __makeShapeResource(_ shapes: [ShapeResource]) -> ShapeResource {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func offsetBy(rotation: simd_quatf) -> ShapeResource {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func offsetBy(translation: SIMD3<Float>) -> ShapeResource {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func offsetBy(rotation: simd_quatf = simd_quatf(ix: 0, iy: 0, iz: 0, r: 1), translation: SIMD3<Float> = SIMD3<Float>()) -> ShapeResource {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func generateBox(size: SIMD3<Float>) -> ShapeResource {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func generateBox(width: Float, height: Float, depth: Float) -> ShapeResource {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func generateCapsule(height: Float, radius: Float) -> ShapeResource {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func generateConvex(from points: [SIMD3<Float>]) -> ShapeResource {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func generateConvex(from mesh: MeshResource) -> ShapeResource {
        assertUnimplemented()
    }
    
    nonisolated public static func generateConvex(from mesh: MeshResource) async throws -> ShapeResource {
        assertUnimplemented()
    }
    
    nonisolated public static func generateConvex(from points: [SIMD3<Float>]) async throws -> ShapeResource {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func generateSphere(radius: Float) -> ShapeResource {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
public enum ShapeResourceError : LocalizedError {
    case staticMeshGenerationFailed
    case convexPolyhedronGenerationFailed
    
    public var errorDescription: String? {
        assertUnimplemented()
    }
    
    public static func == (a: ShapeResourceError, b: ShapeResourceError) -> Bool {
        assertUnimplemented()
    }
    
    public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    public var hashValue: Int {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension ShapeResource {
    nonisolated public static func generateStaticMesh(positions: [SIMD3<Float>], faceIndices: [UInt16]) async throws -> ShapeResource {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension ShapeResource {
    @MainActor @preconcurrency public static func generateStaticMesh(from mesh: MeshResource) async throws -> ShapeResource {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension ShapeResourceError : Equatable {
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension ShapeResourceError : Hashable {
}
