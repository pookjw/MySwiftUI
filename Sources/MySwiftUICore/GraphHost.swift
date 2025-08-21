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

func handleTraceNotification(graph: AGGraphRef, token: Int32) {
    fatalError("TODO")
}

package class GraphHost {
    fileprivate static nonisolated(unsafe) let sharedGraph: AGGraphRef = {
        let graph = AGGraphCreate()
        // original : "SWIFTUI_ASSERT_LOCKS"
        let assertLocks = getenv("MYSWIFTUI_ASSERT_LOCKS")
        
        if assertLocks != nil {
            let integer = atoi(assertLocks)
            if integer != 0 {
                AGGraphSetTrace(graph, threadAssertionTrace)
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
    private var constants: [ConstantKey: AGAttribute]
    private var isInstantiated: Bool
    private var hostPreferenceValues: WeakAttribute<PreferenceValues>
    private var lastHostPreferencesSeed: VersionSeed
    private var pendingTransactions: [AsyncTransaction]
    private var inTransaction: Bool
    private var continuations: [any GraphMutation]
    private var mayDeferUpdate: Bool
    private var removedState: GraphHost.RemovedState
    
    init(data: GraphHost.Data) {
        fatalError("TODO")
    }
    
    package func addPrefence<T: HostPreferenceKey>(_ key: T.Type) {
        fatalError("TODO")
    }
}

extension GraphHost {
    struct Data {
        private var graph: AGGraphRef?
        private var globalSubgraph: AGSubgraphRef?
        private var rootSugraph: AGSubgraphRef?
        private var isRemoved: Bool
        private var isHiddenForReuse: Bool
        @Attribute private var time: Time
        @Attribute private var environment: EnvironmentValues
        @Attribute private var phase: _GraphInputs.Phase
        @Attribute private var hostPreferenceKeys: PreferenceKeys
        @Attribute private var transaction: Transaction
        @Attribute private var updateSeed: UInt32
        @Attribute private var transactionSeed: UInt32
        @Attribute private var inputs: _GraphInputs
        
        init() {
            self.graph = AGGraphCreateShared()
            
            let globalSubgraph = AGSubgraphCreate()
            self.globalSubgraph = globalSubgraph
            
            let oldCurrentSubgraph = AGSubgraphGetCurrent()
            AGSubgraphSetCurrent(globalSubgraph)
            
            
            
            fatalError("TODO")
        }
    }
}

extension GraphHost {
    struct RemovedState {
        
    }
}

protocol GraphMutation {
}

fileprivate struct ConstantKey: Hashable {
    
}

fileprivate struct AsyncTransaction {
    
}

enum CustomEventCategory: Int8 {
    fileprivate static nonisolated(unsafe) var enabledCategories: [Bool] = Array(repeating: false, count: 32)
    
    static func setEnabledCategory(_ category: CustomEventCategory, enabled: Bool) {
        enabledCategories[Int(category.rawValue)] = enabled
    }
    
    case unknown
    case observable
    case transaction
    case action
    case graph
    case animation
    case instantiation
    case dynamicProperties
}
