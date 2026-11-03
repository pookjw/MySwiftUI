@preconcurrency internal import MySwiftUI
internal import MySwiftUICore

@MainActor struct SWSPlainButtonStyle : AnyDefaultStyle, PrimitiveButtonStyle, ButtonStyleConvertible {
    nonisolated init() {}
    
    func makeBody(configuration: PrimitiveButtonStyleConfiguration) -> Never {
        assertUnimplemented()
    }
    
    nonisolated var buttonStyleRepresentation: SWSPlainButtonStyle.ButtonStyleRepresentation {
        assertUnimplemented()
    }
}

extension SWSPlainButtonStyle {
    struct ButtonStyleRepresentation : ButtonStyle, AnyDefaultStyle {
        nonisolated init() {}
        
        func makeBody(configuration: ButtonStyleConfiguration) -> Never {
            assertUnimplemented()
        }
    }
}
