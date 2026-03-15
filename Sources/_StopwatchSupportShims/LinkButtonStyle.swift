@preconcurrency internal import _MySwiftUI
internal import MySwiftUICore

@MainActor struct LinkButtonStyle: AnyDefaultStyle, PrimitiveButtonStyle, ButtonStyleConvertible {
    nonisolated init() {}
    
    func makeBody(configuration: PrimitiveButtonStyleConfiguration) -> Never {
        assertUnimplemented()
    }
    
    nonisolated var buttonStyleRepresentation: LinkButtonStyle.Representation {
        assertUnimplemented()
    }
}

extension LinkButtonStyle {
    struct Representation: ButtonStyle, AnyDefaultStyle {
        nonisolated init() {}
        
        func makeBody(configuration: ButtonStyleConfiguration) -> Never {
            assertUnimplemented()
        }
    }
}
