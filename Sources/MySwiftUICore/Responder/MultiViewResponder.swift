#warning("TODO")

@_spi(Internal) open class MultiViewResponder: ViewResponder {
    private var _children: [ViewResponder] = []
    var children: [ViewResponder] {
        get {
            fatalError("TODO")
        }
        set {
            fatalError("TODO")
        }
        _modify {
            fatalError("TODO")
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
}
