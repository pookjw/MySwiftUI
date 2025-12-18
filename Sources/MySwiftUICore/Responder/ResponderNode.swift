
@_spi(Internal) open class ResponderNode {
    open func log(action: String, data: Any?) {
        fatalError("TODO")
    }
    
    @discardableResult
    open func visit(applying: (ResponderNode) -> ResponderVisitorResult) -> ResponderVisitorResult {
        return applying(self)
    }
    
    open func makeGesture(inputs: _GestureInputs) -> _GestureInputs {
        fatalError("TODO")
    }
    
    package init() {
    }
    
    open func isDescendant(of other: ResponderNode) -> Bool {
        fatalError("TODO")
    }
    
    open var sequence: some Sequence {
        fatalError("TODO")
        return []
    }
    
    open var nextResponder: ResponderNode? {
        fatalError("TODO")
    }
    
    open func firstAncestor<T>(ofType type: T.Type) -> T? {
        fatalError("TODO")
    }
    
    open func bindEvent(_ type: EventType) {
        fatalError("TODO")
    }
}

@_spi(Internal) public enum ResponderVisitorResult: Hashable {
    case next
    case skipToNextSibling
    case cancel
}
