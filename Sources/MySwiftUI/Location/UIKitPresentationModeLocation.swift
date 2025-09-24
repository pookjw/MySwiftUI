#warning("TODO")

internal import MySwiftUICore

struct UIKitPresentationModeLocation<Content: View>: Location {
    typealias Value = PresentationMode
    
    private weak var host: _UIHostingView<Content>?
    
    init(host: _UIHostingView<Content>?) {
        self.host = host
    }
}
