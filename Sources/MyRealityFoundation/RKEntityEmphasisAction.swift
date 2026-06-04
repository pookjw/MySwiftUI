public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public class __RKEntityEmphasisAction : __RKEntityAction {
    public init(targetEntity: Entity?, duration: Float, iterations: Float = 1.0, animationStyle: __RKEntityActionAnimationStyle = .basic, emphasisAnimationType: __RKEntityEmphasisAnimationType = .pop) {
        assertUnimplemented()
    }
    
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
    
    @objc override public func copy(with zone: NSZone? = nil) -> Any {
        assertUnimplemented()
    }
    
    override public func clone(matching entity: Entity, newEntity: Entity) -> (action: __RKEntityAction?, anythingChanged: Bool) {
        assertUnimplemented()
    }
    }
