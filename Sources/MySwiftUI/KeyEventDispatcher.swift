@_spi(Internal) internal import MySwiftUICore

struct KeyEventDispatcher : ForwardedEventDispatcher {
    static var eventType: any EventType.Type {
        assertUnimplemented()
    }

    // inlined from $s7SwiftUI14_UIHostingViewC04rootD0ACyxGx_tcfc
//    private var bindings: [EventID: KeyPress.Handler] = [:]
}
