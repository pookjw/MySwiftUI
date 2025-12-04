// 7DF024579E4FC31D4E92A33BBA0366D6

private import Observation
@_spi(SwiftUI) internal import _ObservationPrivate
internal import AttributeGraph

@MainActor final class ObservationCenter {
    fileprivate static let _current = ThreadSpecific(ObservationCenter())
    static var current: ObservationCenter {
        return _current.value
    }
    
    private var latestTriggers: [AnyKeyPath] = []
    private var latestAccessLists: [ObservationTracking._AccessList] = []
    private var invalidations: [AnyWeakAttribute: (mutation: ObservationGraphMutation, accessList: ObservationTracking._AccessList)] = [:]
    
    private init() {
    }
    
    func _withObservationStashed<T>(do: () throws -> T) rethrows -> (value: T, accessOccurred: Bool) {
        fatalError("TODO")
    }
    
    func _withObservation<T>(do: () throws -> T) rethrows -> (value: T, accessList: ObservationTracking._AccessList?) {
        fatalError("TODO")
    }
    
    func _withObservation<T, U>(attribute: Attribute<U>, do: () throws -> T) rethrows -> T {
        fatalError("TODO")
    }
    
    func invalidate<T>(_: Attribute<T>, onChangeIn: [ObservationTracking._AccessList]) {
        fatalError("TODO")
    }
    
    fileprivate func invalidate<T>(_: Attribute<T>, onChangeIn: ObservationTracking._AccessList) {
        fatalError("TODO")
    }
}

struct ObservationGraphMutation {
    private let observationCenter: ObservationCenter
    private var invalidatingMutation: InvalidatingGraphMutation
    private var observationTracking: [ObservationTracking]
    private var subgraphObservers: [(Subgraph, Int)]
}

struct InvalidatingGraphMutation {
    private let attribute: AnyWeakAttribute
}
