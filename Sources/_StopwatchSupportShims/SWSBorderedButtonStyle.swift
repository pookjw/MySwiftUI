@preconcurrency internal import MySwiftUI
internal import MySwiftUICore

@MainActor struct SWSBorderedButtonStyle : AnyDefaultStyle, PrimitiveButtonStyle, ButtonStyleConvertible {
    nonisolated init() {}
    
    func makeBody(configuration: PrimitiveButtonStyleConfiguration) -> Never {
        assertUnimplemented()
    }
    
    nonisolated var buttonStyleRepresentation: SWSBorderedButtonStyle.ButtonStyleRepresentation {
        assertUnimplemented()
    }
}

extension SWSBorderedButtonStyle {
    struct ButtonStyleRepresentation : ButtonStyle, AnyDefaultStyle {
        nonisolated init() {}
        
        func makeBody(configuration: ButtonStyleConfiguration) -> Never {
            assertUnimplemented()
        }
    }
}
