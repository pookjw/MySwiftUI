@preconcurrency internal import MySwiftUI
internal import MySwiftUICore

@MainActor struct SliderStyle: AnyDefaultStyle, MySwiftUI::SliderStyle {
    nonisolated init() {}
}
