#warning("TODO")
package import MySwiftUICore

public struct PaletteSelectionEffect: Sendable, Equatable { 
    let guts: PaletteSelectionEffect.Guts
}

extension PaletteSelectionEffect {
    enum Guts: Equatable {
        case symbolVariant(SymbolVariants)
        case automatic
        case custom
    }
}
