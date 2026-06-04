public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public class __RKEntityAudioAction : __RKEntityAction {
    public var type: __RKEntityAudioActionType
    
    public var path: String
    
    public var volume: Double
    
    public var loops: Bool
    
    public var spatialMode: __RKAudioSpatialModeSelection
    
    public var __audioAssetRef: OpaquePointer? {
        get {
            assertUnimplemented()
        }
    }
    
    @preconcurrency @MainActor public init(targetEntity: Entity?, type: __RKEntityAudioActionType, path: String, volume: Double, loops: Bool, spatialMode: __RKAudioSpatialModeSelection = .pointSource, multiplePerformBehavior: __RKEntityActionMultiplePerformBehavior = .ignore) {
        assertUnimplemented()
    }
    
    override public func perform(with context: __RKEntityActionContext) -> Bool {
        assertUnimplemented()
    }
    
    override public func reversed() -> __RKEntityAction? {
        assertUnimplemented()
    }
    
    override public func stop() -> Bool {
        assertUnimplemented()
    }
    
    override public func preloadAssets() {
        assertUnimplemented()
    }
    
    @objc override public func copy(with zone: NSZone? = nil) -> Any {
        assertUnimplemented()
    }
    
    override public func clone(matching entity: Entity, newEntity: Entity) -> (action: __RKEntityAction?, anythingChanged: Bool) {
        assertUnimplemented()
    }
}
