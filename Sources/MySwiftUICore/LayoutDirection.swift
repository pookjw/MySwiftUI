#warning("TODO")

public enum LayoutDirection: Hashable, Sendable {
    case fixed
    indirect case mirrors(in: LayoutDirection)
}
