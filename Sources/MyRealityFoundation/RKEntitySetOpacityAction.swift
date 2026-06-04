public import Foundation

@available(macOS 11.0, iOS 14.0, macCatalyst 14.0, tvOS 26.0, *)
public class __RKEntitySetOpacityAction : __RKEntityVisibilityAction {
    @preconcurrency @MainActor public init(targetEntity: Entity?, duration: Float = 1.0, opacity: Float = 1.0) {
        assertUnimplemented()
    }
    
    override public func perform(with context: __RKEntityActionContext) -> Bool {
        assertUnimplemented()
    }
    
    override public func reversed() -> __RKEntityAction? {
        assertUnimplemented()
    }
    
    @objc override public func copy(with zone: NSZone? = nil) -> Any {
        assertUnimplemented()
    }
    }
