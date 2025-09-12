#warning("TODO")
public import CoreGraphics

@frozen public struct HorizontalAlignment: Equatable {
    public init(_ id: any AlignmentID.Type) {
        fatalError("TODO")
    }
    
    @_documentation(visibility: private) public let key: AlignmentKey
}

extension HorizontalAlignment {
    public func combineExplicit<S>(_ values: S) -> CGFloat? where S : Sequence, S.Element == CGFloat? {
        fatalError("TODO")
    }
}

extension HorizontalAlignment {
    public static let leading: HorizontalAlignment = {
        fatalError("TODO")
    }()
    
    public static let center: HorizontalAlignment = {
        fatalError("TODO")
    }()
    
    public static let trailing: HorizontalAlignment = {
        fatalError("TODO")
    }()
}

extension HorizontalAlignment {
    public static let listRowSeparatorLeading: HorizontalAlignment = {
        fatalError("TODO")
    }()
    
    public static let listRowSeparatorTrailing: HorizontalAlignment = {
        fatalError("TODO")
    }()
}

extension HorizontalAlignment: Sendable {}
extension HorizontalAlignment: BitwiseCopyable {}
