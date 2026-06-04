public import MySwiftUICore
public import Spatial

@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public protocol RealityCoordinateSpaceConverting {
    func transform(from: some RealityCoordinateSpace, to: some CoordinateSpaceProtocol) -> AffineTransform3D
    func transform(from: some CoordinateSpaceProtocol, to: some RealityCoordinateSpace) -> AffineTransform3D
}

@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension RealityCoordinateSpaceConverting {
    public func convert(_ point: Point3D, from space: some CoordinateSpaceProtocol, to realitySpace: some RealityCoordinateSpace) -> SIMD3<Float> {
        assertUnimplemented()
    }
    
    public func convert(point: SIMD3<Float>, from realitySpace: some RealityCoordinateSpace, to space: some CoordinateSpaceProtocol) -> Point3D {
        assertUnimplemented()
    }
    
    public func convert(_ vector: Vector3D, from space: some CoordinateSpaceProtocol, to realitySpace: some RealityCoordinateSpace) -> SIMD3<Float> {
        assertUnimplemented()
    }
    
    public func convert(vector: SIMD3<Float>, from realitySpace: some RealityCoordinateSpace, to space: some CoordinateSpaceProtocol) -> Vector3D {
        assertUnimplemented()
    }
    
    public func convert(_ size: Size3D, from space: some CoordinateSpaceProtocol, to realitySpace: some RealityCoordinateSpace) -> SIMD3<Float> {
        assertUnimplemented()
    }
    
    public func convert(size: SIMD3<Float>, from realitySpace: some RealityCoordinateSpace, to space: some CoordinateSpaceProtocol) -> Size3D {
        assertUnimplemented()
    }
    
    public func convert(_ rect: Rect3D, from space: some CoordinateSpaceProtocol, to realitySpace: some RealityCoordinateSpace) -> BoundingBox {
        assertUnimplemented()
    }
    
    public func convert(boundingBox: BoundingBox, from realitySpace: some RealityCoordinateSpace, to space: some CoordinateSpaceProtocol) -> Rect3D {
        assertUnimplemented()
    }
    
    public func convert(_ transform: AffineTransform3D, from space: some CoordinateSpaceProtocol, to realitySpace: some RealityCoordinateSpace) -> Transform {
        assertUnimplemented()
    }
    
    public func convert(transform: Transform, from realitySpace: some RealityCoordinateSpace, to space: some CoordinateSpaceProtocol) -> AffineTransform3D {
        assertUnimplemented()
    }
    
    public func convert(_ rotation: Rotation3D, from space: some CoordinateSpaceProtocol, to realitySpace: some RealityCoordinateSpace) -> simd_quatf {
        assertUnimplemented()
    }
    
    public func convert(rotation: simd_quatf, from realitySpace: some RealityCoordinateSpace, to space: some CoordinateSpaceProtocol) -> Rotation3D {
        assertUnimplemented()
    }
}
