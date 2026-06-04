public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public class __RKEntityActionGroup : __RKEntityAction {
    public enum Ordering {
        case concurrent
        case sequenced
        
        public static func == (a: __RKEntityActionGroup.Ordering, b: __RKEntityActionGroup.Ordering) -> Bool {
            assertUnimplemented()
        }
        
        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        public var hashValue: Int {
            get {
                assertUnimplemented()
            }
        }
    }
    
    public static let infiniteLoopCount: Int = {
        assertUnimplemented()
    }()
    
    public static let noLoopCount: Int = {
        assertUnimplemented()
    }()
    
    public var actions: [__RKEntityAction] {
        get {
            assertUnimplemented()
        }
    }
    
    public var ordering: __RKEntityActionGroup.Ordering {
        get {
            assertUnimplemented()
        }
    }
    
    public var loopCount: Int {
        get {
            assertUnimplemented()
        }
    }
    
    public init(actions: [__RKEntityAction], ordering: __RKEntityActionGroup.Ordering, loopCount: Int? = __RKEntityActionGroup.noLoopCount) {
        assertUnimplemented()
    }
    
    override public func preloadAssets() {
        assertUnimplemented()
    }
    
    override public func perform(with context: __RKEntityActionContext) -> Bool {
        assertUnimplemented()
    }
    
    public func allActions() -> [__RKEntityAction] {
        assertUnimplemented()
    }
    
    override public func isExclusiveWith(action: __RKEntityAction) -> Bool {
        assertUnimplemented()
    }
    
    override public func reversed() -> __RKEntityAction? {
        assertUnimplemented()
    }
    
    override public func stop() -> Bool {
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

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __RKEntityActionGroup.Ordering : Equatable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __RKEntityActionGroup.Ordering : Hashable {}
