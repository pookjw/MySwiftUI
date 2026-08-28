internal import MySwiftUICore

public struct PaletteSelectionEffect : Sendable, Equatable { 
    let guts: PaletteSelectionEffect.Guts

    public static func == (lhs: PaletteSelectionEffect, rhs: PaletteSelectionEffect) -> Bool {
        assertUnimplemented()
    }
}

extension PaletteSelectionEffect {
    enum Guts : Equatable {
        case symbolVariant(SymbolVariants)
        case automatic
        case custom
    }
}
