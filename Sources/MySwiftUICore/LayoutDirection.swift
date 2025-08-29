#warning("TODO")

public indirect enum LayoutDirection: Hashable, Sendable {
    case fixed
    case mirrors(in: LayoutDirection)
}
