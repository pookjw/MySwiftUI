#warning("TODO")

internal import MySwiftUICore

struct UIKitScenePresentationModeLocation<Content: View>: Location {
    typealias Value = PresentationMode
    
    weak var host: _UIHostingView<Content>?
}
