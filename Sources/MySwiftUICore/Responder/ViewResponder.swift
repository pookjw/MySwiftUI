
@_spi(Internal) open class ViewResponder: ResponderNode {
    package private(set) weak var host: (any ViewGraphDelegate)?
    private var serverResponderID: UInt32?
    private weak var parent: ViewResponder?
    
    @inline(__always)
    package override init() {
        self.host = nil
        self.serverResponderID = nil
        self.parent = nil
        self.host = ViewGraph.current.delegate
    }
    
    @inline(__always)
    package init(host: (any ViewGraphDelegate)?) {
        self.host = nil
        self.serverResponderID = nil
        self.parent = nil
        self.host = host
    }
    
    package var children: [ViewResponder] {
        return []
    }
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

package struct ViewRespondersKey: PreferenceKey {
    package static var defaultValue: [ViewResponder] {
        return []
    }
    
    package static func reduce(value: inout [ViewResponder], nextValue: () -> [ViewResponder]) {
        return value.append(contentsOf: nextValue())
    }
}
