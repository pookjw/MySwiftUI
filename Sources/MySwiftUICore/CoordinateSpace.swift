#warning("TODO")

package let hostingViewCoordinateSpace = CoordinateSpace.ID()

public enum CoordinateSpace {
    case named(AnyHashable)
    
    @_spi(Internal)
    case id(CoordinateSpace.ID)
    
    case global
    case local
}

@available(*, unavailable)
extension CoordinateSpace: Sendable {}

extension CoordinateSpace {
    public struct ID: Sendable {
        var value: UniqueID
        
        init() {
            value = UniqueID()
        }
    }
    
    static var root: CoordinateSpace {
        fatalError("TODO")
    }
    
    package static var globalID: CoordinateSpace.ID {
        fatalError("TODO")
    }
}

extension CoordinateSpace.ID {
    static let immersiveSpace = CoordinateSpace.ID()
    package static let worldReference = CoordinateSpace.ID()
    static let viewGraphHost = CoordinateSpace.ID()
    package static let viewGraphHostContainerCoordinateSpace = CoordinateSpace.ID()
}
