#warning("TODO")

@_spi(Internal) open class ViewResponder: ResponderNode {
    package private(set) weak var host: (any ViewGraphDelegate)? = nil
    private var serverResponderID: UInt32? = nil
    private weak var parent: ViewResponder? = nil
}

extension ViewResponder {
    public struct ContainsPointsCache {
        var storage: (key: UInt32, value: ContainsPointsResult)?
    }
}

extension ViewResponder {
    public struct ContainsPointsResult {
        var mask: BitVector64
        var priority: Double
        var children: [ViewResponder]
    }
}

struct ViewRespondersKey: PreferenceKey {
    static var defaultValue: [ViewResponder] {
        return []
    }
    
    static func reduce(value: inout [ViewResponder], nextValue: () -> [ViewResponder]) {
        return value.append(contentsOf: nextValue())
    }
}
