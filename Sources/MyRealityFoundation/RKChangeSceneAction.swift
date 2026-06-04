public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public class __RKChangeSceneAction : __RKEntityAction {
    @safe public static nonisolated(unsafe) let noTargetSceneIdentifier: UUID = {
        assertUnimplemented()
    }()
    
    public var rootEntity: Entity?
    
    public init(rootEntity: Entity?, targetSceneIdentifier: UUID) {
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
