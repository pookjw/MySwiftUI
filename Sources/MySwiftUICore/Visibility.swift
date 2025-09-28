#warning("TODO")

@frozen
public enum Visibility: Int, Hashable, CaseIterable {
    case automatic
    case visible
    case hidden
}
