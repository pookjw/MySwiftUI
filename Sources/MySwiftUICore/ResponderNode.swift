
@_spi(Internal) open class ResponderNode {
    open func log(action: String, data: Any?) {
        assertUnimplemented()
    }
    
    @discardableResult
    open func visit(applying: (ResponderNode) -> ResponderVisitorResult) -> ResponderVisitorResult {
        return applying(self)
    }
    
    open func makeGesture(inputs: _GestureInputs) -> _GestureInputs {
        assertUnimplemented()
    }
    
    package init() {
    }
    
    open func isDescendant(of other: ResponderNode) -> Bool {
        assertUnimplemented()
    }
    
    open var sequence: some Sequence {
        assertUnimplemented()
        return []
    }
    
    open var nextResponder: ResponderNode? {
        assertUnimplemented()
    }
    
    open func firstAncestor<T>(ofType type: T.Type) -> T? {
        assertUnimplemented()
    }
    
    open func bindEvent(_ type: EventType) {
        assertUnimplemented()
    }
}

@_spi(Internal) public enum ResponderVisitorResult: Hashable {
    case next
    case skipToNextSibling
    case cancel
}
