@preconcurrency internal import MySwiftUI
internal import MySwiftUICore

@MainActor struct SWSBorderlessButtonStyle : AnyDefaultStyle, PrimitiveButtonStyle, ButtonStyleConvertible {
    nonisolated init() {}
    
    func makeBody(configuration: PrimitiveButtonStyleConfiguration) -> Never {
        assertUnimplemented()
    }
    
    nonisolated var buttonStyleRepresentation: SWSBorderlessButtonStyle.ButtonStyleRepresentation {
        assertUnimplemented()
    }
}

extension SWSBorderlessButtonStyle {
    struct ButtonStyleRepresentation : ButtonStyle, AnyDefaultStyle {
        nonisolated init() {}
        
        func makeBody(configuration: ButtonStyleConfiguration) -> Never {
            assertUnimplemented()
        }
    }
}
