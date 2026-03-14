@preconcurrency internal import _MySwiftUI
internal import MySwiftUICore

@MainActor struct ToggleStyle: AnyDefaultStyle, _MySwiftUI.ToggleStyle {
    nonisolated init() {}
    
    func makeBody(configuration: ToggleStyleConfiguration) -> Never {
        assertUnimplemented()
    }
}
