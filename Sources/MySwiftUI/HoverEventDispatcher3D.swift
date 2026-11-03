@_spi(Internal) internal import MySwiftUICore

struct HoverEventDispatcher3D : ForwardedEventDispatcher {
    static var eventType: any EventType.Type {
        assertUnimplemented()
    }

    private var eventBindings: [EventID : EventBinding] = [:]
}
