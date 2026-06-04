public import MySwiftUICore
private import MyRealityFoundation

@available(visionOS 1.0, macOS 15.0, macCatalyst 18.0, iOS 18.0, *)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension Gesture {
    @available(visionOS 1.0, macOS 15.0, macCatalyst 18.0, iOS 18.0, *)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    @MainActor @preconcurrency public func targetedToAnyEntity() -> some Gesture<EntityTargetValue<Self.Value>> {
        return __TMP_Gesture<Value>()
    }
    
    @available(visionOS 1.0, macOS 15.0, macCatalyst 18.0, iOS 18.0, *)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    @MainActor @preconcurrency public func targetedToEntity(_ entity: Entity) -> some Gesture<EntityTargetValue<Self.Value>> {
        return __TMP_Gesture<Value>()
    }
    
    @available(visionOS 1.0, macOS 15.0, macCatalyst 18.0, iOS 18.0, *)
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    @MainActor @preconcurrency public func targetedToEntity(where query: QueryPredicate<Entity>) -> some Gesture<EntityTargetValue<Self.Value>> {
        return __TMP_Gesture<Value>()
    }
}

fileprivate struct __TMP_Gesture<V> : Gesture {
    typealias Value = EntityTargetValue<V>
    
    
}
