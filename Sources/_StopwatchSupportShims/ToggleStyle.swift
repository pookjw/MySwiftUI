@preconcurrency internal import MySwiftUI
internal import MySwiftUICore

@MainActor struct ToggleStyle: AnyDefaultStyle, MySwiftUI.ToggleStyle {
    nonisolated init() {}
    
    func makeBody(configuration: ToggleStyleConfiguration) -> Never {
        assertUnimplemented()
    }
}
