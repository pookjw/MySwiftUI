#warning("TODO")

internal import MySwiftUICore

struct UIKitScenePresentationModeLocation<Content: View>: Location {
    typealias Value = PresentationMode
    
    private weak var host: _UIHostingView<Content>?
    
    init(host: _UIHostingView<Content>?) {
        self.host = host
    }
}
