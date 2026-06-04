public import Spatial

@available(visionOS 1.0, macOS 15.0, macCatalyst 18.0, iOS 18.0, tvOS 26.0, *)
extension BoundingBox {
    public init(_ rect3D: Rect3D) {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@frozen public struct BoundingBox : Hashable, Sendable {
    public static let empty: BoundingBox = {
        assertUnimplemented()
    }()
    
    public var min: SIMD3<Float> = .positiveInfinity
    
    public var max: SIMD3<Float> = .negativeInfinity
    
    public init() {
        assertUnimplemented()
    }
    
    public init(min: SIMD3<Float>, max: SIMD3<Float>) {
        assertUnimplemented()
    }
    
    @inlinable public static func == (lhs: BoundingBox, rhs: BoundingBox) -> Bool {
                return lhs.min == rhs.min && lhs.max == rhs.max
        }
    
    @inlinable public func hash(into hasher: inout Hasher) {
                hasher.combine(min)
                hasher.combine(max)
        }
    
    public var hashValue: Int {
        get {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension BoundingBox {
    public var center: SIMD3<Float> {
        get {
            assertUnimplemented()
        }
    }
    
    public var extents: SIMD3<Float> {
        get {
            assertUnimplemented()
        }
    }
    
    public var boundingRadius: Float {
        get {
            assertUnimplemented()
        }
    }
    
    public var isEmpty: Bool {
        get {
            assertUnimplemented()
        }
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

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension BoundingBox : BitwiseCopyable {}
