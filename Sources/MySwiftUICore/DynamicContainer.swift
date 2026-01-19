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
        var indexMap: [UInt32: Int]
        var displayMap: [UInt32]?
        var removedCount: Int
        var unusedCount: Int
        var allUnary: Bool
        var seed: UInt32
        
        func viewIndex(id: DynamicContainerID) -> Int? {
            // id.viewIndex -> w21
            guard let index = indexMap[id.uniqueId] else {
                return nil
            }
            
            return Int(items[index].precedingViewCount + id.viewIndex)
        }
    }
    
    class ItemInfo {
        let subgraph: Subgraph
        let uniqueId: UInt32
        let viewCount: Int32
        let outputs: _ViewOutputs
        let needsTransitions: Bool
        fileprivate var listener: DynamicAnimationListener? = nil
        fileprivate var zIndex: Double = 0
        fileprivate var removalOrder: UInt32 = 0
        fileprivate var precedingViewCount: Int32 = 0
        fileprivate(set) var resetSeed: UInt32 = 0
        fileprivate(set) var phase: TransitionPhase? = nil
        
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
        fileprivate let itemLayout: T.ItemLayout
        
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
            let usedCount = itemsCount &- unusedCount
            // removedCount -> sp + 0x40
            // x23
            let unremovedCount = usedCount &- removedCount
            // itemsCount -> sp + 0x30
            
            // <+940>
            if unremovedCount < usedCount {
                // <+1020>
                var array = info.items[unremovedCount..<usedCount]
                // x21(w9) -> lhs, x26(w8) -> rhs
                array.sort { $0.removalOrder < $1.removalOrder }
                info.items[unremovedCount..<usedCount] = array
            }
            
            // <+1716>
            // unremovedCount -> sp + 0x38
            info.indexMap.removeAll(keepingCapacity: true)
            
            // <+1788>
            info.allUnary = true
            
            // itemsCount(x8) unusedCount(x9)
            assert(usedCount > 0)
            // usedCount -> sp + 0x58
            if itemsCount != unusedCount {
                // <+1832>
                var precedingViewCount: Int32 = 0
                var allUnary = true
                for index in 0..<usedCount {
                    info.indexMap[info.items[index].uniqueId] = index
                    // <+2140>
                    let item = info.items[index]
                    item.precedingViewCount = precedingViewCount
                    // w21
                    let viewCount = item.viewCount
                    
                    if allUnary {
                        allUnary = viewCount == 1
                    }
                    
                    if index != usedCount {
                        precedingViewCount &+= item.viewCount
                    }
                }
                
                info.allUnary = allUnary
            }
            
            // <+2336>
            guard info.indexMap.count == usedCount else {
                fatalError("DynamicLayoutItem identifiers must be unique.")
            }
            
            // <+2348>
            let displayMap: [UInt32]?
            if !hasDepth {
                // <+2360>
                displayMap = nil
                info.displayMap = nil
                // <+3612>
            } else {
                // <+2380>
                // unremovedCount -> x21
                var capacity = unremovedCount
                if removedCount != 0 {
                    capacity += removedCount
                }
                
                // <+2412>
                // x20 / sp + 0x20
                capacity = max(capacity, 0)
                
                // x22
                var _displayMap: [UInt32] = []
                _displayMap.reserveCapacity(capacity)
                for index in 0..<unremovedCount {
                    _displayMap.append(numericCast(index))
                }
                
                // <+2632>
                func lessThan(_ lhs: UInt32, _ rhs: UInt32) -> Bool {
                    return info.items[Int(lhs)].zIndex < info.items[Int(rhs)].zIndex
                }
                
                if !(itemsCount > 31) {
                    // <+2648>
                    // inlined
                    _displayMap.insertionSort(by: lessThan(_:_:))
                    // <+2960>
                } else {
                    // <+2668>
                    _displayMap.sort(by: lessThan(_:_:))
                    // <+2960>
                }
                
                // <+2960>
                if removedCount == 0 {
                    // <+3544>
                    displayMap = _displayMap
                    self.info.displayMap = displayMap
                    // <+3612>
                } else {
                    // <+2980>
                    func addRemoved() {
                        // x0 -> unremovedCount, x1 -> usedCount
                        /*
                         unremovedCount -> x21
                         usedCount -> x20
                         */
                        guard unremovedCount != usedCount else {
                            return
                        }
                        
                        for index in unremovedCount..<usedCount {
                            _displayMap.append(numericCast(index))
                        }
                    }
                    
                    // w19
                    var flag: Bool?
                    // unremovedCount -> x25
                    if isLinkedOnOrAfter(.v5) {
                        // <+3128>
                        addRemoved()
                        
                        if unremovedCount == 0 {
                            // <+3356>
                        } else {
                            // <+3152>
                            flag = true
                            // <+3156>
                        }
                    } else {
                        if unremovedCount == 0 {
                            // <+3336>
                            addRemoved()
                            // <+3356>
                        } else {
                            // <+3104>
                            flag = false
                            // <+3156>
                        }
                    }
                    
                    if let flag {
                        // <+3156>
                        for index in 0..<unremovedCount {
                            _displayMap.append(_displayMap[index])
                        }
                        
                        // <+3332>
                        if !flag {
                            addRemoved()
                        }
                        // <+3356>
                    }
                    
                    // <+3356>
                    // x19 / sp + 0x10
                    let upperBound = unremovedCount + usedCount
                    // unremovedCount -> x26
                    var slice = _displayMap[unremovedCount..<upperBound]
//                    if !((unremovedCount == upperBound) || (unremovedCount &+ 1 == upperBound)) {
//                        // <+4176>
//                        // upperBound -> x22
//                        slice.insertionSort(by: lessThan(_:_:))
//                        // <+3468>
//                    } else {
//                        // <+3460>
//                        // <+3468>
//                    }
                    // 위 코드는 isEmpty의 inline으로 대체됨
                    slice.insertionSort(by: lessThan(_:_:))
                    
                    // <+3468>
                    _displayMap[unremovedCount..<upperBound] = slice
                    displayMap = _displayMap
                    self.info.displayMap = displayMap
                    // <+3612>
                }
                
                // <+3612>
            }
            
            // <+3612>
            /*
             displayMap -> x20
             itemsCount -> x8
             unusedCount -> x9
             */
            if itemsCount != unusedCount {
                // <+3772>
                // info.items -> x21
                // removedCount -> sp + 0x38
                var x22 = -(info.removedCount &+ info.unusedCount)
                // x28
                for index in 0..<usedCount {
                    let _index: Int
                    if let displayMap {
                        // <+3956>
                        if removedCount == 0 {
                            // <+4104>
                            _index = Int(displayMap[index])
                        } else {
                            // <+3968>
                            _index = Int(displayMap[info.items.count + x22])
                        }
                    } else {
                        // <+4016>
                        if removedCount == 0 {
                            // <+4060>
                            _index = index
                        } else {
                            // <+4032>
                            let a = index &- unremovedCount
                            let b = info.items.count &+ x22
                            _index = (a >= 0) ? a : b
                        }
                    }
                    
                    info.items[_index].subgraph.index = Int32(index)
                }
            }
            
            // <+3636>
            info.seed &+= 1
            value = info
            return
        } else {
            // <+976>
            if !info.items.isEmpty || !hasValue {
                // <+3636>
                info.seed &+= 1
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
            let attribute = AnyWeakAttribute(Graph.currentAttribute)
            GraphHost.currentHost.continueTransaction(InvalidatingGraphMutation(attribute: attribute))
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
    
    mutating func tryRemovingItem(at index: Int, disableTransitions: Bool) -> Bool {
        // $s7SwiftUI20DynamicContainerInfoV15tryRemovingItem2at18disableTransitionsSbSi_SbtF
        /*
         index -> x19
         disableTransitions -> x23
         */
        // x24
        let item = info.items[index]
        // w28
        guard let phase = item.phase else {
            return false
        }
        
        switch phase {
        case .willAppear:
            // <+1044>
            fatalError()
        case .identity:
            // <+148>
            if disableTransitions || !info.items[index].needsTransitions {
                // <+464>
                eraseItem(at: index)
                return true
            } else {
                // <+180>
                // w22
                var lastRemoved = lastRemoved
                if (lastRemoved &+ 1) <= 1 {
                    lastRemoved = 1
                }
                self.lastRemoved = lastRemoved
                info.items[index].removalOrder = lastRemoved
                info.items[index].phase = .didDisappear
                
                if let listener = info.items[index].listener {
                    listener.viewGraph = nil
                }
                
                // x22
                let current = ViewGraph.current
                // x23
                let currentAttribute = AnyWeakAttribute(.current!)
                // x20
                let listener = DynamicAnimationListener(viewGraph: current, asyncSignal: currentAttribute, count: 0)
                info.items[index].listener = listener
                listener.animationWasAdded()
                
                // <+912>
                Update.enqueueAction(reason: nil) { [listener] in
                    // $s7SwiftUI20DynamicContainerInfoV15tryRemovingItem2at18disableTransitionsSbSi_SbtFyycfU_TA
                    listener.animationWasRemoved()
                }
                
                return false
            }
        case .didDisappear:
            // <+232>
            // x21
            let count = info.items[index].listener!.count
            
            if count == 0 {
                eraseItem(at: index)
                return true
            } else {
                return false
            }
        }
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
    
    mutating func eraseItem(at index: Int) {
        // index -> x24
        // w21
        let phase = info.items[index].phase
        // x20 -> sp + 0x18
        
        switch phase {
        case .willAppear:
            fatalError()
        case .identity:
            // <+168>
            break
        case .didDisappear:
            // <+156>
            info.removedCount &-= 1
            // <+168>
        case nil:
            fatalError()
        }
        
        // <+168>
        // x21
        let unusedCount = info.unusedCount
        // x20
        let maxUnusedItems = T.maxUnusedItems
        // x23
        let subgraph = info.items[index].subgraph
        // x25
        let item = info.items[index]
        
        if unusedCount >= maxUnusedItems {
            // <+404>
            adaptor.removeItemLayout(
                uniqueId: item.uniqueId,
                itemLayout: item.for(T.self).itemLayout
            )
            
            if let listener = item.listener {
                listener.viewGraph = nil
            }
            
            info.items.remove(at: index)
            subgraph.willInvalidate(isInserted: true)
            subgraph.invalidate()
        } else {
            info.items.remove(at: index)
            item.removalOrder = 0
            item.resetSeed &+= 1
            item.phase = nil
            
            // <+324>
            if let listener = item.listener {
                listener.viewGraph = nil
            }
            
            // <+552>
            item.listener = nil
            info.items.append(item)
            info.unusedCount = unusedCount &+ 1
            subgraph.willRemove()
            parentSubgraph.removeChild(subgraph)
        }
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

fileprivate final class DynamicAnimationListener {
    weak var viewGraph: ViewGraph?
    let asyncSignal: AnyWeakAttribute
    var count: Int
    
    @inline(__always)
    init(viewGraph: ViewGraph?, asyncSignal: AnyWeakAttribute, count: Int) {
        self.viewGraph = viewGraph
        self.asyncSignal = asyncSignal
        self.count = count
    }
    
    func animationWasAdded() {
        count &+= 1
    }
    
    func animationWasRemoved() {
        var count = count
        count &-= 1
        self.count = count
        
        if count == 0, let viewGraph {
            let invalidation = InvalidatingGraphMutation(attribute: asyncSignal)
            viewGraph.continueTransaction(invalidation)
        }
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
        /*
         items -> sp + 0x50
         indexMap -> x26
         displayMap -> x28
         removedCount -> sp + 0x58
         unusedCount -> x25
         */
        let info = info!
        
        var x22 = info.items.endIndex - info.unusedCount
        var x23 = x22 - info.removedCount
        
        // sp + 0x70
        var value: T.Value
        // sp + 0x94
        let includesRemovedValues: Bool
        if x22 == x23 {
            // <+224>
            value = T.defaultValue
            includesRemovedValues = false
        } else {
            // <+256>
            let _includesRemovedValues = T._includesRemovedValues
            value = T.defaultValue
            includesRemovedValues = _includesRemovedValues
            x22 = includesRemovedValues ? x22 : x23
        }
        
        // <+312>
        var x27 = 0
        var w25 = true
        
        repeat {
            // <+432>
            // x20
            let item: DynamicContainer.ItemInfo
            if let displayMap = info.displayMap {
                // <+444>
                if includesRemovedValues {
                    // <+452>
                    let x8 = info.items.endIndex + x23
                    let index = Int(displayMap[x8])
                    // <+572>
                    item = info.items[index]
                    // <+664>
                } else {
                    // <+504>
                    let index = Int(displayMap[x27])
                    item = info.items[index]
                    // <+664>
                }
            } else {
                // <+472>
                if includesRemovedValues {
                    // <+484>
                    // <+604>
                    let x8 = x27 &- info.removedCount
                    let x9 = info.items.endIndex &+ x23
                    let x0 = (x8 >= 0) ? x8 : x9
                    item = info.items[x0]
                } else {
                    // <+572>
                    item = info.items[x27]
                    // <+664>
                }
            }
            
            // <+664>
            x27 &+= 1
            // sp + 0x98
            let outputs = item.outputs
            
            guard let attribute: Attribute<T.Value> = outputs[T.self] else {
                continue
            }
            
            if w25 {
                // <+740>
                // x24
                value = attribute.value
                w25 = false
            } else {
                // <+844>
                T.reduce(value: &value) {
                    // $s7SwiftUI25DynamicPreferenceCombiner33_E7D4CD2D59FB8C77D6C7E9C534464C17LLV5value5ValueQzvgAGyXEfU_TA
                    return attribute.value
                }
                
                w25 = false
            }
            
            // <+412>
            x23 &+= 1
        } while x27 != x22
        
        return value
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
        // w24
        let phase = phase
        // x20
        let indexMap = info.indexMap
        
        guard let index = indexMap[uniqueId] else {
            return phase
        }
        
        // w23
        let resetSeed = info.items[index].resetSeed
        // x20
        let item = info.items[index]
        // w22
        let itemPhase = item.phase
        
        var newPhase = _GraphInputs.Phase()
        newPhase.resetSeed = resetSeed
        newPhase.merge(phase)
        newPhase.isBeingRemoved = itemPhase == .didDisappear
        
        return newPhase
    }
}

struct DynamicLayoutMap {
    private var map: [(id: DynamicContainerID, value: LayoutProxyAttributes)]
    var sortedArray: [LayoutProxyAttributes]
    var sortedSeed: UInt32
    
    init() {
        self.map = []
        self.sortedArray = []
        self.sortedSeed = 0
    }
    
    init(
        map: [(id: DynamicContainerID, value: LayoutProxyAttributes)],
        sortedArray: [LayoutProxyAttributes] = [],
        sortedSeed: UInt32 = 0
    ) {
        self.map = map
        self.sortedArray = sortedArray
        self.sortedSeed = sortedSeed
    }
    
    subscript(_ containerID: DynamicContainerID) -> LayoutProxyAttributes {
        get {
            for value in map {
                if value.id == containerID {
                    return value.value
                }
            }
            
            return LayoutProxyAttributes()
        }
        set {
            /*
             newValue -> w22, w23
             containerID -> w8, w9
             */
            if !map.isEmpty {
                // <+44>
                // inlined
                let count = map.count
                let index = map.lowerBound { $0.id < containerID }
                
                if (index == count) || map[index].value != newValue {
                    // <+152>
                    if !newValue.isEmpty {
                        map.insert((id: containerID, value: newValue), at: index)
                    }
                } else {
                    if newValue.isEmpty {
                        // <+324>
                        map.remove(at: index)
                    } else {
                        // <+340>
                        map[index].value = newValue
                    }
                }
            } else {
                // <+188>
                if !newValue.isEmpty {
                    map.insert((id: containerID, value: newValue), at: 0)
                }
            }
            
            sortedSeed = 0
        }
        _modify {
            fatalError("TODO")
        }
    }
    
    mutating func remove(uniqueId: UInt32) {
        let count = map.count
        guard count != 0 else {
            return
        }
        
        let index = map.partitionPoint { $0.id.uniqueId < uniqueId }
        
        guard index != count else {
            return
        }
        
        var end = index
        repeat {
            let id = map[end].id.uniqueId
            guard id == uniqueId else {
                break
            }
            end &+= 1
        } while end != count
        map.removeSubrange(index..<end)
        sortedSeed = 0
    }
    
    mutating func attributes(info: DynamicContainer.Info) -> [LayoutProxyAttributes] {
        // self -> x25
        // w26
        let infoSeed = info.seed
        // sp + 0x4c
        let allUnary = info.allUnary
        
        guard sortedSeed != infoSeed else {
            // <+760>
            return sortedArray
        }
        
        // <+56>
        // x21
        let items = info.items
        // x22
        let removedCount = info.removedCount
        // x24
        let unusedCount = info.unusedCount
        // sortedArray -> x20
        sortedArray.removeAll(keepingCapacity: true)
        
        // <+140>
        let startIndex = items.count &- (unusedCount &+ removedCount) &- 1
        let flag = (startIndex < 0) || allUnary
        
        guard flag || (startIndex < items.count) else {
            // <+872>
            fatalError("invalid view index")
        }
        
        var results: [LayoutProxyAttributes] = []
        for index in startIndex..<items.indices.endIndex {
            // <+500>
            let precedingViewCount = items[index].precedingViewCount
            // x26
            let viewIndex = unusedCount - Int(precedingViewCount)
            // w19
            let uniqueId = items[index].uniqueId
            // sp + 0x50
            let id = DynamicContainerID(uniqueId: uniqueId, viewIndex: Int32(viewIndex))
            // sp + 0x58
            let attributes = self[id]
            results.append(attributes)
        }
        
        return results
    }
}
