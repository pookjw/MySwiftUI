@preconcurrency internal import MySwiftUI
internal import MySwiftUICore

@MainActor struct GroupBoxStyle : AnyDefaultStyle, MySwiftUI::GroupBoxStyle {
    nonisolated init() {}
}
