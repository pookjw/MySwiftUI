public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __RKEntityOrbitEntityActionArguments : Codable, Equatable, __RKSpecificationHasTarget {
    public var target: UUID
    
    public var pivotTarget: UUID
    
    public var duration: Float?
    
    public var rotations: Float?
    
    public var orbitalAxis: SIMD3<Float>?
    
    public var orientToPath: Bool?
    
    public var spinDirection: __RKEntitySpinDirectionType?
    
    public var respectPhysics: Bool?
    
    public var physicsLinearCoefficient: Float?
    
    public var physicsAngularCoefficient: Float?
    
    public init(target: UUID, pivotTarget: UUID, duration: Float = 1.0, rotations: Float = 1.0, orbitalAxis: SIMD3<Float> = SIMD3<Float>(0, 1, 0), orientToPath: Bool = false, spinDirection: __RKEntitySpinDirectionType = .clockwise, respectPhysics: Bool = false, physicsLinearCoefficient: Float = 0.0, physicsAngularCoefficient: Float = 0.0) {
        assertUnimplemented()
    }
    
    public static func == (a: __RKEntityOrbitEntityActionArguments, b: __RKEntityOrbitEntityActionArguments) -> Bool {
        assertUnimplemented()
    }
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}
