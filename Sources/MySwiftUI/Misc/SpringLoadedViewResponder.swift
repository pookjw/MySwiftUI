#warning("TODO")
@_spi(Internal) internal import MySwiftUICore 

class SpringLoadedViewResponder: DefaultLayoutViewResponder {
    var isEnabled: Bool = false
    var onActivate: () -> Void = {}
    var onHighlightChange: (SpringLoadingBehavior.HighlightState) -> Void = { _ in }
    var onEnded: () -> Void = {}
}
