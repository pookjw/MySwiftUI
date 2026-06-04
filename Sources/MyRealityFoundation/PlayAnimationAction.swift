public import Foundation

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct PlayAnimationAction : EntityAction, Codable {
    public var animationName: String
    
    public var transitionDuration: TimeInterval
    
    public var blendLayer: Int
    
    public var separateAnimatedValue: Bool
    
    public var handoffType: AnimationHandoffType
    
    public var targetEntity: ActionEntityResolution
    
    public var useParentedControllers: Bool
    
    public var animatedValueType: (any AnimatableData.Type)? {
        get {
            assertUnimplemented()
        }
    }
    
    public init(animationName: String, targetEntity: ActionEntityResolution = .sourceEntity, transitionDuration: TimeInterval = 0.0, blendLayer: Int = 0, separateAnimatedValue: Bool = true, useParentedControllers: Bool = false, handoffType: AnimationHandoffType = .compose) {
        assertUnimplemented()
    }
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias EventParameterType = Never
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}
