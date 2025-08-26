#warning("TODO")
internal import AttributeGraph
private import notify

fileprivate nonisolated(unsafe) let threadAssertionTrace = AGTraceType(
    block_1: { _, _, _ in fatalError("TODO") },
    block_2: { _, _ in fatalError("TODO") },
    block_3: { _, _ in fatalError("TODO") },
    block_4: { _, _ in fatalError("TODO") },
    block_5: { _, _, _ in fatalError("TODO") },
    block_6: { _, _, _, _, _ in fatalError("TODO") },
    block_7: { _, _ in fatalError("TODO") },
    block_8: { _, _ in fatalError("TODO") },
    block_9: { _, _ in fatalError("TODO") },
    block_10: { _, _ in fatalError("TODO") },
    block_11: { _, _ in fatalError("TODO") },
    block_12: { _, _ in fatalError("TODO") },
    block_13: { _, _, _ in fatalError("TODO") },
    block_14: { _, _ in fatalError("TODO") },
    block_15: { _, _ in fatalError("TODO") },
    block_16: { _, _, _ in fatalError("TODO") },
    block_17: { _, _, _ in fatalError("TODO") }
)

func handleTraceNotification(graph: Graph, token: Int32) {
    fatalError("TODO")
}

package class GraphHost {
    fileprivate static nonisolated(unsafe) let sharedGraph: Graph = {
        let graph = Graph()
        // original : "SWIFTUI_ASSERT_LOCKS"
        let assertLocks = getenv("MYSWIFTUI_ASSERT_LOCKS")
        
        if assertLocks != nil {
            let integer = atoi(assertLocks)
            if integer != 0 {
                graph.setTrace(threadAssertionTrace, threadAssertionTrace)
            }
        }
        
        let (token, _): (Int32, UInt32) = withUnsafeTemporaryAllocation(of: Int32.self, capacity: 1) { outToken in
            let result = notify_register_dispatch("com.apple.swiftuitrace.state", outToken.baseAddress, .main, { _ in
                fatalError("TODO")
            })
            
            return (outToken.baseAddress.unsafelyUnwrapped.pointee, result)
        }
        
        handleTraceNotification(graph: graph, token: token)
        
        return graph
    }() 
    
    private var data: GraphHost.Data
    private var constants: [ConstantKey: AnyAttribute]
    private var isInstantiated: Bool
    private var hostPreferenceValues: WeakAttribute<PreferenceValues>
    private var lastHostPreferencesSeed: VersionSeed
    private var pendingTransactions: [AsyncTransaction]
    private var inTransaction: Bool
    private var continuations: [any GraphMutation]
    private var mayDeferUpdate: Bool
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
        
        if
            CustomEventCategory.enabledCategories[Int(CustomEventCategory.dynamicProperties.rawValue)],
            let recorder = CustomEventTrace.recorder
        {
            // TODO: 검증 필요
            let pointer = unsafeBitCast(recorder.cefOp.pointee, to: UnsafeMutablePointer<UInt16>.self)
                .advanced(by: 4)
            
            pointer.pointee = 0x4143
            
            withUnsafeTemporaryAllocation(of: UInt8.self, capacity: 1) { pointer in
                AGGraphAddTraceEvent(recorder.graph, recorder.cefOp, pointer.baseAddress.unsafelyUnwrapped, nil)
            }
        }
        
        self.data.graph!.onUpdate { [weak self] in
            fatalError("TODO")
        }
        
        self.data.graph!.onInvalidation { [weak self] attribute in
            fatalError("TODO")
        }
        
        AGGraphSetContext(self.data.graph!, Unmanaged.passUnretained(self).toOpaque())
    }
    
    package func addPrefence<T: HostPreferenceKey>(_ key: T.Type) {
        fatalError("TODO")
    }
}

extension GraphHost {
    struct Data {
        var graph: Graph?
        var globalSubgraph: Subgraph?
        private var rootSugraph: Subgraph?
        private var isRemoved: Bool
        private var isHiddenForReuse: Bool
        @Attribute private var time: Time
        @Attribute private var environment: EnvironmentValues
        @Attribute private var phase: _GraphInputs.Phase
        @Attribute private var hostPreferenceKeys: PreferenceKeys
        @Attribute private var transaction: Transaction
        @Attribute private var updateSeed: UInt32
        @Attribute private var transactionSeed: UInt32
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
                
                if
                    CustomEventCategory.enabledCategories[Int(CustomEventCategory.dynamicProperties.rawValue)],
                    let recorder = CustomEventTrace.recorder
                {
                    // TODO: 검증 필요
                    let pointer = unsafeBitCast(recorder.cefOp.pointee, to: UnsafeMutablePointer<UInt16>.self)
                        .advanced(by: 4)
                    
                    pointer.pointee = 0x4343
                    
                    let subgraphPointer = UnsafeMutableRawPointer(pointer)
                        .assumingMemoryBound(to: Subgraph?.self)
                    subgraphPointer.pointee = globalSubgraph
                    subgraphPointer.advanced(by: 1).pointee = globalSubgraph
                    
                    withUnsafeTemporaryAllocation(of: UInt8.self, capacity: 1) { pointer in
                        AGGraphAddTraceEvent(recorder.graph, recorder.cefOp, pointer.baseAddress.unsafelyUnwrapped, nil)
                    }
                }
            }
            
            if
                CustomEventCategory.enabledCategories[Int(CustomEventCategory.dynamicProperties.rawValue)],
                let recorder = CustomEventTrace.recorder
            {
                // TODO: 검증 필요
                unsafeBitCast(recorder.cefOp.pointee, to: UnsafeMutablePointer<UInt16>.self)
                    .advanced(by: 4)
                    .pointee = 0x4243
                
                withUnsafeTemporaryAllocation(of: UInt8.self, capacity: 1) { pointer in
                    AGGraphAddTraceEvent(recorder.graph, recorder.cefOp, pointer.baseAddress.unsafelyUnwrapped, nil)
                }
            }
            
            let time = Attribute(value: Time.zero)
            self._time = time
            
            let environment = Attribute(value: EnvironmentValues())
            if
                CustomEventCategory.enabledCategories[Int(CustomEventCategory.dynamicProperties.rawValue)],
                let recorder = CustomEventTrace.recorder
            {
                // TODO: 검증 필요
                unsafeBitCast(recorder.cefOp.pointee, to: UnsafeMutablePointer<UInt16>.self)
                    .advanced(by: 4)
                    .pointee = 0x4643
                
                withUnsafeTemporaryAllocation(of: UInt8.self, capacity: 1) { pointer in
                    AGGraphAddTraceEvent(recorder.graph, recorder.cefOp, pointer.baseAddress.unsafelyUnwrapped, nil)
                }
            }
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
            globalSubgraph.addChild(subgraph)
            
            self.isRemoved = false
            self.isHiddenForReuse = false
        }
    }
}

extension GraphHost {
    struct RemovedState {
        let rawValue: UInt8
    }
}

protocol GraphMutation {
}

fileprivate struct ConstantKey: Hashable {
    
}

fileprivate struct AsyncTransaction {
    
}

enum CustomEventCategory: Int8 {
    fileprivate static nonisolated(unsafe) var enabledCategories: [Bool] = Array(repeating: false, count: 256)
    
    static func setEnabledCategory(_ category: CustomEventCategory, enabled: Bool) {
        enabledCategories[Int(category.rawValue)] = enabled
    }
    
    case unknown = 0
    case observable = 79
    case transaction = 84
    case action = 65
    case graph = 71
    case animation = 66
    case instantiation = 67
    case dynamicProperties = 68
}
