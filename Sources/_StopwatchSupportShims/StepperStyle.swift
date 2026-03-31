@preconcurrency internal import MySwiftUI
internal import MySwiftUICore

@MainActor struct StepperStyle: AnyDefaultStyle, MySwiftUI::StepperStyle {
    nonisolated init() {}
}
