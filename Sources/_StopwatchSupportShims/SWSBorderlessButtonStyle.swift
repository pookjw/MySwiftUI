@preconcurrency internal import MySwiftUI
internal import MySwiftUICore

@MainActor struct SWSBorderlessButtonStyle: AnyDefaultStyle, PrimitiveButtonStyle, ButtonStyleConvertible {
    nonisolated init() {}
    
    func makeBody(configuration: PrimitiveButtonStyleConfiguration) -> Never {
        assertUnimplemented()
    }
    
    nonisolated var buttonStyleRepresentation: SWSBorderlessButtonStyle.Representation {
        assertUnimplemented()
    }
}

extension SWSBorderlessButtonStyle {
    struct Representation: ButtonStyle, AnyDefaultStyle {
        nonisolated init() {}
        
        func makeBody(configuration: ButtonStyleConfiguration) -> Never {
            assertUnimplemented()
        }
    }
}
