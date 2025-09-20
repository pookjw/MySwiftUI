#warning("TODO")
package import AttributeGraph
private import notify
private import Darwin.POSIX.dlfcn
private import _DarwinFoundation3._stdlib

fileprivate nonisolated(unsafe) var threadAssertionTrace = Trace(
    unknown_block_1: nil,
    unknown_block_2: nil,
    unknown_block_3: nil,
    block_4: { _, _, _ in fatalError("TODO") },
    unknown_block_5: nil,
    block_6: { _, _ in fatalError("TODO") },
    unknown_block_7: nil,
    block_8: { _, _ in fatalError("TODO") },
    unknown_block_9: nil,
    block_10: { _, _ in fatalError("TODO") },
    unknown_block_11: nil,
    block_12: { _, _, _ in fatalError("TODO") },
    unknown_block_13: nil,
    unknown_block_14: nil,
    unknown_block_15: nil,
    unknown_block_16: nil,
    unknown_block_17: nil,
    didCreateGraph: { _, _ in
        Update.assertIsLocked()
    },
    block_19: { _, _ in fatalError("TODO") },
    block_20: { _, _ in fatalError("TODO") },
    didCreateSubgraph: { _, _ in
        Update.assertIsLocked()
    },
    block_22: { _, _ in fatalError("TODO") },
    unknown_block_23: nil,
    unknown_block_24: nil,
    didAddValue: { _, _ in
        Update.assertIsLocked()
    },
    unknown_block_26: nil,
    unknown_block_27: nil,
    unknown_block_28: nil,
    unknown_block_29: nil,
    unknown_block_30: nil,
    didSetValue: { _, _, _ in
        Update.assertIsLocked()
    },
    block_32: { _, _ in fatalError("TODO") },
    didAddIndirect: { _, _ in
        Update.assertIsLocked()
    },
    block_34: { _, _, _ in fatalError("TODO") },
    block_35: { _, _, _ in fatalError("TODO") },
    unknown_block_36: nil,
    block_37: { _, _, _, _, _ in fatalError("TODO") },
    unknown_block_38: nil,
    unknown_block_39: nil,
    unknown_block_40: nil,
    unknown_block_41: nil,
    unknown_block_42: nil
)

func handleTraceNotification(graph: Graph, token: Int32) {
    let state = withUnsafeTemporaryAllocation(of: UInt64.self, capacity: 1) { pointer in
        notify_get_state(token, pointer.baseAddress)
        return pointer.baseAddress.unsafelyUnwrapped.pointee
    }
    
    guard state == 1 else {
        return
    }
    
    guard let SwiftUITracingSupport = dlopen("/System/Library/PrivateFrameworks/SwiftUITracingSupport.framework/SwiftUITracingSupport", RTLD_LOCAL) else {
        return
    }
    
    guard let swiftUITraceRegister = dlsym(SwiftUITracingSupport, "swiftUITraceRegister") else {
        return
    }
    
    Update.locked {
        fatalError("TODO")
    }
}

fileprivate let waitingForPreviewThunks: Bool = {
    guard let value = getenv("XCODE_RUNNING_FOR_PREVIEWS") else {
        return false
    }
    
    return atoi(value) != 0
}()

fileprivate nonisolated(unsafe) var blockedGraphHosts: [Unmanaged<GraphHost>] = []

@_spi(Internal) open class GraphHost {
    fileprivate static nonisolated(unsafe) let sharedGraph: Graph = {
        let graph = Graph()
        // original : "SWIFTUI_ASSERT_LOCKS"
        let assertLocks = getenv("MYSWIFTUI_ASSERT_LOCKS")
        
        if assertLocks != nil {
            let integer = atoi(assertLocks)
            if integer != 0 {
                withUnsafePointer(to: &threadAssertionTrace) { pointer in
                    graph.setTrace(pointer)
                }
            }
        }
        
        let token: Int32 = withUnsafeTemporaryAllocation(of: Int32.self, capacity: 1) { outToken in
            notify_register_dispatch("com.apple.swiftuitrace.state", outToken.baseAddress, .main, { token in
                handleTraceNotification(graph: graph, token: token)
            })
            
            return outToken.baseAddress.unsafelyUnwrapped.pointee
        }
        
        handleTraceNotification(graph: graph, token: token)
        
        return graph
    }() 
    
    package final var globalSubgraph: Subgraph {
        return data.globalSubgraph
    }
    
    package var parentHost : GraphHost? {
        return nil
    }
    
    package var graphDelegate: ViewGraphDelegate? {
        return nil
    }
    
    package private(set) final var data: GraphHost.Data
    private var constants: [ConstantKey: AnyAttribute]
    private var isInstantiated: Bool
    private var hostPreferenceValues: WeakAttribute<PreferenceValues>
    private var lastHostPreferencesSeed: VersionSeed
    private var pendingTransactions: [AsyncTransaction]
    private var inTransaction: Bool
    private var continuations: [any GraphMutation]
    package private(set) nonisolated final var mayDeferUpdate: Bool
    private var removedState: GraphHost.RemovedState
    
    init(data: GraphHost.Data) {
        self.data = data
        self.constants = [:]
        self.isInstantiated = false
        self.hostPreferenceValues = WeakAttribute()
        self.lastHostPreferencesSeed = VersionSeed(value: .max)
        self.pendingTransactions = []
        self.inTransaction = false
        self.continuations = []
        self.mayDeferUpdate = true
        self.removedState = GraphHost.RemovedState(rawValue: 0)
        
        CustomEventTrace.recordGraphHostRoot(data.graph, data.globalSubgraph, newRoot: data.rootSubgraph, self)
        
        self.data.graph!.onUpdate { [weak self] in
            fatalError("TODO")
        }
        
        self.data.graph!.onInvalidation { [weak self] attribute in
            fatalError("TODO")
        }
        
        AGGraphSetContext(self.data.graph!, Unmanaged.passUnretained(self).toOpaque())
    }
    
    package func hostKind() -> CustomEventTrace.InstantiationEventType.Kind {
        return .view
    }
    
    package final func addPreference<T: HostPreferenceKey>(_ key: T.Type) {
        Graph.withoutUpdate {
            data.hostPreferenceKeys.add(key)
        }
    }
    
    package final func removePreference<T: HostPreferenceKey>(_ key: T.Type) {
        Graph.withoutUpdate {
            data.hostPreferenceKeys.remove(key)
        }
    }
    
    package final func updateRemovedState() {
        var removedState: GraphHost.RemovedState // w22
        let isRemoved: Bool // w21
        if self.removedState.isEmpty {
            if let parentHost {
                let parentRemovedState = parentHost.removedState
                removedState = parentRemovedState
                isRemoved = parentRemovedState.contains(.unattached)
            } else {
                removedState = []
                isRemoved = false
            }
        } else {
            removedState = .unattached
            isRemoved = true
        }
        
        let isHiddenForReuse = removedState.contains(.hiddenForReuse) // w22
        
        if isRemoved != data.isRemoved {
            if isRemoved {
                data.rootSubgraph.willRemove()
                data.globalSubgraph.removeChild(data.rootSubgraph)
            } else {
                data.globalSubgraph.addChild(data.rootSubgraph)
                data.rootSubgraph.didReinsert()
            }
            data.isRemoved = isRemoved
        }
        
        if isHiddenForReuse != data.isHiddenForReuse {
            data.isHiddenForReuse = isHiddenForReuse
            isHiddenForReuseDidChange()
        }
    }
    
    package func isHiddenForReuseDidChange() {
        // nop
    }
    
    package final func setNeedsUpdate(mayDeferUpdate: Bool, values: ViewGraphRootValues) {
        fatalError("TODO")
    }
    
    package final func flushTransactions() {
        guard data.graph != nil else {
            return
        }
        
        let pendingTransactions = pendingTransactions
        guard !pendingTransactions.isEmpty else {
            return
        }
        
        self.pendingTransactions = []
        
        if let graphDelegate {
            graphDelegate.graphDidChange()
        }
    }
    
    package final func runTransaction() {
        runTransaction(nil, do: {}, id: nil)
    }
    
    package final func runTransaction(_ transaction: Transaction?, do block: () -> Void, id: UInt32?) {
        instantiateIfNeeded()
        
        if let transaction {
            self.data.transaction = transaction
        }
        
        startTransactionUpdate(id: id)
        block()
        
        // x19, #0x10
        let graph = data.graph
        // x23
        let globalSubgraph = data.globalSubgraph
        
        for _ in 0..<8 {
            for continuation in continuations {
                continuation.apply()
            }
            
            // <+296>
            globalSubgraph.update(1)
        }
        
        // <+340>
        if let id {
            CustomEventTrace.transactionEnd(id)
        }
        
        // <+472>
        self.inTransaction = false
        
        if let transaction {
            data.transaction = transaction
        }
    }
    
    package final func updatePreferences() -> Bool {
        let seed: VersionSeed
        if let hostPreferenceValues = hostPreferenceValues.wrappedValue {
            seed = hostPreferenceValues.seed
        } else {
            seed = .empty
        }
        
        let lastHostPreferencesSeed = lastHostPreferencesSeed
        let result = !seed.matches(lastHostPreferencesSeed)
        self.lastHostPreferencesSeed = seed
        return result
    }
    
    package final func graphInvalidation(from attribute: AnyAttribute?) {
        fatalError("TODO")
    }
    
    package final func instantiateIfNeeded() {
        guard !isInstantiated else {
            return
        }
        
        if waitingForPreviewThunks {
            // <+76>
            for graphHost in blockedGraphHosts {
                if graphHost.toOpaque() == Unmanaged.passUnretained(self).toOpaque() {
                    return
                }
            }
            
            // <+172>
            blockedGraphHosts.append(Unmanaged.passUnretained(self))
        } else {
            // <+164>
            instantiate()
            return
        }
    }
    
    package final func startTransactionUpdate(id: UInt32?) {
        self.inTransaction = true
        
        if let id {
            CustomEventTrace.transactionBegin(id)
        }
        
        // <+144>
        data.transactionSeed += 1
    }
    
    package final func instantiate() {
        guard !isInstantiated else {
            return
        }
        
        if let graphDelegate {
            graphDelegate.updateGraph(body: { _ in })
        }
        
        CustomEventTrace.instantiate(root: data.rootSubgraph) { 
            // function signature specialization <Arg[0] = Dead> of static SwiftUI.CustomEventTrace.instantiate<τ_0_0>(root: __C.AGSubgraphRef, closure: () -> τ_0_0) -> τ_0_0.$defer<τ_0_0>() -> ()
            // nop
        }
    }
}

extension GraphHost {
    package struct Data {
        package private(set) var graph: Graph?
        private(set) var globalSubgraph: Subgraph
        private(set) var rootSubgraph: Subgraph
        fileprivate var isRemoved: Bool
        fileprivate(set) var isHiddenForReuse: Bool
        @Attribute var time: Time
        @Attribute private var environment: EnvironmentValues
        @Attribute private var phase: _GraphInputs.Phase
        @Attribute var hostPreferenceKeys: PreferenceKeys
        @Attribute fileprivate var transaction: Transaction
        @Attribute var updateSeed: UInt32
        @Attribute fileprivate var transactionSeed: UInt32
        private var inputs: _GraphInputs
        
        init() {
            let graph = Graph(shared: GraphHost.sharedGraph)
            self.graph = graph
            
            let globalSubgraph = Subgraph(graph: graph)
            self.globalSubgraph = globalSubgraph
            
            let oldCurrentSubgraph = Subgraph.current
            Subgraph.current = globalSubgraph
            
            defer {
                Subgraph.current = oldCurrentSubgraph
                CustomEventTrace.instantiateEnd(globalSubgraph)
            }
            
            CustomEventTrace.instantiateBegin(globalSubgraph)
            
            let time = Attribute(value: Time.zero)
            self._time = time
            
            let environment = Attribute(value: EnvironmentValues())
            CustomEventTrace.recordNamedProperty(.environment, environment)
            self._environment = environment
            
            let phase = Attribute(value: _GraphInputs.Phase())
            self._phase = phase
            self._hostPreferenceKeys = Attribute(value: PreferenceKeys())
            
            let transaction = Attribute(value: Transaction())
            self._transaction = transaction
            
            self._updateSeed = Attribute(value: 0)
            self._transactionSeed = Attribute(value: 0)
            self.inputs = _GraphInputs(
                time: time,
                phase: phase,
                environment: environment,
                transaction: transaction
            )
            
            let subgraph = Subgraph(graph: graph)
            self.rootSubgraph = subgraph
            globalSubgraph.addChild(subgraph)
            
            self.isRemoved = false
            self.isHiddenForReuse = false
        }
    }
}

extension GraphHost {
    struct RemovedState: OptionSet {
        let rawValue: UInt8
        
        static var unattached: GraphHost.RemovedState { GraphHost.RemovedState(rawValue: 1 << 0) }
        static var hiddenForReuse: GraphHost.RemovedState { GraphHost.RemovedState(rawValue: 1 << 1) }
    }
}

protocol GraphMutation {
    func apply()
    func combine<T: GraphMutation>(with other: T) -> Bool
}

fileprivate struct ConstantKey: Hashable {
    
}

fileprivate struct AsyncTransaction {
    private let transaction: Transaction
    private let transactionID: Transaction.ID
    private let traceID: UInt32
    private var mutations: [GraphMutation]
}
