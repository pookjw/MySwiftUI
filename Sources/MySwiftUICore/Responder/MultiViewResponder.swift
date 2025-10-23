#warning("TODO")

@_spi(Internal) open class MultiViewResponder: ViewResponder {
    var _children: [ViewResponder] = []
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
