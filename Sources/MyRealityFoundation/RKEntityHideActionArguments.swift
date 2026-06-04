public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __RKEntityHideActionArguments : Codable, Equatable, __RKSpecificationHasTarget {
    public var target: UUID
    
    public var duration: Float?
    
    public var distance: Float?
    
    public var ease: __RKEntityMoveEase?
    
    public var easeType: __RKEntityMoveEaseType?
    
    public var fadeOut: Bool?
    
    public var finalOpacity: Float?
    
    public var respectPhysics: Bool?
    
    public var physicsLinearCoefficient: Float?
    
    public var physicsAngularCoefficient: Float?
    
    public var animationStyle: __RKEntityActionAnimationStyle?
    
    public var buildOutAnimationType: __RKEntityHideActionBuildOutAnimationType?
    
    public init(target: UUID, duration: Float = 1.0, distance: Float = 10.0, ease: __RKEntityMoveEase = .none, easeType: __RKEntityMoveEaseType = .easeIn, fadeOut: Bool = false, finalOpacity: Float = 1.0, respectPhysics: Bool = false, physicsLinearCoefficient: Float = 0.0, physicsAngularCoefficient: Float = 0.0, animationStyle: __RKEntityActionAnimationStyle = .basic, buildOutAnimationType: __RKEntityHideActionBuildOutAnimationType = .none) {
        assertUnimplemented()
    }
    
    public static func == (a: __RKEntityHideActionArguments, b: __RKEntityHideActionArguments) -> Bool {
        assertUnimplemented()
    }
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}
