public import Foundation
public import simd

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __RKEntityTransformActionArguments : Codable, Equatable, __RKSpecificationHasTarget {
    public var target: UUID
    
    public var location: SIMD3<Float>?
    
    public var orientation: simd_quatf? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var scale: Float?
    
    public var duration: Float?
    
    public var moveType: __RKEntityMoveSelection?
    
    public var ease: __RKEntityMoveEase?
    
    public var easeType: __RKEntityMoveEaseType?
    
    public var respectPhysics: Bool?
    
    public var physicsLinearCoefficient: Float?
    
    public var physicsAngularCoefficient: Float?
    
    public var relativeToEntity: UUID?
    
    public init(target: UUID, location: SIMD3<Float>?, orientation: simd_quatf?, scale: Float?, duration: Float = 1.0, moveType: __RKEntityMoveSelection = .local, ease: __RKEntityMoveEase = .none, easeType: __RKEntityMoveEaseType = .easeIn, respectPhysics: Bool = false, physicsLinearCoefficient: Float = 0.0, physicsAngularCoefficient: Float = 0.0) {
        assertUnimplemented()
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public init(target: UUID, location: SIMD3<Float>?, orientation: simd_quatf?, scale: Float?, duration: Float = 1.0, moveType: __RKEntityMoveSelection = .local, ease: __RKEntityMoveEase = .none, easeType: __RKEntityMoveEaseType = .easeIn, respectPhysics: Bool = false, physicsLinearCoefficient: Float = 0.0, physicsAngularCoefficient: Float = 0.0, relativeToEntity: UUID? = nil) {
        assertUnimplemented()
    }
    
    public static func == (a: __RKEntityTransformActionArguments, b: __RKEntityTransformActionArguments) -> Bool {
        assertUnimplemented()
    }
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}
