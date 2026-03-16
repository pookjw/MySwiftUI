internal import MySwiftUICore

struct HoverEventDispatcher3D: ForwardedEventDispatcher {
    private var eventBindings: [EventID : EventBinding] = [:]
}
