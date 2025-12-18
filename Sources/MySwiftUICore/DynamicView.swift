// 3FB6ABB0477B815AB3C89DD5EDC9F0F0

internal import AttributeGraph

@MainActor protocol DynamicView {
    associatedtype Metadata
    associatedtype ID : Hashable
    
    static nonisolated var canTransition: Bool {
        get
    }
    
    static nonisolated var traitKeysDependOnView: Bool {
        get
    }
    
    static nonisolated func makeID() -> ID
    
    nonisolated func childInfo(metadata: Metadata) -> (Any.Type, ID?)
    
    nonisolated func makeChildView(metadata: Metadata, view: Attribute<Self>, inputs: _ViewInputs) -> _ViewOutputs
    
    nonisolated func makeChildViewList(metadata: Metadata, view: Attribute<Self>, inputs: _ViewListInputs) -> _ViewListOutputs
}

extension DynamicView {
    static nonisolated func makeDynamicView(metadata: Metadata, view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        /*
         x29 = sp + 0x1b0
         x25 = sp + 0x70
         view = x22
         inputs = x24
         */
        // sp + 0x70
        let copy_1 = inputs
        // sp + 0xf0
        /*
         preferences = x20
         debugProperties = x19
         _layoutComputer = w21
         */
        let outputs = copy_1.makeIndirectOutputs()
        _ = consume copy_1
        // sp + 0x70
        let container = DynamicViewContainer<Self>(
            metadata: metadata,
            view: view.value,
            inputs: inputs,
            outputs: outputs
        )
        // x24
        let containerAttribute = Attribute(container)
        containerAttribute.flags = .unknown0
        outputs.setIndirectDependency(containerAttribute.identifier)
        
        return outputs
    }
    
    static nonisolated func makeDynamicViewList(metadata: Metadata, view: _GraphValue<Self>, inputs: _ViewListInputs) -> _ViewListOutputs {
        let rule = DynamicViewList<Self>(metadata: metadata, view: view.value, inputs: inputs, lastItem: nil)
        let attribute = Attribute(rule)
        let outputs = _ViewListOutputs(.dynamicList(attribute, nil), nextImplicitID: inputs.implicitID)
        return outputs
    }
    
    static nonisolated var traitKeysDependOnView: Bool {
        return true
    }
}

extension DynamicView where ID == UniqueID {
    static nonisolated func makeID() -> UniqueID {
        return UniqueID()
    }
}

fileprivate struct DynamicViewContainer<Content: DynamicView>: StatefulRule {
    private let metadata: Content.Metadata
    @Attribute private var view: Content
    private let inputs: _ViewInputs
    private let outputs: _ViewOutputs
    private let parentSubgraph: Subgraph
    
    init(
        metadata: Content.Metadata,
        view: Attribute<Content>,
        inputs: _ViewInputs,
        outputs: _ViewOutputs,
    ) {
        self.metadata = metadata
        self._view = view
        self.inputs = inputs
        self.outputs = outputs
        self.parentSubgraph = .current!
    }
    
    func updateValue() {
        // x29 = sp + 0x170
        /*
         self/sp + 0xc0 = x23
         x25/sp + 0xd8 = Content
         x29 = sp + 0xe0
         */
        // x23
        let childInfo = self.view.childInfo(metadata: self.metadata)
        // x22
        let oldValue: Self.Value? = (self.hasValue ? self.value : nil)
        // <+524>
        guard oldValue.map({ $0.matches(type: childInfo.0, id: childInfo.1) }) != true else {
            return
        }
        
        // <+696>
        /*
         self = 0xa8
         oldValue = 0xb0
         */
        if let oldValue {
            // <+780>
            self.outputs.detachIndirectOutputs()
            oldValue.subgraph.willInvalidate(isInserted: true)
            oldValue.subgraph.invalidate()
        }
        
        // <+944>
        let graph = Subgraph(graph: self.parentSubgraph.graph)
        self.parentSubgraph.addChild(graph)
        
        self.value = graph.apply {
            // $s7SwiftUI20DynamicViewContainer031_3FB6ABB0477B815AB3C89DD5EDC9F0M0LLV11updateValueyyFAD0O0Vyx_GyXEfU0_
            var inputs = self.inputs
            inputs.copyCaches()
            
            let childOutputs = MainActor.assumeIsolated { [unchecked = UncheckedSendable((self, inputs))] in
                let `self` = unchecked.value.0
                let outputs = self.view.makeChildView(metadata: self.metadata, view: self.$view, inputs: unchecked.value.1)
                return UncheckedSendable(outputs)
            }.value
            
            self.outputs.attachIndirectOutputs(to: childOutputs)
            let value = Self.Value(type: childInfo.0, id: childInfo.1, subgraph: graph)
            return value
        }
    }
}

extension DynamicViewContainer {
    fileprivate struct Value {
        private(set) var type: any Any.Type
        private(set) var id: Content.ID?
        private(set) var subgraph: Subgraph
        
        init(type: any Any.Type, id: Content.ID? = nil, subgraph: Subgraph) {
            self.type = type
            self.id = id
            self.subgraph = subgraph
        }
        
        func matches(type: any Any.Type, id: Content.ID?) -> Bool {
            guard self.type == type else {
                return false
            }
            
            return id.map { $0 == self.id } != false
        }
    }
}

fileprivate struct DynamicViewList<Content: DynamicView>: StatefulRule, AsyncAttribute {
    private let metadata: Content.Metadata
    @Attribute private var view: Content
    private let inputs: _ViewListInputs
    private let parentSubgraph: Subgraph
    private let allItems: MutableBox<[Unmanaged<DynamicViewList<Content>.Item>]>
    private var lastItem: DynamicViewList<Content>.Item?
    
    typealias Value = any ViewList
    
    init(metadata: Content.Metadata, view: Attribute<Content>, inputs: _ViewListInputs, lastItem: DynamicViewList<Content>.Item?) {
        self.metadata = metadata
        self._view = view
        self.inputs = inputs
        self.parentSubgraph = .current!
        unsafe self.allItems = unsafe MutableBox(Array())
        self.lastItem = lastItem
    }
    
    mutating func updateValue() {
        // self -> x26
        let view = view
        // x25/x24 / sp + 0x70
        let (type, id) = view.childInfo(metadata: metadata)
        
        // <+420>
        // self -> sp + 0xd8
        // false = <+928> / true = <+1760>
        let flag_1: Bool
        
        let lastID: Content.ID?
        var item: DynamicViewList<Content>.Item!
        if let lastItem {
            // <+496>
            lastID = lastItem.id
            let matches = lastItem.matches(type: type, id: id)
            let refcount = lastItem.refcount
            
            // false = <+880> / true = <+692>
            repeat {
                let flag_2: Bool
                if !matches {
                    // <+688>
                    if refcount == 0 {
                        // <+880>
                        flag_2 = false
                        flag_1 = false
                    } else {
                        // <+692>
                        flag_2 = true
                        flag_1 = false
                    }
                } else if refcount == 0 {
                    // <+880>
                    flag_2 = false
                    flag_1 = false
                } else {
                    // <+600>
                    let subgraph = lastItem.subgraph
                    if subgraph.isValid {
                        // <+616>
                        flag_1 = true
                        item = lastItem
                        break
                        // <+1928>
                    } else {
                        // <+692>
                        flag_1 = false
                        flag_2 = true
                    }
                }
                
                if flag_2 {
                    // <+692>
                    let subgraph = lastItem.subgraph
                    if subgraph.isValid {
                        // <+720>
                        subgraph.apply { 
                            // $sSo13AGSubgraphRefa7SwiftUIE10willRemoveyyFySo11AGAttributeaXEfU_Tf4nd_n
                            fatalError("TODO")
                        }
                        
                        parentSubgraph.removeChild(lastItem.subgraph)
                        // <+812>
                    }
                    
                    // <+812>
                    let (_, overflow) = lastItem.refcount.subtractingReportingOverflow(1)
                    if overflow {
                        lastItem.invalidate()
                        let subgraph = lastItem.subgraph
                        if subgraph.isValid {
                            subgraph.willInvalidate(isInserted: false)
                            subgraph.invalidate()
                        }
                    }
                    
                    // <+912>
                    self.lastItem = nil
                    // <+928>
                } else {
                    // <+880>
                    lastItem.refcount = .max
                    self.lastItem = nil
                    // <+928>
                }
            } while false
        } else {
            // <+644>
            lastID = nil
            // <+928>
            flag_1 = false
        }
        
        // <+928>
        if !flag_1 {
            var matchedItem: DynamicViewList<Content>.Item?
            for unsafe item in unsafe allItems.value {
                let matches = unsafe item.takeRetainedValue().matches(type: type, id: id)
                unsafe item.release()
                if matches {
                    matchedItem = unsafe item.takeUnretainedValue()
                    break
                }
            }
            
            if let matchedItem {
                // <+1640>
                fatalError("TODO") // AGSubgraphAddChild, AGSubgraphApply
                item = matchedItem // 검증 필요
                // <+1928>
            } else {
                // <+1208>
                // x20
                let parentSubgraph = parentSubgraph
                if parentSubgraph.isValid {
                    // <+1232>
                    // x22
                    let graph = parentSubgraph.graph
                    // x19
                    let newSubgraph = Subgraph(graph: graph)
                    _ = consume graph
                    parentSubgraph.addChild(newSubgraph)
                    
                    // w24, w22
                    let (listAttribute, isUnary) = newSubgraph.apply { 
                        // $s7SwiftUI15DynamicViewList031_3FB6ABB0477B815AB3C89DD5EDC9F0M0LLV11updateValueyyF14AttributeGraph0P0VyAA0dE0_pG_SbtyXEfU_
                        // self -> x26
                        // sp + 0x1b8
                        var copy_1 = inputs
                        copy_1.base.copyCaches()
                        
                        if Content.canTransition, !copy_1.options.contains(.canTransition) {
                            copy_1.options.insert(.canTransition)
                        }
                        
                        copy_1.implicitID = 0
                        
                        // <+432>
                        // x21
                        let copy_3 = self
                        // x27
                        let _view = copy_3.view
                        _ = consume copy_3
                        
                        let listOutputs = _view.makeChildViewList(metadata: metadata, view: $view, inputs: copy_1)
                        return (listOutputs.makeAttribute(inputs: copy_1), listOutputs.staticCount == 1)
                    }
                    
                    // x23
                    let currentAttribute = AnyAttribute.current!
                    // <+1384>
                    /*
                     listAttribute -> sp + 0x68
                     isUnary -> sp + 0x6c
                     */
                    // x22
                    let id2: Content.ID
                    if let id {
                        id2 = id
                    } else {
                        id2 = Content.makeID()
                    }
                    
                    // <+1796>
                    item = unsafe DynamicViewList<Content>.Item(
                        type: type,
                        owner: currentAttribute,
                        list: listAttribute,
                        id: id2,
                        isUnary: isUnary,
                        subgraph: newSubgraph,
                        allItems: allItems
                    )
                    // <+1928>
                } else {
                    // <+1560>
                    self.value = EmptyViewList()
                    return
                }
            }
        } else {
            // <+1760>
            // <+1928>
        }
        
        // <+1928>
        // sp + 0xe8
        let list = item.list
        let context = RuleContext(attribute: Attribute<ViewList>(identifier: .current!))
        // <+2000>
        let transactionID = TransactionID(context: context)
        let wrappedList = Self.WrappedList(base: list, item: item, lastID: lastID, lastTransaction: transactionID)
        self.value = wrappedList
    }
}

extension DynamicViewList {
    fileprivate final class Item: _ViewList_Subgraph {
        private let type: any Any.Type
        let id: Content.ID
        private let owner: AnyAttribute
        private var _list: Attribute<any ViewList>
        let isUnary: Bool
        private let allItems: MutableBox<[Unmanaged<DynamicViewList<Content>.Item>]>
        
        var list: any ViewList {
            return _list.value
        }
        
        init(
            type: any Any.Type,
            owner: AnyAttribute,
            list: Attribute<any ViewList>,
            id: Content.ID,
            isUnary: Bool,
            subgraph: Subgraph,
            allItems: MutableBox<[Unmanaged<DynamicViewList<Content>.Item>]>
        ) {
            /*
             self -> x19
             id -> x23
             isUnary -> x22
             subgraph -> x20
             allItems -> x21
             */
            self.type = type
            self.owner = owner
            self._list = list
            self.id = id
            self.isUnary = isUnary
            unsafe self.allItems = unsafe allItems
            super.init(subgraph: subgraph)
            
            // self -> sp + 0x18
            // <+176>
            unsafe allItems.value.append(Unmanaged.passRetained(self))
        }
        
        func matches(type: any Any.Type, id: Content.ID?) -> Bool {
            fatalError("TODO")
        }
    }
    
    fileprivate struct WrappedList: CustomStringConvertible {
        private let base: any ViewList
        private let item: DynamicViewList<Content>.Item
        private let lastID: Content.ID?
        private let lastTransaction: TransactionID
        
        var description: String {
            fatalError("TODO")
        }
        
        init(base: any ViewList, item: DynamicViewList<Content>.Item, lastID: Content.ID?, lastTransaction: TransactionID) {
            self.base = base
            self.item = item
            self.lastID = lastID
            self.lastTransaction = lastTransaction
        }
    }
    
    fileprivate struct WrappedIDs {
        private let base: _ViewList_ID_Views
        private let item: DynamicViewList<Content>.Item
    }
    
    fileprivate struct Transform: _ViewList_SublistTransform_Item {
        private var item: DynamicViewList<Content>.Item
    }
}

extension DynamicViewList.WrappedList: ViewList {
    func firstOffset<T>(forID: T, style: _ViewList_IteratorStyle) -> Int? where T : Hashable {
        fatalError("TODO")
    }
    
    func estimatedCount(style: _ViewList_IteratorStyle) -> Int {
        fatalError("TODO")
    }
    
    func count(style: _ViewList_IteratorStyle) -> Int {
        fatalError("TODO")
    }
    
    var traitKeys: ViewTraitKeys? {
        fatalError("TODO")
    }
    
    var viewIDs: _ViewList_ID_Views? {
        fatalError("TODO")
    }
    
    func appendViewIDs(into: inout HeterogeneousViewIDsAccumulator) {
        fatalError("TODO")
    }
    
    var traits: ViewTraitCollection {
        fatalError("TODO")
    }
    
    func applyNodes(from: inout Int, style: _ViewList_IteratorStyle, list: AttributeGraph.Attribute<any ViewList>?, transform: consuming _ViewList_TemporarySublistTransform, to: (inout Int, _ViewList_IteratorStyle, _ViewList_Node, consuming _ViewList_TemporarySublistTransform) -> Bool) -> Bool {
        fatalError("TODO")
    }
    
    func edit(forID: _ViewList_ID, since: TransactionID) -> _ViewList_Edit? {
        fatalError("TODO")
    }
    
    func print(into: inout SExpPrinter) {
        fatalError("TODO")
    }
}

struct DynamicLayoutMap {
    private var map: [(id: DynamicContainerID, value: LayoutProxyAttributes)]
    private var sortedArray: [LayoutProxyAttributes]
    private var sortedSeed: UInt32
    
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
}

struct DynamicViewListItem: DynamicContainerItem {
    var count: Int {
        fatalError("TODO")
    }
    
    func matchesIdentity(of item: DynamicViewListItem) -> Bool {
        fatalError("TODO")
    }
    
    private var id: _ViewList_ID
    private var elements: _ViewList_SubgraphElements
    private var traits: ViewTraitCollection
    private(set) var list: Attribute<ViewList>?
}

extension DynamicViewListItem {
    fileprivate class Item<T: DynamicView> {
        private let type: any Any.Type
        private let id: T.ID
        private let owner: AnyAttribute
        @Attribute private var list: ViewList
        private let isUnary: Bool
        private let allItems: MutableBox<[Unmanaged<DynamicViewList<T>.Item>]>
        
        init() {
            fatalError("TODO")
        }
    }
}

struct LayoutProxyAttributes {
    @OptionalAttribute private var layoutComputer: LayoutComputer?
    @OptionalAttribute private var traitsList: ViewList?
}

struct EmptyViewList: CustomStringConvertible {
    var description: String {
        fatalError("TODO")
    }
}

extension EmptyViewList: ViewList {
    func firstOffset<T>(forID: T, style: _ViewList_IteratorStyle) -> Int? where T : Hashable {
        fatalError("TODO")
    }
    
    func estimatedCount(style: _ViewList_IteratorStyle) -> Int {
        fatalError("TODO")
    }
    
    func count(style: _ViewList_IteratorStyle) -> Int {
        fatalError("TODO")
    }
    
    var traitKeys: ViewTraitKeys? {
        fatalError("TODO")
    }
    
    var viewIDs: _ViewList_ID_Views? {
        fatalError("TODO")
    }
    
    func appendViewIDs(into: inout HeterogeneousViewIDsAccumulator) {
        fatalError("TODO")
    }
    
    var traits: ViewTraitCollection {
        fatalError("TODO")
    }
    
    func applyNodes(from: inout Int, style: _ViewList_IteratorStyle, list: AttributeGraph.Attribute<any ViewList>?, transform: consuming _ViewList_TemporarySublistTransform, to: (inout Int, _ViewList_IteratorStyle, _ViewList_Node, consuming _ViewList_TemporarySublistTransform) -> Bool) -> Bool {
        fatalError("TODO")
    }
    
    func edit(forID: _ViewList_ID, since: TransactionID) -> _ViewList_Edit? {
        fatalError("TODO")
    }
    
    func print(into: inout SExpPrinter) {
        fatalError("TODO")
    }
}

struct EmptyViewListElements: _ViewList_Elements {
    var count: Int {
        fatalError("TODO")
    }
    
    func makeElements(from index: inout Int, inputs: _ViewInputs, indirectMap: IndirectAttributeMap?, body: (_ViewInputs, (_ViewInputs) -> _ViewOutputs) -> (_ViewOutputs?, Bool)) -> (_ViewOutputs?, Bool) {
        fatalError("TODO")
    }
    
    func tryToReuseElement(at index: Int, by other: any _ViewList_Elements, at otherIndex: Int, indirectMap: IndirectAttributeMap, testOnly: Bool) -> Bool {
        fatalError("TODO")
    }
}

extension ViewList {
    func applySublists(from index: inout Int, style: _ViewList_IteratorStyle, list: Attribute<ViewList>?, transform: consuming _ViewList_TemporarySublistTransform, to: (_ViewList_Sublist) -> Bool) -> Bool {
//        transform.withPushedItem(<#T##_ViewList_SublistTransform_Item#>, do: <#T##(consuming _ViewList_TemporarySublistTransform) -> T#>)
        fatalError("TODO")
    }
}
