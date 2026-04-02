@preconcurrency internal import MySwiftUI
internal import MySwiftUICore

@MainActor struct SWSBorderedButtonStyle : AnyDefaultStyle, PrimitiveButtonStyle, ButtonStyleConvertible {
    nonisolated init() {}
    
    func makeBody(configuration: PrimitiveButtonStyleConfiguration) -> Never {
        assertUnimplemented()
    }
    
    nonisolated var buttonStyleRepresentation: SWSBorderedButtonStyle.Representation {
        assertUnimplemented()
    }
}

extension SWSBorderedButtonStyle {
    struct Representation : ButtonStyle, AnyDefaultStyle {
        nonisolated init() {}
        
        func makeBody(configuration: ButtonStyleConfiguration) -> Never {
            assertUnimplemented()
        }
    }
}
