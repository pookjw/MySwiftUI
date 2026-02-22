@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public enum _IdentifiedViewTree {
    case empty
    case proxy(_IdentifiedViewProxy)
    case array([_IdentifiedViewTree])
    
    public func forEach(_ body: (_IdentifiedViewProxy) -> Void) {
        fatalError("TODO")
    }
}

@available(*, unavailable)
extension _IdentifiedViewTree: Sendable {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct _IdentifiedViewsKey {
    public typealias Value = _IdentifiedViewTree
    
    nonisolated(unsafe) public static let defaultValue: _IdentifiedViewTree = {
        fatalError("TODO")
    }()
    
    public static func reduce(value: inout _IdentifiedViewsKey.Value, nextValue: () -> _IdentifiedViewsKey.Value) {
        fatalError("TODO")
    }
}

@available(*, unavailable)
extension _IdentifiedViewsKey: Sendable {
}
