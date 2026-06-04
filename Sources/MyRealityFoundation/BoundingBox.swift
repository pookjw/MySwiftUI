public import simd

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@frozen public struct BoundingBox : Hashable, Sendable {
    public static let empty: BoundingBox = {
        assertUnimplemented()
    }()
    
    public var min: SIMD3<Float> {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var max: SIMD3<Float> {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public init() {
        assertUnimplemented()
    }
    
    public init(min: SIMD3<Float>, max: SIMD3<Float>) {
        assertUnimplemented()
    }
    
    @inlinable public static func == (lhs: BoundingBox, rhs: BoundingBox) -> Bool {
        assertUnimplemented()
    }
    
    @inlinable public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    public var hashValue: Int {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension BoundingBox {
    public var center: SIMD3<Float> {
        assertUnimplemented()
    }
    
    public var extents: SIMD3<Float> {
        assertUnimplemented()
    }
    
    public var boundingRadius: Float {
        assertUnimplemented()
    }
    
    public var isEmpty: Bool {
        assertUnimplemented()
    }
    
    public func union(_ point: SIMD3<Float>) -> BoundingBox {
        assertUnimplemented()
    }
    
    public mutating func formUnion(_ point: SIMD3<Float>) {
        assertUnimplemented()
    }
    
    public func union(_ other: BoundingBox) -> BoundingBox {
        assertUnimplemented()
    }
    
    public mutating func formUnion(_ other: BoundingBox) {
        assertUnimplemented()
    }
    
    public func contains(_ point: SIMD3<Float>) -> Bool {
        assertUnimplemented()
    }
    
    public func contains(_ boundingBox: BoundingBox) -> Bool {
        assertUnimplemented()
    }
    
    public func intersects(_ boundingBox: BoundingBox) -> Bool {
        assertUnimplemented()
    }
    
    public func transformed(by transform: float4x4) -> BoundingBox {
        assertUnimplemented()
    }
    
    public mutating func transform(by transform: float4x4) {
        assertUnimplemented()
    }
    
    public func distanceSquared(toPoint: SIMD3<Float>) -> Float {
        assertUnimplemented()
    }
}

@available(visionOS 26.0, macOS 26.0, iOS 26.0, macCatalyst 26.0, tvOS 26.0, *)
extension BoundingBox : Codable {
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}
