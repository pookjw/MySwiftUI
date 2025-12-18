
@frozen public struct Anchor<Value> {
    fileprivate let box: AnchorValueBoxBase<Value>
}

extension Anchor: Sendable where Value: Sendable {}
//extension Anchor: Equatable where Value: Equatable {}
//extension Anchor: Hashable where Value: Hashable {}

@usableFromInline
class AnchorValueBoxBase<T> {}

extension AnchorValueBoxBase: @unchecked Sendable where T : Sendable {}
