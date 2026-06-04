public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public class __RKEntityHideAction : __RKEntityVisibilityAction {
    @preconcurrency @MainActor public init(targetEntity: Entity?, duration: Float = 1.0, distance: Float = 10.0, ease: __RKEntityMoveEase = .none, easeType: __RKEntityMoveEaseType = .easeIn, fadeOut: Bool = false, finalOpacity: Float = 0.0, respectPhysics: Bool = false, physicsAngularCoefficient: Float = 0.0, physicsLinearCoefficient: Float = 0.0, animationStyle: __RKEntityActionAnimationStyle = .basic, buildOutAnimationType: __RKEntityHideActionBuildOutAnimationType = .none) {
        assertUnimplemented()
    }
    
    @discardableResult
    override public func perform(with context: __RKEntityActionContext) -> Bool {
        assertUnimplemented()
    }
    
    override public func reversed() -> __RKEntityAction? {
        assertUnimplemented()
    }
    
    override public var description: String {
        get {
            assertUnimplemented()
        }
    }
    
    override public func stop() -> Bool {
        assertUnimplemented()
    }
    
    @objc override public func copy(with zone: NSZone? = nil) -> Any {
        assertUnimplemented()
    }
    
    override public func clone(matching entity: Entity, newEntity: Entity) -> (action: __RKEntityAction?, anythingChanged: Bool) {
        assertUnimplemented()
    }
    }
