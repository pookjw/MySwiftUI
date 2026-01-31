// F9F204BD2F8DB167A76F17F3FB1B3335

package import AttributeGraph
private import notify
private import Darwin.POSIX.dlfcn
private import _DarwinFoundation3._stdlib

fileprivate nonisolated(unsafe) var threadAssertionTrace = unsafe Trace(
    unknown_block_1: nil,
    unknown_block_2: nil,
    unknown_block_3: nil,
    willUpdateSubGraph: { _, _, _ in
        Update.assertIsLocked()
    },
    unknown_block_5: nil,
    didUpdateSubGraph: { _, _ in
        Update.assertIsLocked()
    },
    unknown_block_7: nil,
    didUpdateGraph: { _, _ in
        Update.assertIsLocked()
    },
    unknown_block_9: nil,
    willUpdateGraph: { _, _ in
        Update.assertIsLocked()
    },
    unknown_block_11: nil,
    block_12: { _, _, _ in
        Update.assertIsLocked()
        fatalError("TODO: block name")
    },
    unknown_block_13: nil,
    unknown_block_14: nil,
    unknown_block_15: nil,
    unknown_block_16: nil,
    unknown_block_17: nil,
    didCreateGraph: { _, _ in
        Update.assertIsLocked()
    },
    didDestroyGraph: { _, _ in
        Update.assertIsLocked()
    },
    didSetNeedsUpdate: { _, _ in
        Update.assertIsLocked()
    },
    didCreateSubgraph: { _, _ in
        Update.assertIsLocked()
    },
    didInvalidate: { _, _ in
        Update.assertIsLocked()
    },
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
    didInvalidateValue: { _, _ in
        Update.assertIsLocked()
    },
    didAddIndirect: { _, _ in
        Update.assertIsLocked()
    },
    didSetIndirectAttribute: { _, _, _ in
        Update.assertIsLocked()
    },
    didSetIndirect: { _, _, _ in
        Update.assertIsLocked()
    },
    unknown_block_36: nil,
    block_37: { _, _, _, _, _ in
        Update.assertIsLocked()
        fatalError("TODO: block name")
    },
    unknown_block_38: nil,
    unknown_block_39: nil,
    unknown_block_40: nil,
    unknown_block_41: nil,
    unknown_block_42: nil
)

func handleTraceNotification(graph: Graph, token: Int32) {
    let state = unsafe withUnsafeTemporaryAllocation(of: UInt64.self, capacity: 1) { pointer in
        unsafe notify_get_state(token, pointer.baseAddress)
        return unsafe pointer.baseAddress.unsafelyUnwrapped.pointee
    }
    
    guard state == 1 else {
        return
    }
    
    guard let SwiftUITracingSupport = unsafe dlopen("/System/Library/PrivateFrameworks/SwiftUITracingSupport.framework/SwiftUITracingSupport", RTLD_LOCAL) else {
        return
    }
    
    guard unsafe (unsafe dlsym(SwiftUITracingSupport, "swiftUITraceRegister")) != nil else {
        return
    }
    
    Update.locked {
        fatalError("TODO")
    }
}

fileprivate let waitingForPreviewThunks: Bool = {
    guard let value = unsafe getenv("XCODE_RUNNING_FOR_PREVIEWS") else {
        return false
    }
    
    return unsafe atoi(value) != 0
}()

fileprivate nonisolated(unsafe) var blockedGraphHosts: [Unmanaged<GraphHost>] = unsafe []

@_spi(Internal) open class GraphHost {
    @safe fileprivate static nonisolated(unsafe) let sharedGraph: Graph = {
        let graph = Graph()
        let assertLocks = unsafe getenv("SWIFTUI_ASSERT_LOCKS")
        
        if unsafe assertLocks != nil {
            let integer = unsafe atoi(assertLocks)
            if integer != 0 {
                unsafe withUnsafePointer(to: &threadAssertionTrace) { pointer in
                    unsafe graph.setTrace(pointer)
                }
            }
        }
        
        let token: Int32 = unsafe withUnsafeTemporaryAllocation(of: Int32.self, capacity: 1) { outToken in
            unsafe notify_register_dispatch("com.apple.swiftuitrace.state", outToken.baseAddress, .main, { token in
                handleTraceNotification(graph: graph, token: token)
            })
            
            return unsafe outToken.baseAddress.unsafelyUnwrapped.pointee
        }
        
        handleTraceNotification(graph: graph, token: token)
        
        return graph
    }() 
    
    static var isUpdating: Bool {
        return GraphHost.sharedGraph.counter(options: [.unknown0, .unknown1, .unknown2]) != 0
    }
    
    static var currentHost: GraphHost {
        let graph: Graph?
        if let currentAttribute = AnyAttribute.current {
            // <+84>
            graph = currentAttribute.graph
        } else {
            if let subgraph = Subgraph.current {
                graph = subgraph.graph
            } else {
                graph = nil
            }
        }
        
        guard let context = unsafe graph?.context else {
            fatalError("no current graph host")
        }
        
        return unsafe unsafeBitCast(context, to: GraphHost.self)
    }
    
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
    final var hostPreferenceValues: WeakAttribute<PreferenceValues>
    private var lastHostPreferencesSeed: VersionSeed
    private var pendingTransactions: [AsyncTransaction]
    private var inTransaction: Bool
    private var continuations: [any GraphMutation]
    package private(set) nonisolated final var mayDeferUpdate: Bool
    private(set) var removedState: GraphHost.RemovedState
    
    final var isValid: Bool {
        return data.graph != nil
    }
    
    final var hasPendingTransactions: Bool {
        return !pendingTransactions.isEmpty
    }
    
    final var isUpdating: Bool {
        guard let graph = data.graph else {
            return false
        }
        
        return (graph.counter(options: [.unknown1, .unknown2]) != 0)
    }
    
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
            guard let self else {
                return
            }
            
            guard let graphDelegate = self.graphDelegate else {
                return
            }
            
            graphDelegate.updateGraph { _ in }
        }
        
        self.data.graph!.onInvalidation { [weak self] attribute in
            fatalError("TODO")
        }
        
        unsafe self.data.graph!.context = unsafe UnsafeRawPointer(Unmanaged.passUnretained(self).toOpaque())
    }
    
    deinit {
        invalidate()
        unsafe blockedGraphHosts.removeAll { unsafe $0.takeUnretainedValue() === self }
    }
    
    final func invalidate() {
        if isInstantiated {
            data.globalSubgraph.willInvalidate(isInserted: false)
            isInstantiated = false
        }
        
        data.invalidate()
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
        var removedState = self.removedState // w22
        let isRemoved: Bool // w21
        if removedState.isEmpty {
            if let parentHost {
                let parentRemovedState = parentHost.removedState
                removedState = parentRemovedState
                isRemoved = parentRemovedState.contains(.unattached)
            } else {
                removedState = []
                isRemoved = false
            }
        } else {
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
        /*
         self = x20
         mayDeferUpdate = x21
         values = x19
         */
        self.mayDeferUpdate = (self.mayDeferUpdate && mayDeferUpdate)
        
        guard let graph = data.graph else {
            return
        }
        
        CustomEventTrace.setNeedsUpdate(values: values, graph: graph)
        graph.setNeedsUpdate()
    }
    
    package final func flushTransactions() {
        guard isValid else {
            return
        }
        
        let pendingTransactions = pendingTransactions
        guard !pendingTransactions.isEmpty else {
            return
        }
        
        self.pendingTransactions = []
        
        for pendingTransaction in pendingTransactions {
            let transaction = pendingTransaction.transaction
            
            runTransaction(
                transaction,
                do: { 
                    // $s7SwiftUI15withTransactionyxAA0D0V_xyKXEtKlFxyKXEfU_yt_Tg503$s7A74UI16AsyncTransaction33_F9F204BD2F8DB167A76F17F3FB1B3335LLV5applyyyFyyXEfU_AA0gD001_ijklmnopqR0LLVTf1nnc_n
                    withTransaction(transaction) {
                        for mutation in pendingTransaction.mutations {
                            mutation.apply()
                        }
                    }
                },
                id: pendingTransaction.traceID
            )
        }
        
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
        
        // inlined
        self.finishTransactionUpdate(in: data.globalSubgraph, id: id)
        
        if let transaction, transaction.isEmpty {
            data.transaction = Transaction()
        }
    }
    
    @inline(__always)
    package final func finishTransactionUpdate(in subgraph: Subgraph, postUpdate: (Bool) -> Void = { _ in }, id: UInt32?) {
        var i = 0
        while true {
            let continuations = self.continuations
            self.continuations = []
            
            for continuation in continuations {
                continuation.apply()
            }
            
            i &+= 1
            subgraph.update(1)
            postUpdate(!self.continuations.isEmpty)
            
            if i == 8 {
                break
            }
            
            if self.continuations.isEmpty{
                break
            }
        }
        
        if let id {
            CustomEventTrace.transactionEnd(id)
        }
        
        self.inTransaction = false
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
            for unsafe graphHost in unsafe blockedGraphHosts {
                if unsafe graphHost == Unmanaged.passUnretained(self) {
                    return
                }
            }
            
            // <+172>
            unsafe blockedGraphHosts.append(Unmanaged.passUnretained(self))
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
        data.transactionSeed &+= 1
    }
    
    package final func instantiate() {
        guard !isInstantiated else {
            return
        }
        
        if let graphDelegate {
            graphDelegate.updateGraph(body: { _ in })
        }
        
        CustomEventTrace.instantiate(root: data.rootSubgraph) { 
            instantiateOutputs()
        }
        
        isInstantiated = true
    }
    
    package func instantiateOutputs() {
        // nop
    }
    
    package func uninstantiateOutputs() {
        // nop
    }
    
    package final func preferenceValues() -> PreferenceValues {
        instantiateIfNeeded()
        
        if let values = hostPreferenceValues.wrappedValue {
            return values
        } else {
            return PreferenceValues()
        }
    }
    
    @discardableResult
    final func asyncTransaction<T>(
        _ transaction: Transaction = Transaction(),
        id: Transaction.ID = Transaction.id,
        invalidating: WeakAttribute<T>,
        style: _GraphMutation_Style = .deferred,
        mayDeferUpdate: Bool = true
    ) -> UInt32 {
        fatalError("TODO")
    }
    
    @discardableResult
    final func asyncTransaction(
        _ transaction: Transaction = Transaction(),
        id: Transaction.ID = Transaction.id,
        _ body: () -> Void
    ) -> UInt32 {
        fatalError("TODO")
    }
    
    @discardableResult
    package final func asyncTransaction<T>(
        _ transaction: Transaction = Transaction(),
        id: Transaction.ID = Transaction.id,
        setting target: WeakAttribute<T>,
        to newValue: T,
        style: _GraphMutation_Style = .deferred,
        mayDeferUpdate: Bool = true
    ) -> UInt32 {
        return asyncTransaction(
            transaction,
            id: id,
            mutation: AssignmentGraphMutation(target, newValue: newValue),
            style: style,
            mayDeferUpdate: mayDeferUpdate
        )
    }
    
    @discardableResult
    package final func asyncTransaction<T: GraphMutation>(
        _ transaction: Transaction = Transaction(),
        id: Transaction.ID = Transaction.id,
        mutation: T,
        style: _GraphMutation_Style = .deferred,
        mayDeferUpdate: Bool = true
    ) -> UInt32 {
        /*
         transaction = x24
         id = w19
         mutation = x25
         style = w26
         mayDeferUpdate = x20
         T = x23
         ?? = x22
         
         self = x21
         */
        return Update.locked {
            guard let graph = data.graph else {
                return 0
            }
            
            let w22: Bool
            switch style {
            case .immediate:
                w22 = (graph.counter(options: [.unknown1, .unknown2]) != 0)
            case .deferred:
                w22 = true
            }
            
            self.mayDeferUpdate = (self.mayDeferUpdate && mayDeferUpdate)
            
            // x26
            var pendingTransactions = pendingTransactions
            
            let count = pendingTransactions.count
            if count != 0 {
                /*
                 true = <+440>
                 false = <+708>
                 */
                let flag: Bool
                
                var lastTransaction = pendingTransactions[count - 1]
                if lastTransaction.transactionID == id {
                    if lastTransaction.transaction.isEmpty {
                        if transaction.isEmpty {
                            // <+440>
                            flag = true
                        } else {
                            // <+708>
                            flag = false
                        }
                    } else {
                        if transaction.isEmpty {
                            // <+708>
                            flag = false
                        } else {
                            // <+328>
                            if transaction.mayConcatenate(with: lastTransaction.transaction) {
                                // <+440>
                                flag = true
                            } else {
                                // <+708>
                                flag = false
                            }
                        }
                    }
                } else {
                    // <+708>
                    flag = false
                }
                
                if flag {
                    // <+440>
                    lastTransaction.append(mutation)
                    CustomEventTrace.transactionAppend(lastTransaction.traceID)
                    pendingTransactions[count - 1] = lastTransaction
                    self.pendingTransactions = pendingTransactions
                    
                    if !w22 {
                        // <+588>
                        self.pendingTransactions.removeLast()
                        flushTransactions()
                        self.pendingTransactions.append(lastTransaction)
                    }
                    return lastTransaction.traceID
                } else {
                    // <+708>
                    if w22 {
                        flushTransactions()
                    }
                    // <+736>
                }
            } else {
                // <+648>
                if let graphDelegate {
                    graphDelegate.beginTransaction()
                }
                
                // <+736>
            }
            
            // <+736>
            let asyncTransaction = AsyncTransaction(transaction: transaction, transactionID: id, mutations: [mutation])
            pendingTransactions.append(asyncTransaction)
            self.pendingTransactions = pendingTransactions
            CustomEventTrace.transactionEnqueue(asyncTransaction.traceID)
            return asyncTransaction.traceID
        }
    }
    
    final func intern<T>(_ value: T, for type: Any.Type = T.self, id: GraphHost.ConstantID) -> Attribute<T> {
        /*
         self = x19
         value = x23
         type = x22
         id = x21
         */
        // x20
        let constants = constants
        
        if isValid {
            let key = ConstantKey(type: type, id: id)
            if let value = constants[key] {
                return Attribute(identifier: value)
            }
        }
        
        // <+120>
        let attribute = data.globalSubgraph.apply { 
            Attribute(value: value)
        }
        self.constants[ConstantKey(type: type, id: id)] = attribute.identifier
        return attribute
    }
    
    @discardableResult
    package final func emptyTransaction(_ transaction: Transaction = Transaction()) -> UInt32 {
        fatalError("TODO")
    }
    
    @inline(__always)
    var environment: EnvironmentValues {
        return data.environment
    }
    
    final func continueTransaction<T: GraphMutation>(_: T) {
        fatalError("TODO")
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
        @Attribute var environment: EnvironmentValues
        @Attribute var phase: _GraphInputs.Phase
        @Attribute var hostPreferenceKeys: PreferenceKeys
        @Attribute fileprivate var transaction: Transaction
        @Attribute var updateSeed: UInt32
        @Attribute fileprivate var transactionSeed: UInt32
        private(set) var inputs: _GraphInputs
        
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
        
        mutating func invalidate() {
            guard let graph else {
                return
            }
            
            Update.ensure {
                globalSubgraph.invalidate()
                unsafe graph.context = nil
                graph.invalidate()
                self.graph = nil
            }
        }
    }
    
    enum ConstantID: Int8, Hashable {
        case defaultValue
        case implicitViewRoot
        case trueValue
        case defaultValue3D
        case failedValue
        case placeholder
        case preferenceKeyDefault
    }
}

extension GraphHost {
    struct RemovedState: OptionSet {
        let rawValue: UInt8
        
        static var unattached: GraphHost.RemovedState { GraphHost.RemovedState(rawValue: 1 << 0) }
        static var hiddenForReuse: GraphHost.RemovedState { GraphHost.RemovedState(rawValue: 1 << 1) }
    }
}

package protocol GraphMutation {
    func apply()
    func combine<T: GraphMutation>(with other: T) -> Bool
}

struct InvalidatingGraphMutation: GraphMutation {
    let attribute: AnyWeakAttribute
    
    func apply() {
        fatalError("TODO")
    }
    
    func combine<T>(with other: T) -> Bool where T : GraphMutation {
        fatalError("TODO")
    }
}

struct AssignmentGraphMutation<T>: GraphMutation {
    private var target: WeakAttribute<T>?
    private var newValue: T
    
    init(_ target: WeakAttribute<T>?, newValue: T) {
        self.target = target
        self.newValue = newValue
    }
    
    func apply() {
        target?.projectedValue?.value = newValue
    }
    
    func combine<U>(with other: U) -> Bool where U : GraphMutation {
        fatalError("TODO")
    }
}

fileprivate struct ConstantKey: Hashable {
    static func == (lhs: ConstantKey, rhs: ConstantKey) -> Bool {
        return (lhs.type == rhs.type) && (lhs.id == rhs.id)
    }
    
    private var type: Any.Type
    private var id: GraphHost.ConstantID
    
    init(type: Any.Type, id: GraphHost.ConstantID) {
        self.type = type
        self.id = id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(type))
        hasher.combine(id)
    }
}

fileprivate struct AsyncTransaction {
    @safe static nonisolated(unsafe) var nextTraceID: UInt32 = 1
    
    fileprivate let transaction: Transaction
    fileprivate let transactionID: Transaction.ID
    fileprivate let traceID: UInt32
    fileprivate private(set) var mutations: [any GraphMutation]
    
    init(transaction: Transaction, transactionID: Transaction.ID, mutations: [any GraphMutation]) {
        self.transaction = transaction
        self.transactionID = transactionID
        
        self.traceID = (AsyncTransaction.nextTraceID &>> 1) + 1
        AsyncTransaction.nextTraceID &+= 2
        self.mutations = mutations
    }
    
    mutating func append<T: GraphMutation>(_ mutation: T) {
        mutations.append(mutation)
    }
}

package enum _GraphMutation_Style: Hashable {
    case immediate
    case deferred
}
