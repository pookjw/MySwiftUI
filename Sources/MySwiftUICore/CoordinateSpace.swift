#warning("TODO")

public enum CoordinateSpace {
    case named(AnyHashable)
    case id(CoordinateSpace.ID)
    case global
    case local
}

extension CoordinateSpace {
    public struct ID {
        var value: UniqueID
    }
}
