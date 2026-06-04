@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@available(visionOS, unavailable)
public protocol __ARViewDelegatePrivate : AnyObject {
    func viewWillProcessTapInteraction(_ view: ARView)
    func view(_ view: ARView, performedTapInteraction: Bool, for entity: Entity?)
    @available(macOS 11.0, iOS 14.0, macCatalyst 14.0, tvOS 26.0, *)
    func view(_ view: ARView, performedProximityInteractionsForEntities: [Entity])
    func update(_ view: ARView, deltaTime: Float)
}

@available(macOS 11.0, iOS 14.0, macCatalyst 14.0, tvOS 26.0, *)
@available(visionOS, unavailable)
extension __ARViewDelegatePrivate {
    public func view(_ view: ARView, performedProximityInteractionsForEntities: [Entity]) {
        assertUnimplemented()
    }
}
