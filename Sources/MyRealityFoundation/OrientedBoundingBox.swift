public import simd

@available(iOS 17.0, macOS 13.0, macCatalyst 16.0, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public struct OrientedBoundingBox : Hashable {
    public var orientation: simd_quatf
    
    public var boundingBox: BoundingBox
    
    public init(orientation: simd_quatf = simd_quatf(ix: 0, iy: 0, iz: 0, r: 1), boundingBox: BoundingBox = BoundingBox.empty) {
        assertUnimplemented()
    }
    
    @inlinable public func hash(into hasher: inout Hasher) {
                hasher.combine(Transform(rotation: self.orientation))
                hasher.combine(self.boundingBox)
        }
    
    public static func == (a: OrientedBoundingBox, b: OrientedBoundingBox) -> Bool {
        assertUnimplemented()
    }
    
    public var hashValue: Int {
        get {
            assertUnimplemented()
        }
    }
}

@available(iOS 17.0, macOS 13.0, macCatalyst 16.0, *)
@available(visionOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension OrientedBoundingBox : Sendable {
}
