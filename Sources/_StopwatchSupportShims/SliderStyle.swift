@preconcurrency internal import MySwiftUI
internal import MySwiftUICore

struct SliderStyle : AnyDefaultStyle, MySwiftUI::SliderStyle {
    func makeBody(configuration: MySwiftUI.SliderStyleConfiguration) -> Never {
        assertUnimplemented()
    }
    
    typealias Body = Never // TODO
    
    nonisolated init() {}
}
