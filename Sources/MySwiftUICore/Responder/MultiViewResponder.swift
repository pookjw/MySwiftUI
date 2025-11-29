#warning("TODO")

@_spi(Internal) open class MultiViewResponder: ViewResponder {
    private var _children: [ViewResponder] = []
    var children: [ViewResponder] {
        get {
            return _children
        }
        set {
            _children = newValue
        }
        _modify {
            yield &_children
        }
    }
    
    var cache: ViewResponder.ContainsPointsCache = ContainsPointsCache(
        storage: (
            key: 0,
            value: ContainsPointsResult(
                mask: BitVector64(rawValue: 0),
                priority: 0,
                children: []
            )
        )
    )
    var observers = ContentPathObservers()
    
    @inline(__always)
    package override init() {
        super.init()
    }
    
    open override func bindEvent(_ type: any EventType) {
        fatalError("TODO")
    }
    
    open override func visit(applying: (ResponderNode) -> ResponderVisitorResult) -> ResponderVisitorResult {
        let result = applying(self)
        guard result != .next else {
            return result
        }
        
        for child in children {
            let result = child.visit(applying: applying)
            guard result != .cancel else {
                return result
            }
        }
        
        return .next
    }
}
