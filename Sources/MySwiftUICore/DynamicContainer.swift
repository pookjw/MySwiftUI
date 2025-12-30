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
        // sp + 0x128
        var outputs = _ViewOutputs()
        
        for key in inputs.preferences.keys {
            func project<Key: PreferenceKey>(_ type: Key.Type) {
                let combiner = DynamicPreferenceCombiner<Key>()
                outputs[type] = Attribute(combiner)
            }
            project(key)
        }
        
        // <+568>
        // adaptor -> x22
        // sp + 0x180
        let copy_2 = copy_1
        // sp + 0x110
        let copy_3 = outputs
        // sp + 0x138
        let info = DynamicContainer.Info(
            items: [],
            indexMap: [:],
            displayMap: nil,
            removedCount: 0,
            unusedCount: 0,
            allUnary: true,
            seed: 0
        )
        // sp + 0x20
        let containerInfo = DynamicContainerInfo(
            adaptor: adaptor,
            inputs: copy_2,
            outputs: copy_3,
            info: info,
            lastUniqueId: 0,
            lastRemoved: 0,
            lastResetSeed: .max,
            needsPhaseUpdate: false
        )
        
        // <+756>
        // sp + 0x1a0
        _ = copy_1
        let attribute = Attribute(containerInfo)
        _ = consume containerInfo
        
        attribute.flags = .unknown0
        
        // <+964>
        copy_3.forEachPrefence { key, other in
            // $s7SwiftUI16DynamicContainerV04makeD07adaptor6inputs14AttributeGraph0H0VyAC4InfoVG_AA12_ViewOutputsVtx_AA01_K6InputsVtAA0cD7AdaptorRzlFZyAA13PreferenceKey_pXp_So11AGAttributeatXEfU_
            func project<Key: PreferenceKey>(_ type: Key.Type) {
                other.mutateBody(as: DynamicPreferenceCombiner<Key>.self, invalidating: true) { combiner in
                    combiner.$info = attribute
                }
            }
            project(key)
        }
        
        return (attribute, copy_3)
    }
}

extension DynamicContainer {
    struct Info {
        var items: [DynamicContainer.ItemInfo]
        private(set) var indexMap: [UInt32: Int]
        private(set) var displayMap: [UInt32]?
        private(set) var removedCount: Int
        private(set) var unusedCount: Int
        private(set) var allUnary: Bool
        private(set) var seed: UInt32
    }
    
    class ItemInfo {
        private let subgraph: Subgraph
        private let uniqueId: UInt32
        private let viewCount: Int32
        private let outputs: _ViewOutputs
        let needsTransitions: Bool
        private var listener: DynamicAnimationListener? = nil
        fileprivate var zIndex: Double = 0
        private var removalOrder: UInt32 = 0
        private var precedingViewCount: Int32 = 0
        private var resetSeed: UInt32 = 0
        var phase: TransitionPhase? = nil
        
        init(subgraph: Subgraph, uniqueId: UInt32, viewCount: Int32, phase: TransitionPhase, needsTransitions: Bool, outputs: _ViewOutputs) {
            self.subgraph = subgraph
            self.uniqueId = uniqueId
            self.viewCount = viewCount
            self.outputs = outputs
            self.needsTransitions = needsTransitions
            self.phase = phase
        }
        
        func `for`<T: DynamicContainerAdaptor>(_ type: T.Type) -> DynamicContainer._ItemInfo<T> {
            return unsafeBitCast(self, to: DynamicContainer._ItemInfo<T>.self)
        }
    }
    
    final class _ItemInfo<T: DynamicContainerAdaptor>: DynamicContainer.ItemInfo {
        fileprivate var item: T.Item
        private let itemLayout: T.ItemLayout
        
        init(
            item: T.Item,
            itemLayout: T.ItemLayout,
            subgraph: Subgraph,
            uniqueId: UInt32,
            viewCount: Int32,
            phase: TransitionPhase,
            needsTransitions: Bool,
            outputs: _ViewOutputs
        ) {
            self.item = item
            self.itemLayout = itemLayout
            super.init(subgraph: subgraph, uniqueId: uniqueId, viewCount: viewCount, phase: phase, needsTransitions: needsTransitions, outputs: outputs)
        }
    }
}

struct DynamicContainerInfo<T: DynamicContainerAdaptor>: StatefulRule, ObservedAttribute, AsyncAttribute, CustomStringConvertible {
    private var adaptor: T
    private let inputs: _ViewInputs
    private let outputs: _ViewOutputs
    private let parentSubgraph: Subgraph // 0x68
    private var info: DynamicContainer.Info // 0x70
    private var lastUniqueId: UInt32 // 0xa0
    private var lastRemoved: UInt32 // 0xa4
    private var lastResetSeed: UInt32 // 0xa8
    private var needsPhaseUpdate: Bool //0xac
    
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
    
    mutating func updateValue() {
        // self -> sp + 0x60
        let resetSeed = inputs.viewPhase.value.resetSeed
        let needsReset = (resetSeed != lastResetSeed)
        // w23
        let disableTransitions: Bool
        if needsReset {
            lastResetSeed = resetSeed
            disableTransitions = true
        } else {
            disableTransitions = inputs.animationsDisabled
        }
        
        // sp + 0x58
        var flag_1: Bool
        if needsPhaseUpdate {
            // <+176>
            flag_1 = false
            for item in info.items {
                if case .willAppear = item.phase {
                    // <+356>
                    flag_1 = true
                    item.phase = .identity
                }
            }
            needsPhaseUpdate = false
        } else {
            flag_1 = false
        }
        
        // <+556>
        // w27
        let (changed, hasDepth) = updateItems(disableTransitions: disableTransitions)
        
        var flag_2: Bool // false -> <+976>, true -> <+852>
        if changed {
            flag_2 = true
        } else {
            // <+576>
            let indices = info.items.indices
            for index in indices.reversed() {
                // <+652>
                let item = info.items[index]
                // w25
                let phase = item.phase
                
                // <+732>
                if case .didDisappear = phase {
                    // <+620>
                    let removed = tryRemovingItem(at: index, disableTransitions: disableTransitions)
                    if removed {
                        flag_1 = true
                    }
                } else if phase == nil {
                    continue
                } else {
                    break
                }
            }
            
            // <+840>
            flag_2 = flag_1
        }
        
        if flag_2 {
            // <+852>
            // (changed, hasDepth) -> sp + 0x20
            // x0
            let itemsCount = info.items.count
            // x8
            let removedCount = info.removedCount
            // x9 -> sp + 0x28
            let unusedCount = info.unusedCount
            // x26
            let tmp_1 = itemsCount &- unusedCount
            // removedCount -> sp + 0x40
            // x23
            let _ = tmp_1 &- removedCount
            // itemsCount -> sp + 0x30
            
            // <+940>
            fatalError("TODO")
        } else {
            // <+976>
            if !info.items.isEmpty || !hasValue {
                // <+3636>
                value = info
            }
            
            // <+3716>
            return
        }
    }
    
    func destroy() {
        fatalError("TODO")
    }
    
    mutating func makeItem(_ item: T.Item, uniqueId: UInt32, container: Attribute<DynamicContainer.Info>, disableTransitions: Bool) -> DynamicContainer.ItemInfo {
        /*
         self -> x27
         item -> x24
         uniqueId -> sp + 0x10
         container -> sp + 0x14
         disableTransitions -> x21
         */
        // sp + 0xc
        let needsTransitions = item.needsTransitions
        // w26
        var phase = TransitionPhase.identity
        if !disableTransitions, needsTransitions {
            let attribute = AnyWeakAttribute(AGGraphGetCurrentAttribute())
            GraphHost.currentHost.continueTransaction(InvalidatingGraphMutation.init(attribute: attribute))
            phase = .willAppear
            needsPhaseUpdate = true
        }
        
        // <+232>
        // x21
        let parentSubgraph = parentSubgraph
        // x28
        let graph = parentSubgraph.graph
        let list = item.list
        // x19
        let newSubgraph = graph.createSubgraph2(list?.identifier ?? .empty)
        parentSubgraph.addChild(newSubgraph)
        
        return newSubgraph.apply {
            // $s7SwiftUI20DynamicContainerInfoV8makeItem_8uniqueId9container18disableTransitionsAA0cD0V0gE0C0G0Qz_s6UInt32V14AttributeGraph0N0VyAI0E0VGSbtFAKyXEfU0_
            /*
             self -> x0 -> x26
             item -> x1 -> sp + 0x40
             uniqueId -> w2 -> sp + 0x7c
             container -> w3 -> sp + 0x34
             newSubgraph -> x4 -> sp + 0x58
             phase -> x5 -> sp + 0x24
             needsTransitions -> w6 -> sp + 0x20
             */
            // sp + 0x190
            let copy_1 = self.inputs
            // sp + 0x140
            let copy_2 = self.inputs
            // sp + 0x1f0
            let cachedEnvironment = self.inputs.base.cachedEnvironment.value
            // x28
            let copy_3 = MutableBox(self.inputs.base.cachedEnvironment.value)
            // sp + 0xb0
            _ = copy_1
            // sp + 0xb0
            let copy_4 = cachedEnvironment
            // x20
            let copy_5 = self
            
            // <+592>
            /*
             copy_3 -> sp + 0x18
             */
            // sp + 0x260
            var copy_6 = copy_2
            copy_6.base.cachedEnvironment = copy_3 // sp + 0x270
            // sp + 0xb0
            let copy_7 = copy_6
            // sp + 0x2c0
            let copy_8 = copy_6
            
            let (outptus, itemLayout) = copy_5.adaptor.makeItemLayout(item: item, uniqueId: uniqueId, inputs: copy_7, containerInfo: container) { inputs in
                // $s7SwiftUI20DynamicContainerInfoV8makeItem_8uniqueId9container18disableTransitionsAA0cD0V0gE0C0G0Qz_s6UInt32V14AttributeGraph0N0VyAI0E0VGSbtFAKyXEfU0_yAA11_ViewInputsVzXEfU_TA
                inputs.base.transaction = Attribute(
                    DynamicTransaction(
                        info: container,
                        transaction: inputs.base.transaction,
                        uniqueId: uniqueId,
                        wasRemoved: false
                    )
                )
                
                inputs.base.phase = Attribute(
                    DynamicViewPhase(
                        info: container,
                        phase: inputs.base.phase,
                        uniqueId: uniqueId
                    )
                )
                
                if !inputs.base.changedDebugProperties.contains(.phase) {
                    inputs.base.changedDebugProperties.formUnion(.phase)
                }
            }
            
            // <+744>
            // sp = sp + 0x10
            
            // x29 - 0xd0
            _ = copy_7
            
            /*
             item -> x20
             */
            // x19 + 0x50
            let copy_9 = item
            let count = item.count
            
            let itemInfo = DynamicContainer._ItemInfo<T>(
                item: copy_9,
                itemLayout: itemLayout,
                subgraph: newSubgraph,
                uniqueId: uniqueId,
                viewCount: Int32(count),
                phase: phase,
                needsTransitions: needsTransitions,
                outputs: outptus
            )
            
            return itemInfo
        }
    }
    
    func tryRemovingItem(at index: Int, disableTransitions: Bool) -> Bool {
        fatalError("TODO")
    }
    
    fileprivate mutating func updateItems(disableTransitions: Bool) -> (changed: Bool, hasDepth: Bool) {
        /*
         self -> x19
         disableTransitions -> sp + 0x4c
         */
        // <+240>
        // sp + 0xa6
        var (changed, hasDepth) = (false, false)
        // x28
        if let items = adaptor.updatedItems() {
            // <+340>
            // x25
            let copy_1 = items
            // disableTransitions -> w28
            
            var x29_0x78 = 0
            var x29_0x80 = info.items.count
            // (x29, #0x78) (x29, #0x80) self, copy_1, disableTransitions, (changed, hasDepth)
            adaptor.foreachItem(items: copy_1) { item in
                /*
                 item -> sp + 0x88
                 x29_0x78 -> x1 -> x19 -> sp + 0x40
                 x29_0x80 -> x2 -> x23 -> sp + 0x38
                 self -> x3
                 copy_1 -> x5 -> sp + 0x10
                 disableTransitions -> w6 -> sp + 0xc
                 (changed, hasDepth) -> x4/x7 -> sp + 0x18 / sp + 0x20
                 */
                // $s7SwiftUI20DynamicContainerInfoV11updateItems33_E7D4CD2D59FB8C77D6C7E9C534464C17LL18disableTransitionsSb7changed_Sb8hasDepthtSb_tFy4ItemQzXEfU_
                var sp60 = -1
                
                // true = <+1896>
                var flag = false
                
                // x19
                for index in x29_0x78..<x29_0x80 {
                    // <+564>
                    // x26
                    let info = info.items[index].for(T.self)
                    let matches = item.matchesIdentity(of: info.item)
                    if matches {
                        // <+1348>
                        if x29_0x78 != index {
                            self.info.items.swapAt(x29_0x78, index)
                            changed = true
                        }
                        
                        // <+1404>
                        info.item = item
                        
                        if info.phase != .identity {
                            // <+1852>
                            unremoveItem(at: x29_0x78)
                            changed = true
                        }
                        
                        // <+1884>
                        flag = true
                        break
                    }
                    
                    // <+912>
                    if sp60 != -1 || info.phase != nil {
                        // <+632>
                        continue
                    }
                    
                    // <+976>
                    // x21
                    let copy = info.item
                    // w20
                    let canBeReused = copy.canBeReused(by: item)
                    
                    // <+1048>
                    sp60 = canBeReused ? index : sp60
                }
                
                if !flag {
                    // <+228>
                    if T.Item.supportsReuse {
                        // <+296>
                        // <+1500>
                        for index in x29_0x78..<x29_0x80 {
                            let info = info.items[index].for(T.self)
                            if info.needsTransitions {
                                continue
                            }
                            
                            // x21
                            var copy = info.item
                            // w20
                            let canBeReused = copy.canBeReused(by: item)
                            
                            if !canBeReused {
                                continue
                            }
                            
                            copy = info.item
                            let contains = T.containsItem(copy_1, copy)
                            
                            if contains {
                                continue
                            }
                            
                            // <+2140>
                            if sp60 != -1 {
                                // <+1108>
                                let info = self.info.items[sp60].for(T.self)
                                info.item = item
                                unremoveItem(at: sp60)
                                if x29_0x78 < sp60 {
                                    self.info.items.swapAt(x29_0x78, sp60)
                                }
                                flag = true
                                // <+1896>
                            }
                        }
                        // <+336>
                    }
                }
                
                if !flag {
                    // <+336>
                    let lastUniqueId = lastUniqueId &+ 1
                    self.lastUniqueId = lastUniqueId
                    
                    let newItem = makeItem(
                        item,
                        uniqueId: lastUniqueId,
                        container: Attribute<DynamicContainer.Info>(identifier: .current!),
                        disableTransitions: disableTransitions
                    )
                    
                    self.info.items.append(newItem)
                    
                    // <+476>
                    if x29_0x78 < x29_0x80 {
                        self.info.items.swapAt(x29_0x78, x29_0x80)
                    }
                    
                    // <+528>
                    x29_0x80 &+= 1
                    
                    // <+1296>
                    changed = true
                    // <+1896>
                }
                
                // <+1896>
                // d8
                let zIndex = item.zIndex
                hasDepth = hasDepth || (zIndex != 0)
                
                // <+1944>
                // d9
                let other = info.items[x29_0x78].zIndex
                
                if zIndex != other {
                    // <+2028>
                    info.items[x29_0x78].zIndex = zIndex
                    changed = true
                }
                
                // <+2092>
                x29_0x78 &+= 1
            }
            
            // <+548>
            let x24 = x29_0x80
            let x25 = x29_0x78
            if x25 < x24 {
                // <+680>
                // x26
                for index in (x25..<x24).reversed() {
                    // w23
                    let phase = info.items[index].phase
                    
                    let removed = tryRemovingItem(at: index, disableTransitions: disableTransitions)
                    if removed {
                        changed = true
                        continue
                    }
                    
                    let item = info.items[index]
                    let zIndex = item.zIndex
                    hasDepth = (hasDepth || (zIndex != 0))
                    
                    let firstZIndex = info.items[x25].zIndex
                    if firstZIndex != zIndex {
                        item.zIndex = zIndex
                        changed = true
                    }
                    
                    if info.items[index].phase != phase {
                        changed = true
                    }
                }
            }
        } else {
            // <+300>
            hasDepth = info.displayMap != nil
        }
        
        return (changed, hasDepth)
    }
    
    mutating func unremoveItem(at: Int) {
        fatalError("TODO")
    }
}

struct DynamicContainerID: Comparable, Hashable {
    var uniqueId: UInt32
    var viewIndex: Int32
    
    init(uniqueId: UInt32, viewIndex: Int32) {
        self.uniqueId = uniqueId
        self.viewIndex = viewIndex
    }
    
    static func < (lhs: DynamicContainerID, rhs: DynamicContainerID) -> Bool {
        let w8 = lhs.uniqueId
        let w9 = rhs.uniqueId
        
        if w8 < w9 {
            return true
        } else {
            let w10 = rhs.viewIndex
            let w11 = lhs.viewIndex
            
            if w8 == w9 {
                return w11 < w10
            } else {
                return false
            }
        }
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

fileprivate struct DynamicPreferenceCombiner<T: PreferenceKey>: Rule, AsyncAttribute, CustomStringConvertible {
    @OptionalAttribute var info: DynamicContainer.Info?
    
    init() {
        _info = OptionalAttribute()
    }
    
    var description: String {
        fatalError("TODO")
    }
    
    static var initialValue: T.Value? {
        return T.defaultValue
    }
    
    var value: T.Value {
        fatalError("TODO")
    }
}

fileprivate struct DynamicTransaction: StatefulRule, AsyncAttribute {
    @Attribute private(set) var info: DynamicContainer.Info
    @Attribute private(set) var transaction: Transaction
    let uniqueId: UInt32
    private(set) var wasRemoved: Bool
    
    typealias Value = Transaction
    
    func updateValue() {
        fatalError("TODO")
    }
}

fileprivate struct DynamicViewPhase: Rule, AsyncAttribute {
    @Attribute private(set) var info: DynamicContainer.Info
    @Attribute private(set) var phase: _GraphInputs.Phase
    let uniqueId: UInt32
    
    var value: _GraphInputs.Phase {
        fatalError("TODO")
    }
}
