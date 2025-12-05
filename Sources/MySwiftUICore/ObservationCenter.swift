// 7DF024579E4FC31D4E92A33BBA0366D6

private import Observation
@_spi(SwiftUI) internal import _ObservationPrivate
internal import AttributeGraph
private import _DarwinFoundation3.pthread

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
    
    func _withObservationStashed<T>(do block: () throws -> T) rethrows -> (value: T, accessOccurred: Bool) {
        /*
         x29 = sp + 0x140
         self = sp + 0x70
         do = sp + 0x88
         T = x25
         */
        var accessList: ObservationTracking._AccessList?
        let result = try withUnsafePointer(to: &accessList) { pointer in
            let key: pthread_key_t = 106 // tls_key::observation_transaction
            let old = pthread_getspecific(key)
            pthread_setspecific(key, pointer)
            defer {
                pthread_setspecific(key, old)
            }
            return try block()
        }
        
        if let accessList {
            latestAccessLists.append(accessList)
            return (result, true)
        } else {
            return (result, false)
        }
    }
    
    func _withObservation<T>(do block: () throws -> T) rethrows -> (value: T, accessList: ObservationTracking._AccessList?) {
        var accessList: ObservationTracking._AccessList?
        let result = try withUnsafePointer(to: &accessList) { pointer in
            let key: pthread_key_t = 106 // tls_key::observation_transaction
            let old = pthread_getspecific(key)
            pthread_setspecific(key, pointer)
            defer {
                pthread_setspecific(key, old)
            }
            return try block()
        }
        
        if let accessList {
            return (result, accessList)
        } else {
            return (result, nil)
        }
    }
    
    func _withObservation<T, U>(attribute: Attribute<U>, do block: () throws -> T) rethrows -> T {
        var accessList: ObservationTracking._AccessList?
        let result = try withUnsafePointer(to: &accessList) { pointer in
            let key: pthread_key_t = 106 // tls_key::observation_transaction
            let old = pthread_getspecific(key)
            pthread_setspecific(key, pointer)
            defer {
                pthread_setspecific(key, old)
            }
            return try block()
        }
        
        // TODO
        if let accessList {
            latestAccessLists.append(accessList)
        }
        
        for latestAccessList in latestAccessLists {
            invalidate(attribute, onChangeIn: <#T##[ObservationTracking._AccessList]#>)
        }
        fatalError("TODO")
    }
    
    func invalidate<T>(_ attribute: Attribute<T>, onChangeIn: [ObservationTracking._AccessList]) {
        fatalError("TODO")
    }
    
    fileprivate func invalidate<T>(_ attribute: Attribute<T>, onChangeIn: ObservationTracking._AccessList) {
        /*
         self = sp + 0xf0
         onChangeIn = sp + 0x108
         attribute = x20
         */
        // <+408>
        // sp + 0xe0
        guard let subgraph = attribute.identifier.subgraph2 else {
            return
        }
        
        let box = WeakBox(GraphHost.currentHost)
        let weakAttribute = WeakAttribute(attribute)
        
        if let invalidation = invalidations.removeValue(forKey: weakAttribute.base) {
            // <+632>
            fatalError("TODO")
        } else {
            // <+596>
            fatalError("TODO")
        }
        
        // <+560>
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
