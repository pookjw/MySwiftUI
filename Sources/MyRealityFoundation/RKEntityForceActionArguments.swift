public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __RKEntityForceActionArguments : Codable, Equatable, __RKSpecificationHasTarget {
    public var target: UUID
    
    public var force: SIMD3<Float>?
    
    public var velocity: SIMD3<Float>?
    
    public init(target: UUID, force: SIMD3<Float>? = nil, velocity: SIMD3<Float>? = nil) {
        assertUnimplemented()
    }
    
    public static func == (a: __RKEntityForceActionArguments, b: __RKEntityForceActionArguments) -> Bool {
        assertUnimplemented()
    }
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}
