#warning("TODO")
internal import AttributeGraph
private import notify
private import Darwin.POSIX.dlfcn

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
    block_33: { _, _ in fatalError("TODO") },
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

package class GraphHost {
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
