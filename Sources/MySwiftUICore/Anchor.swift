#warning("TODO")

@frozen public struct Anchor<Value> {
    fileprivate let box: AnchorValueBoxBase<Value>
} 

@usableFromInline
class AnchorValueBoxBase<T> {}
