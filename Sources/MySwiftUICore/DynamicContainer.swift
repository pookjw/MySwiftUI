// E7D4CD2D59FB8C77D6C7E9C534464C17
internal import AttributeGraph

struct DynamicContainer {
    static func makeContainer<T: DynamicContainerAdaptor>(adaptor: T, inputs: _ViewInputs) -> (Attribute<DynamicContainer.Info>, _ViewOutputs) {
        /*
         adaptor -> sp + 0xf8 / sp + 0xc0
         inputs -> x20
         */
        // sp + 0x1e0
        let copy_1 = inputs
        
        fatalError("TODO")
    }
}

extension DynamicContainer {
    struct Info {
        private var items: [DynamicContainer.ItemInfo]
        private var indexMap: [UInt32: Int]
        private var displayMap: [UInt32]?
        private var removedCount: Int
        private var unusedCount: Int
        private var allUnary: Bool
        private var seed: UInt32
    }
    
    struct ItemInfo {
        private let subgraph: Subgraph
        private let uniqueId: UInt32
        private let viewCount: Int32
        private let outputs: _ViewOutputs
        private let needsTransitions: Bool
        private var listener: DynamicAnimationListener?
        private var zIndex: Double
        private var removalOrder: UInt32
        private var precedingViewCount: Int32
        private var resetSeed: UInt32
        private var phase: TransitionPhase?
    }
    
    struct _ItemInfo<T: DynamicContainerAdaptor> {
        private var item: T.Item
        private let itemLayout: T.ItemLayout
    }
}

struct DynamicContainerInfo<T: DynamicContainerAdaptor>: StatefulRule, ObservedAttribute, AsyncAttribute, CustomStringConvertible {
    private var adaptor: T
    private let inputs: _ViewInputs
    private let outputs: _ViewOutputs
    private let parentSubgraph: Subgraph
    private var info: DynamicContainer.Info
    private var lastUniqueId: UInt32
    private var lastRemoved: UInt32
    private var lastResetSeed: UInt32
    private var needsPhaseUpdate: Bool
    
    var description: String {
        fatalError("TODO")
    }
    
    init(
        adaptor: T,
        inputs: _ViewInputs,
        outputs: _ViewOutputs,
        info: DynamicContainer.Info,
        lastUniqueId: UInt32,
        lastRemoved: UInt32,
        lastResetSeed: UInt32,
        needsPhaseUpdate: Bool
    ) {
        self.adaptor = adaptor
        self.inputs = inputs
        self.outputs = outputs
        self.parentSubgraph = .current!
        self.info = info
        self.lastUniqueId = lastUniqueId
        self.lastRemoved = lastRemoved
        self.lastResetSeed = lastResetSeed
        self.needsPhaseUpdate = needsPhaseUpdate
    }
    
    typealias Value = DynamicContainer.Info
    
    func updateValue() {
        fatalError("TODO")
    }
    
    func destroy() {
        fatalError("TODO")
    }
}

struct DynamicContainerID {
    private var uniqueId: UInt32
    private var viewIndex: Int32
    
    @inline(__always)
    init(uniqueId: UInt32, viewIndex: Int32) {
        self.uniqueId = uniqueId
        self.viewIndex = viewIndex
    }
}

fileprivate struct DynamicViewContainer<T: DynamicView> {
    private let metadata: T.Metadata
    @Attribute private var view: T
    private let inputs: _ViewInputs
    private let outputs: _ViewOutputs
    private let parentSubgraph: Subgraph
}

extension DynamicViewContainer {
    fileprivate struct Value {
        private var type: any Any.Type
        private var id: T.ID?
        private var subgraph: Subgraph
    }
}

fileprivate class DynamicAnimationListener {
    private weak var viewGraph: ViewGraph?
    private let asyncSignal: AnyWeakAttribute
    private var count: Int
    
    init() {
        fatalError("TODO")
    }
}

fileprivate struct DynamicPreferenceCombiner<T>: Rule, AsyncAttribute, CustomStringConvertible {
    @OptionalAttribute private var info: DynamicContainer.Info?
}
