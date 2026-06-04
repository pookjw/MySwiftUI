public import Foundation

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public struct SceneUpdateContext {
    public var scene: Scene
    
    public var deltaTime: TimeInterval
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension SceneUpdateContext {
    @available(visionOS, unavailable, renamed: "entities(matching:updatingSystemWhen:)")
    @available(macOS, unavailable, renamed: "entities(matching:updatingSystemWhen:)")
    @available(iOS, unavailable, renamed: "entities(matching:updatingSystemWhen:)")
    @available(tvOS, unavailable, renamed: "entities(matching:updatingSystemWhen:)")
    @available(watchOS, unavailable, renamed: "entities(matching:updatingSystemWhen:)")
    public func entities(matching query: EntityQuery, when condition: SystemUpdateCondition) -> QueryResult<Entity> {
        assertUnimplemented()
    }
    
    public func entities(matching query: EntityQuery, updatingSystemWhen condition: SystemUpdateCondition) -> QueryResult<Entity> {
        assertUnimplemented()
    }
}
