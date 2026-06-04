public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public class __RKEntityCustomAction : __RKEntityAction {
    public struct RKEntityCustomActionNotification {
        @safe public static nonisolated(unsafe) let name: NSNotification.Name = {
            assertUnimplemented()
        }()
        
        public static let sceneKey: String = {
            assertUnimplemented()
        }()
        
        public static let identifierKey: String = {
            assertUnimplemented()
        }()
        
        public static let entityKey: String = {
            assertUnimplemented()
        }()
        
        public static let customArgumentsKey: String = {
            assertUnimplemented()
        }()
    }
    
    public var handler: ((Entity?) -> Void)?
    
    @safe final public nonisolated(unsafe) let identifier: String = {
        assertUnimplemented()
    }()
    
    @safe final public nonisolated(unsafe) let customArguments: [String : String] = {
        assertUnimplemented()
    }()
    
    public var customArgumentsBlock: ((Entity?, [String : String]?) -> Void)?
    
    public init(targetEntity: Entity?, actionIdentifier: String, handler: ((Entity?) -> Void)? = nil, customArguments: [String : String]? = [:], customArgumentsBlock: ((Entity?, [String : String]?) -> Void)? = nil) {
        assertUnimplemented()
    }
    
    override public func perform(with context: __RKEntityActionContext) -> Bool {
        assertUnimplemented()
    }
    
    @objc override public func copy(with zone: NSZone? = nil) -> Any {
        assertUnimplemented()
    }
    
    override public func clone(matching entity: Entity, newEntity: Entity) -> (action: __RKEntityAction?, anythingChanged: Bool) {
        assertUnimplemented()
    }
    }
