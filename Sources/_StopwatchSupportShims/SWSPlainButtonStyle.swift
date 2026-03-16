@preconcurrency internal import MySwiftUI
internal import MySwiftUICore

@MainActor struct SWSPlainButtonStyle: AnyDefaultStyle, PrimitiveButtonStyle, ButtonStyleConvertible {
    nonisolated init() {}
    
    func makeBody(configuration: PrimitiveButtonStyleConfiguration) -> Never {
        assertUnimplemented()
    }
    
    nonisolated var buttonStyleRepresentation: SWSPlainButtonStyle.Representation {
        assertUnimplemented()
    }
}

extension SWSPlainButtonStyle {
    struct Representation: ButtonStyle, AnyDefaultStyle {
        nonisolated init() {}
        
        func makeBody(configuration: ButtonStyleConfiguration) -> Never {
            assertUnimplemented()
        }
    }
}
