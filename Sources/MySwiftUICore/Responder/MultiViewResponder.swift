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
    var observers: ContentPathObservers = ContentPathObservers()
}
