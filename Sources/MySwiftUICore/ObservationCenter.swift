// 7DF024579E4FC31D4E92A33BBA0366D6

private import Observation
@_spi(SwiftUI) internal import _ObservationPrivate
@preconcurrency internal import AttributeGraph
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
        let result = try withUnsafeMutablePointer(to: &accessList) { pointer in
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
        let result = try withUnsafeMutablePointer(to: &accessList) { pointer in
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
        let result = try withUnsafeMutablePointer(to: &accessList) { pointer in
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
        }
        
        // <+1076>
        invalidate(attribute, onChangeIn: latestAccessLists)
        return result
    }
    
    func invalidate<T>(_ attribute: Attribute<T>, onChangeIn accessLists: [ObservationTracking._AccessList]) {
        for accessList in accessLists {
            invalidate(attribute, onChangeIn: accessList)
        }
    }
    
    fileprivate func invalidate<T>(_ attribute: Attribute<T>, onChangeIn accessList: ObservationTracking._AccessList) {
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
        
        // sp + 0x150
        let currentHost = WeakUncheckedSendable(GraphHost.currentHost)
        // x28
        let weakAttribute = WeakAttribute(attribute)
        // x21
        var accessList = accessList
        
        if var (mutation, existingAccessList) = invalidations.removeValue(forKey: weakAttribute.base) {
            // <+632>
            accessList.merge(existingAccessList)
        }
        
        // <+768>
        let tracking = ObservationTracking(accessList)
        let observerID = subgraph.addObserver { [weak self] in
            // $s7SwiftUI17ObservationCenterC10invalidate33_7DF024579E4FC31D4E92A33BBA0366D6LL_10onChangeIny14AttributeGraph0Q0VyxG_0C00C8TrackingV11_AccessListVtlFyycfU_TA
            fatalError("TODO")
        }
        
        let mutation = ObservationGraphMutation(
            observationCenter: self,
            invalidatingMutation: InvalidatingGraphMutation(attribute: weakAttribute.base),
            observationTracking: [tracking],
            subgraphObservers: [(subgraph, observerID)]
        )
        invalidations[weakAttribute.base] = (mutation, accessList)
        
        // <+1308>
        ObservationTracking._installTracking(
            tracking,
            willSet: { [subgraph = UncheckedSendable(subgraph)] tracking in
                // $s7SwiftUI17ObservationCenterC10invalidate33_7DF024579E4FC31D4E92A33BBA0366D6LL_10onChangeIny14AttributeGraph0Q0VyxG_0C00C8TrackingV11_AccessListVtlFyAMYbcfU0_TA
                guard subgraph.value.isValid else {
                    return
                }
                
                Update.locked {
                    MainActor.assumeIsolated { // 확실치 않음
                        // $s7SwiftUI17ObservationCenterC10invalidate33_7DF024579E4FC31D4E92A33BBA0366D6LL_10onChangeIny14AttributeGraph0Q0VyxG_0C00C8TrackingV11_AccessListVtlFyAMYbcfU0_yyXEfU_
                        guard
                            let attribute = weakAttribute.attribute,
                            let graphHost = currentHost.value
                        else {
                            mutation.cancel()
                            return
                        }
                        
                        let transaction = graphHost.asyncTransaction(
                            .current,
                            id: Transaction.id,
                            mutation: mutation,
                            style: (pthread_main_np() != 1) ? .deferred : .immediate,
                            mayDeferUpdate: true
                        )
                        
                        CustomEventTrace.observableFireWithTransaction(
                            transaction: transaction,
                            key: tracking.changed,
                            attribute: attribute.identifier
                        )
                    }
                    
                    Update.end()
                }
            },
            didSet: nil
        )
    }
}

struct ObservationGraphMutation: GraphMutation, Sendable {
    private let observationCenter: ObservationCenter
    private var invalidatingMutation: InvalidatingGraphMutation
    private var observationTracking: [ObservationTracking]
    private var subgraphObservers: [(Subgraph, Int)]
    
    @inline(__always)
    fileprivate init(observationCenter: ObservationCenter, invalidatingMutation: InvalidatingGraphMutation, observationTracking: [ObservationTracking], subgraphObservers: [(Subgraph, Int)]) {
        self.observationCenter = observationCenter
        self.invalidatingMutation = invalidatingMutation
        self.observationTracking = observationTracking
        self.subgraphObservers = subgraphObservers
    }
    
    func apply() {
        fatalError("TODO")
    }
    
    func combine<T: GraphMutation>(with other: T) -> Bool {
        fatalError("TODO")
    }
    
    func cancel() {
        fatalError("TODO")
    }
}

struct InvalidatingGraphMutation: GraphMutation {
    private let attribute: AnyWeakAttribute
    
    @inline(__always)
    fileprivate init(attribute: AnyWeakAttribute) {
        self.attribute = attribute
    }
    
    func apply() {
        fatalError("TODO")
    }
    
    func combine<T>(with other: T) -> Bool where T : GraphMutation {
        fatalError("TODO")
    }
}

fileprivate struct ObservationEntry {
    private let context: AnyObject
    private var properties: Set<AnyKeyPath>
    
    init(_ context: AnyObject, properties: Set<AnyKeyPath> = []) {
        self.context = context
        self.properties = properties
    }
    
    func union(_ entry: ObservationEntry) -> ObservationEntry {
        ObservationEntry(context, properties: properties.union(entry.properties))
    }
}

extension ObservationTracking._AccessList {
    fileprivate mutating func merge(_ other: ObservationTracking._AccessList) {
        withUnsafeMutablePointer(to: &self) { selfPointer in
            withUnsafePointer(to: other) { otherPointer in
                let selfEntries = UnsafeMutableRawPointer(selfPointer)
                    .assumingMemoryBound(to: [ObjectIdentifier: ObservationEntry].self)
                let otherEntries = UnsafeRawPointer(otherPointer)
                    .assumingMemoryBound(to: [ObjectIdentifier: ObservationEntry].self)
                
                selfEntries.pointee.merge(otherEntries.pointee) { $0.union($1) }
            }
        }
    }
}
