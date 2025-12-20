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
        private var indexMap: [UInt32: Int]
        private(set) var displayMap: [UInt32]?
        private var removedCount: Int
        private var unusedCount: Int
        private var allUnary: Bool
        private var seed: UInt32
        
        @inline(__always)
        init(
            items: [DynamicContainer.ItemInfo],
            indexMap: [UInt32: Int],
            displayMap: [UInt32]?,
            removedCount: Int,
            unusedCount: Int,
            allUnary: Bool,
            seed: UInt32
        ) {
            self.items = items
            self.indexMap = indexMap
            self.displayMap = displayMap
            self.removedCount = removedCount
            self.unusedCount = unusedCount
            self.allUnary = allUnary
            self.seed = seed
        }
    }
    
    class ItemInfo {
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
        var phase: TransitionPhase?
        
        init() {
            fatalError("TODO")
        }
        
        func `for`<T: DynamicContainerAdaptor>(_ type: T.Type) -> DynamicContainer._ItemInfo<T> {
            return unsafeBitCast(self, to: DynamicContainer._ItemInfo<T>.self)
        }
    }
    
    final class _ItemInfo<T: DynamicContainerAdaptor>: DynamicContainer.ItemInfo {
        fileprivate private(set) var item: T.Item
        private let itemLayout: T.ItemLayout
        
        override init() {
            fatalError("TODO")
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
        var flag: Bool
        if needsPhaseUpdate {
            // <+176>
            flag = false
            for item in info.items {
                if case .willAppear = item.phase {
                    // <+356>
                    flag = true
                    item.phase = .identity
                }
            }
            needsPhaseUpdate = false
        } else {
            flag = false
        }
        
        // <+556>
        let (changed, hasDepth) = updateItems(disableTransitions: disableTransitions)
        /*
         specialized : $s7SwiftUI20DynamicContainerInfoV11updateValueyyFAA0C17LayoutViewAdaptorV_Tg5
         $s7SwiftUI20DynamicContainerInfoV11updateValueyyF
         */
        fatalError("TODO")
    }
    
    func destroy() {
        fatalError("TODO")
    }
    
    func makeItem(_ item: T.Item, uniqueId: UInt32, container: Attribute<DynamicContainer.Info>, disableTransitions: Bool) -> DynamicContainer.ItemInfo {
        fatalError("TODO")
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
            let x29_0x80 = info.items.count
            // (x29, #0x78) (x29, #0x80) self, copy_1, disableTransitions, (changed, hasDepth)
            adaptor.foreachItem(items: copy_1) { item in
                /*
                 item -> sp + 0x88
                 x29_0x78 -> x1 -> x19
                 x29_0x80 -> x2 -> x23 -> sp + 0x38
                 self -> x3/x4 -> x28/x20
                 copy_1 -> x5 -> sp + 0x10
                 disableTransitions -> w6 -> sp + 0xc
                 (changed, hasDepth) -> x7 -> x21
                 */
                // $s7SwiftUI20DynamicContainerInfoV11updateItems33_E7D4CD2D59FB8C77D6C7E9C534464C17LL18disableTransitionsSb7changed_Sb8hasDepthtSb_tFy4ItemQzXEfU_
                var sp60 = -1
                for index in x29_0x78..<x29_0x80 {
                    // <+564>
                    // x26
                    let info = info.items[index].for(T.self)
                    let matches = item.matchesIdentity(of: info.item)
                    if matches {
                        // <+1348>
                        fatalError("TODO")
                    }
                    
                    // <+912>
                    if sp60 != -1 || info.phase != nil {
                        // <+632>
                        fatalError("TODO")
                    }
                    
                    // <+976>
                    // x21
                    let copy = info.item
                    // w20
                    let canBeReused = item.canBeReused(by: copy)
                    _ = consume info
                    
                    // <+1048>
                    if canBeReused {
                        sp60 = index
                    }
                }
                
                let disableTransitions = item.needsTransitions
                fatalError("TODO")
//                let lastUniqueId = lastUniqueId &+ 1
//                self.lastUniqueId = lastUniqueId
//                
//                let newItem = makeItem(
//                    item,
//                    uniqueId: lastUniqueId,
//                    container: Attribute<DynamicContainer.Info>(identifier: .current!),
//                    disableTransitions: disableTransitions
//                )
//                
//                self.info.items.append(newItem)
            }
            fatalError("TODO")
        } else {
            // <+300>
            hasDepth = info.displayMap != nil
        }
        
        return (changed, hasDepth)
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
