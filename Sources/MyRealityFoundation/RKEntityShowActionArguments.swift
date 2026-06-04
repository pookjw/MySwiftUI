public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __RKEntityShowActionArguments : Codable, Equatable, __RKSpecificationHasTarget {
    public var target: UUID
    
    public var duration: Float?
    
    public var distance: Float?
    
    public var ease: __RKEntityMoveEase?
    
    public var easeType: __RKEntityMoveEaseType?
    
    public var fadeIn: Bool?
    
    public var finalOpacity: Float?
    
    public var respectPhysics: Bool?
    
    public var physicsLinearCoefficient: Float?
    
    public var physicsAngularCoefficient: Float?
    
    public var animationStyle: __RKEntityActionAnimationStyle?
    
    public var buildInAnimationType: __RKEntityShowActionBuildInAnimationType?
    
    public init(target: UUID, duration: Float = 1.0, distance: Float = 10.0, ease: __RKEntityMoveEase = .none, easeType: __RKEntityMoveEaseType = .easeIn, fadeIn: Bool = false, finalOpacity: Float = 1.0, respectPhysics: Bool = false, physicsLinearCoefficient: Float = 0.0, physicsAngularCoefficient: Float = 0.0, animationStyle: __RKEntityActionAnimationStyle = .basic, buildInAnimationType: __RKEntityShowActionBuildInAnimationType = .none) {
        assertUnimplemented()
    }
    
    public static func == (a: __RKEntityShowActionArguments, b: __RKEntityShowActionArguments) -> Bool {
        assertUnimplemented()
    }
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}
