public import MySwiftUICore
public import Spatial

@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public struct RealityViewContent : RealityViewContentProtocol {
    public var entities: RealityViewEntityCollection {
        get {
            assertUnimplemented()
        }
        nonmutating set {
            assertUnimplemented()
        }
    }
    
    public func subscribe<E>(to event: E.Type, on sourceObject: (any EventSource)?, componentType: (any Component.Type)?, _ handler: @escaping (E) -> Swift.Void) -> EventSubscription where E : Event {
        assertUnimplemented()
    }
    
    @available(visionOS 1.0, *)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    public typealias Entities = RealityViewEntityCollection
}

@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension RealityViewContent {
    @MainActor @preconcurrency public struct Body<Placeholder> : View where Placeholder : View {
        @MainActor @preconcurrency public var body: some View {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension RealityViewContent : RealityCoordinateSpaceConverting, RealityCoordinateSpace {
    public func _resolve(in context: __RealityCoordinateSpaceContext) -> __ResolvedRealityCoordinateSpace
    public func transform(from: some RealityCoordinateSpace, to: some CoordinateSpaceProtocol) -> AffineTransform3D
    public func transform(from: some CoordinateSpaceProtocol, to: some RealityCoordinateSpace) -> AffineTransform3D
}
