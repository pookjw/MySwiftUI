// 1A3DD35AB7F6976908CD7AF959F34D1F
internal import AttributeGraph
private import Foundation
private import os.log
@_spi(SwiftUI) private import _ObservationPrivate

public struct ForEach<Data, ID, Content> where Data : RandomAccessCollection, ID : Hashable {
    public var data: Data // 0x0
    public var content: (Data.Element) -> Content // 0x8
    fileprivate private(set) var idGenerator: ForEach<Data, ID, Content>.IDGenerator // 0x18
    fileprivate private(set) var reuseID: KeyPath<Data.Element, Int>? = nil // 0x20
    fileprivate private(set) var obsoleteContentID: Int // 0x28
}

@available(*, unavailable)
extension ForEach : Sendable {}

extension ForEach : View where Content : View {
    public typealias Body = Never
    
    nonisolated public static func _makeView(view: _GraphValue<ForEach<Data, ID, Content>>, inputs: _ViewInputs) -> _ViewOutputs {
        if let outputs = makeForEachView(view: view, inputs: inputs) {
            return outputs
        }
        
        // <+112>
        return makeImplicitRoot(view: view, inputs: inputs)
    }
    
    nonisolated public static func _makeViewList(view: _GraphValue<ForEach<Data, ID, Content>>, inputs: _ViewListInputs) -> _ViewListOutputs {
        let state = ForEachState<Data, ID, Content>(inputs: inputs)
        let stateRule = ForEachState<Data, ID, Content>.Info.Init(view: view.value, state: state)
        let stateAttribute = Attribute(stateRule)
        state.info = stateAttribute
        
        let existing = inputs.base[ForEachEvictionInput.self]
        
        if (existing != WeakAttribute()) || ForEachEvictionInput.evictByDefault {
            // <+552>
            let evictor = ForEachState<Data, ID, Content>.Evictor(
                state: state,
                isEnabled: existing,
                updateSeed: GraphHost.currentHost.data.$updateSeed
            )
            
            let attribute = Attribute(evictor)
            attribute.flags = .unknown0
        }
        
        // <+832>
        let listRule = ForEachList<Data, ID, Content>.Init(_info: stateAttribute, seed: 0)
        let listAttribute = Attribute(listRule)
        state.list = listAttribute
        let outputs = _ViewListOutputs(
            .dynamicList(listAttribute, nil),
            nextImplicitID: inputs.implicitID,
            staticCount: nil
        )
        
        return outputs
    }
}

extension ForEach : DynamicView, PrimitiveView where Content : View {
    static func makeID() -> Never {
        assertUnimplemented()
    }
    
    func childInfo(metadata: Never) -> (any Any.Type, Never?) {
        assertUnimplemented()
    }
    
    func makeChildView(metadata: Never, view: AttributeGraph::Attribute<ForEach<Data, ID, Content>>, inputs: _ViewInputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    func makeChildViewList(metadata: Never, view: AttributeGraph::Attribute<ForEach<Data, ID, Content>>, inputs: _ViewListInputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
    
    typealias Metadata = Never // TODO
    
    typealias ID = Never // TODO
    
    static var canTransition: Bool {
        assertUnimplemented()
    }
}

extension ForEach where ID == Data.Element.ID, Content : View, Data.Element : Identifiable {
    public init(_ data: Data, @ViewBuilder content: @escaping (Data.Element) -> Content) {
        assertUnimplemented()
    }
}

extension ForEach where Content : View {
    public init(_ data: Data, id: KeyPath<Data.Element, ID>, @ViewBuilder content: @escaping (Data.Element) -> Content) {
        self.init(data, idGenerator: .keyPath(id), content: content)
    }
}

extension ForEach where Content : View {
    @_disfavoredOverload @_alwaysEmitIntoClient public init<C>(_ data: Binding<C>, @ViewBuilder content: @escaping (Binding<C.Element>) -> Content) where Data == LazyMapSequence<C.Indices, (C.Index, ID)>, ID == C.Element.ID, C : MutableCollection, C : RandomAccessCollection, C.Element : Identifiable, C.Index : Hashable {
        self.init(data, id: \.id, content: content)
    }
    
    @_disfavoredOverload @_alwaysEmitIntoClient public init<C>(_ data: Binding<C>, id: KeyPath<C.Element, ID>, @ViewBuilder content: @escaping (Binding<C.Element>) -> Content) where Data == LazyMapSequence<C.Indices, (C.Index, ID)>, C : MutableCollection, C : RandomAccessCollection, C.Index : Hashable {
        let elementIDs = data.wrappedValue.indices.lazy.map { index in
            (index, data.wrappedValue[index][keyPath: id])
        }
        self.init(elementIDs, id: \.1) { (index, _) in
            let elementBinding = Binding {
                data.wrappedValue[index]
            } set: {
                data.wrappedValue[index] = $0
            }
            content(elementBinding)
        }
    }
}

extension ForEach where Data == Range<Int>, ID == Int, Content : View {
    @_semantics("swiftui.requires_constant_range") public init(_ data: Range<Int>, @ViewBuilder content: @escaping (Int) -> Content) {
        self.init(data, idGenerator: .offset) { offset in
            // $sSiq0_Iegyr_Siq0_Iegnr_SnySiGRszSiRs_7SwiftUI4ViewR0_r1_lTRTA
            content(offset)
        }
    }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension ForEach where ID == Data.Element.ID, Data.Element : Identifiable {
    @usableFromInline
    internal static func create(_ data: Data, @ViewBuilder content: @escaping (Data.Element) -> Content) -> ForEach<Data, ID, Content> {
        assertUnimplemented()
    }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension ForEach {
    @usableFromInline
    internal static func create(_ data: Data, id: KeyPath<Data.Element, ID>, @ViewBuilder content: @escaping (Data.Element) -> Content) -> ForEach<Data, ID, Content> {
        assertUnimplemented()
    }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension ForEach where Data == Range<Int>, ID == Int {
    @usableFromInline
    @_semantics("swiftui.requires_constant_range") internal static func create(_ data: Range<Int>, @ViewBuilder content: @escaping (Int) -> Content) -> ForEach<Data, ID, Content> {
        assertUnimplemented()
    }
}

extension ForEach : DynamicViewContent where Content : View {}

extension ForEach where Content : View {
    static func makeForEachView(view: _GraphValue<ForEach<Data, ID, Content>>, inputs: _ViewInputs) -> _ViewOutputs? {
        if let _ = view as? _GraphValue<ForEach<ForEachSubviewCollection<Content>, Subview.ID, Content>> {
            // <+288>
            assertUnimplemented()
        } else if let _ = view as? _GraphValue<ForEach<ForEachSectionCollection<Content>, SectionConfiguration.ID, Content>> {
            // <+484>
            assertUnimplemented()
        } else {
            return nil
        }
        
        // <+544>
        assertUnimplemented()
    }
}

extension ForEach {
    init(_ data: Data, idGenerator: ForEach<Data, ID, Content>.IDGenerator, content: @escaping (Data.Element) -> Content) {
        self.data = data
        self.idGenerator = idGenerator
        self.content = content
        
        if isLinkedOnOrAfter(.v6) {
            self.obsoleteContentID = 0
        } else {
            self.obsoleteContentID = AGMakeUniqueID()
        }
    }
}

final class ForEachState<Data : RandomAccessCollection, ID : Hashable, Content : View> {
    fileprivate var inputs: _ViewListInputs // 0x10
    private var parentSubgraph: Subgraph // 0x98
    fileprivate var info: Attribute<ForEachState.Info>? = nil // 0xa0
    fileprivate var list: Attribute<ViewList>? = nil // 0xa8
    fileprivate private(set) var view: ForEach<Data, ID, Content>? = nil // 0xb0
    fileprivate var viewsPerElementCount: ForEachState.ViewsPerElementCount = .uninitialized // 0xe8
    private var viewCounts: [Int] = [] // 0xf8
    private var viewCountStyle = _ViewList_IteratorStyle(granularity: 1) // 0x100
    fileprivate private(set) var items: [ID: ForEachState.Item] = .init() // 0x108
    private var edits = ForEachState.LazyEdits() // 0x110
    private var lastTransaction = TransactionID() // 0x160
    private var firstInsertionOffset: Int = -1 // 0x168
    private var contentID: Int = 0 // 0x170
    fileprivate private(set) var seed: UInt32 = 0 // 0x178
    private var createdAllItems: Bool = false // 0x17c
    private var evictionSeed: UInt32 = 0 // 0x180
    private var pendingEviction: Bool = false // 0x184
    private var evictedIDs: Set<ID> = .init() // 0x188
    private var matchingStrategyCache: [ObjectIdentifier: IDTypeMatchingStrategy] = .init() // 0x190
    
    init(inputs: _ViewListInputs) {
        // <+500>
        self.inputs = inputs
        self.parentSubgraph = .current!
    }
    
    func invalidateViewCounts() {
        self.viewCounts.removeAll(keepingCapacity: true)
        self.viewCountStyle = _ViewList_IteratorStyle(granularity: 1)
    }
    
    func update(view: ForEach<Data, ID, Content>) {
        /*
         self -> x20 -> x26
         view -> x0 -> x19 + 0xe8
         */
        // <+1112>
        guard self.parentSubgraph.isValid else {
            return
        }
        
        self.contentID = AGMakeUniqueID()
        // x19 + 0x118
        let oldSeed = self.seed
        self.seed = oldSeed &+ 1
        self.invalidateViewCounts()
        
        // <+1192>
        if
            (self.view != nil),
            case .offset = self.view!.idGenerator
        {
            // <+2376>
            // x27
            let selfCount = self.view!.data.count
            let incomingCount = view.data.count
            
            if selfCount != incomingCount {
                // <+2496>
                Log.externalWarning("\(_typeName(ForEach<Data, ID, Content>.self, qualified: false)) count (\(view.data.count.description) != its initial count (\(self.view!.data.count.description)). `ForEach(_:content:)` should only be used for *constant* data. Instead conform data to `Identifiable` or use `ForEach(_:id:content:)` and provide an explicit `id`!")
            }
            
            // <+2864>
            assertUnimplemented()
        } else {
            // <+1404>
            self.view = view
            
            self.edits = ForEachState.LazyEdits()
            // x19 + 0x80
            let editsBuilder = ForEachState.EditsBuilder(data: view.data, idGenerator: view.idGenerator)
            
            defer {
                // $s7SwiftUI12ForEachStateC6update4viewyAA0cD0Vyxq_q0_G_tF6$deferL_yySkRzSHR_AA4ViewR0_r1_lF
                self.edits = .builder(editsBuilder)
            }
            
            self.lastTransaction = TransactionID(graph: self.list!.identifier.graph)
            
            // <+1828>
            // x19 + 0x120
            let copy_1 = view
            
            if self.firstInsertionOffset >= 0 {
                // <+1888>
                // x21 -> x19 + 0x188
                let items = self.items
                // x22 -> x19 + 0x20 / x19 + 0x160
                // x22 + 0x10
                let itemsCount = items.count
                // x24 -> x19 + 0x30
                // x22
                let evictedIDsCount = self.evictedIDs.count
                // <+2096>
                // x24
                let data = view.data
                assertUnimplemented()
                
                if
                    !view.data.isEmpty,
                    let firstElement = view.data.first
                {
                    // <+3184>
                    // firstElement -> x25 -> x26
                    guard let reuseID = view.reuseID else {
                        preconditionFailure()
                    }
                    
                    // x19 + 0x70 / x19 + 0xe8
                    let function = reuseID.makeGetFunction()
                    // x22
                    let _ = withUnsafePointer(to: firstElement) { pointer in
                        // $sSPy7ElementSTQzGq_Igyr_ACq_s5NeverOIegyrzr_SkRzSHR_7SwiftUI4ViewR0_r1_lTRTA
                        return function(pointer)
                    }
                    
                    // x28
                    let _ = copy_1.data.startIndex
                    copy_1.data.withContiguousStorageIfAvailable { buffer in
                        // $s7SwiftUI12ForEachStateC6update4viewyAA0cD0Vyxq_q0_G_tFySRy7ElementQzGXEfU_TA
                        assertUnimplemented()
                    }
                    
                    assertUnimplemented()
                } else {
                    // <+2368>
                    // <+5644>
                    assertUnimplemented()
                }
            } else {
                // <+2260>
                // <+6612>
                self.firstInsertionOffset = .max
            }
            
            // <+6612>
            self.createdAllItems = false
            return
        }
        
        assertUnimplemented()
    }
    
    func appendViewIDs<V : ViewList>(into accumulator: inout HeterogeneousViewIDsAccumulator, viewList: V) {
        assertUnimplemented()
    }
    
    fileprivate func appendViewIDsForSingleChildView<V : Hashable>(
        into accumulator: inout HeterogeneousViewIDsAccumulator,
        explicitIDKeyPath: KeyPath<Data.Element, V>
    ) {
        assertUnimplemented()
    }
    
    fileprivate func appendViewIDsForSingleChildView(
        into accumulator: inout HeterogeneousViewIDsAccumulator,
        explicitIDOffsets: Range<Int>
    ) {
        assertUnimplemented()
    }
    
    fileprivate func appendViewIDsForMultipleChildren<V : Hashable>(
        into accumulator: inout HeterogeneousViewIDsAccumulator,
        childViewIndices: Range<Int32>,
        explicitIDKeyPath: KeyPath<Data.Element, V>
    ) {
        assertUnimplemented()
    }
    
    fileprivate func appendViewIDsForMultipleChildren(
        into accumulator: inout HeterogeneousViewIDsAccumulator,
        childViewIndices: Range<Int32>,
        explicitIDOffsets: Range<Int>
    ) {
        assertUnimplemented()
    }
    
    fileprivate func appendViewIDsForMultipleChildren<V : Hashable>(
        into accumulator: inout HeterogeneousViewIDsAccumulator,
        childViews: [(index: Int32, implicitID: Int32)],
        explicitIDKeyPath: KeyPath<Data.Element, V>
    ) {
        assertUnimplemented()
    }
    
    fileprivate func appendViewIDsForMultipleChildren(
        into accumulator: inout HeterogeneousViewIDsAccumulator,
        childViews: [(index: Int32, implicitID: Int32)],
        explicitIDOffsets: Range<Int>
    ) {
        assertUnimplemented()
    }
    
    func fetchViewsPerElement() -> Int? {
        assertUnimplemented()
    }
    
    var context: AnyRuleContext {
        assertUnimplemented()
    }
    
    func forEachItem(
        from index: inout Int,
        style: _ViewList_IteratorStyle,
        do body: (inout Int, _ViewList_IteratorStyle, ForEachState<Data, ID, Content>.Item) -> Bool
    ) -> Bool {
        /*
         self -> x20 -> x19
         index -> x0 -> x29 - 0xb0
         style -> x1 -> x20 -> x29 - 0xc0
         body -> x2/x3 -> x29 - 0xd8 / x29 - 0xd0
         */
        // <+256>
        guard self.parentSubgraph.isValid else {
            return true
        }
        
        // x29 - 0xa8
        let endIndex = self.view!.data.endIndex
        // x29 - 0xc8
        var startIndex = self.view!.data.startIndex
        // x23
        var offset: Int
        
        if index < 1 {
            // <+896>
            offset = 0
            // <+1184>
        } else {
            // <+568>
            if let i = self.fetchViewsPerElement() {
                // <+856>
                let applied = style.applyGranularity(to: i)
                
                if index >= applied {
                    // <+908>
                    // applied -> x29 - 0x118
                    let x290x110: Int
                    if applied < 2 {
                        x290x110 = index
                    } else {
                        x290x110 = index / applied
                    }
                    
                    offset = min(self.view!.data.count, x290x110)
                    self.view!.data.formIndex(&startIndex, offsetBy: offset)
                    index = index &- (applied * offset)
                    // <+1184>
                } else {
                    offset = 0
                    // <+1184>
                }
            } else {
                // <+588>
                let viewCounts = self.viewCounts
                
                if !viewCounts.isEmpty {
                    offset = 0
                    
                    if self.viewCountStyle == style {
                        let pivot = viewCounts.lowerBound { offset >= $0 }
                        self.view!.data.formIndex(&startIndex, offsetBy: pivot)
                        
                        // <+792>
                        if offset < 1 {
                            // <+1164>
                            // <+1184>
                        } else {
                            // <+816>
                            index = index &- self.viewCounts[offset &- 1]
                            // <+1184>
                        }
                    } else {
                        // <+1164>
                        // <+1184>
                    }
                } else {
                    // <+1172>
                    offset = 0
                }
            }
        }
        
        // <+1184>
        while startIndex != endIndex {
            // x28
            let item = self.item(at: startIndex, offset: offset)
            let result = body(&index, style, item)
            
            if result {
                // <+1300>
                self.view!.data.formIndex(after: &startIndex)
                offset &+= 1
                // <+1220>
            } else {
                // <+1456>
                return false
            }
        }
        
        // <+1400>
        self.createdAllItems = true
        // <+1504>
        return true
    }
    
    func eraseItem(_ item: ForEachState<Data, ID, Content>.Item) {
        assertUnimplemented()
    }
    
    func item(at index: Data.Index, offset: Int) -> ForEachState<Data, ID, Content>.Item {
        /*
         index -> x19 + 0xd8
         offset -> x19 + 0xe0
         */
        // <+620>
        self.pendingEviction = true
        // self -> x20 -> x19 + 0xd0
        // x22
        let view = self.view
        // x24 (x19 + 0xe8)
        let id = view!.idGenerator.makeID(data: view!.data, index: index, offset: offset)
        // view -> x19 + 0x58
        
        self.evictedIDs.remove(id)
        
        if let existing = self.items[id] /* x29 - 0x88 */ {
            // <+1108>
            // id -> x24 -> x28
            if existing.isRemoved {
                self.uneraseItem(existing)
            }
            
            // <+1160>
            if existing.seed == self.seed {
                if
                    !existing.hasWarned,
                    existing.index != index,
                    isLinkedOnOrAfter(.v3)
                {
                    // <+3940>
                    existing.hasWarned = true
                    Log.externalWarning("\(_typeName(ForEach<Data, ID, Content>.self, qualified: false)): the ID \(id) occurs multiple times within the collection, this will give undefined results!")
                    // <+2004>
                } else {
                    // <+2004>
                }
            } else {
                // <+1908>
                existing.index = index
                existing.offset = offset
                existing.contentID = self.contentID
                existing.seed = self.seed
                // <+2004>
            }
            
            // <+2004>
            existing.timeToLive = 8
            // <+4460>
            return existing
        } else {
            // <+1440>
            // self -> x19 + 0xd0 -> x26
            // x20
            let subgraph1 = self.parentSubgraph
            let graph = subgraph1.graph
            // x22 -> x19 + 0xb0
            let subgraph2 = graph.createSubgraph2(self.info!.identifier)
            subgraph1.addChild(subgraph2)
            
            // <+1532>
            // x19 + 0x258
            var copy_1 = self.inputs
            // x20
            let cachedEnvironment = copy_1.base.cachedEnvironment
            // x29 - 0x100
            let copy_2 = cachedEnvironment.value
            // x19
            let newEnvironment = MutableBox(cachedEnvironment.value)
            copy_1.base.cachedEnvironment = newEnvironment
            
            var countBox: MutableBox<DebugReplaceableViewCount>?
            if copy_1.base[IsInLazyContainer.self] {
                // <+1768>
                countBox = nil
                
                if case .uninitialized = self.viewsPerElementCount {
                    // <+1828>
                    // x21
                    let _countBox = MutableBox<DebugReplaceableViewCount>(.uninitialized)
                    countBox = _countBox
                    copy_1.debugReplaceableViewCount = _countBox
                    // <+2032>
                } else {
                    // <+2032>
                }
            } else {
                // <+2024>
                countBox = nil
                // <+2032>
            }
            
            // <+2032>
            // x19 + 0x108
            var countAttribute: Attribute<Int>?
            // countBox -> x21 -> x19 + 0x98
            // x26 (x19 + 0x60)
            let (content, accessList) = ObservationCenter.current._withObservation { 
                // $s7SwiftUI12ForEachStateC4item2at6offsetAC4ItemCyxq_q0__G5IndexQz_SitFq0_yXEfU_TA
                /*
                 self -> x0 -> x19
                 index -> x1 -> x19 - 0xa8
                 */
                // <+188>
                let view = self.view!
                return view.content(view.data[index])
            }
            
            // <+2444>
            // x19 + 0x110
            var listAttribute: Attribute<any ViewList>? = nil
            // x19 + 0x170
            let outputs: _ViewListOutputs = subgraph2.apply { 
                // $s7SwiftUI12ForEachStateC4item2at6offsetAC4ItemCyxq_q0__G5IndexQz_SitFAA16_ViewListOutputsVyXEfU0_
                /*
                 copy_1 -> x0 -> x29 - 0x130
                 id -> x1 -> x22
                 self -> x2 -> x29 - 0x138
                 content -> x3 -> x29 - 0x150
                 */
                // <+492>
                // id -> x22 -> x27
                copy_1.base.pushStableID(id)
                
                let child = ForEachChild<Data, ID, Content>(_info: self.info!, id: id)
                let childAttribute = Attribute(child)
                childAttribute.value = content
                
                // <+924>
                let accessLists: [ObservationTracking._AccessList]
                if let accessList {
                    accessLists = [accessList]
                } else {
                    accessLists = []
                }
                
                ObservationCenter.current.invalidate(childAttribute, onChangeIn: accessLists)
                // childAttribute -> x29 - 0x148
                
                // <+1500>
                // copy_1 -> x29 - 0x130 -> x24
                if copy_1.options.contains(.requiresContentOffsets) {
                    // <+1572>
                    // w19
                    let count: Attribute<Int>
                    // x22
                    let staticCount: Int
                    if let contentOffset = self.inputs.contentOffset {
                        // <+1616>
                        switch contentOffset {
                        case .staticCount(let _staticCount, _):
                            // <+2136>
                            let itemOffset = Self.ItemOffset(existingCount: OptionalAttribute(), item: nil)
                            count = Attribute(itemOffset)
                            staticCount = _staticCount
                            // <+2376>
                        case .dynamic(let _count, let _staticCount):
                            // <+1636>
                            let itemOffset = Self.ItemOffset(existingCount: OptionalAttribute(_count), item: nil)
                            count = Attribute(itemOffset)
                            staticCount = _staticCount
                            // <+2376>
                        }
                    } else {
                        // <+1884>
                        let itemOffset = Self.ItemOffset(existingCount: OptionalAttribute(), item: nil)
                        count = Attribute(itemOffset)
                        staticCount = 0
                        // <+2376>
                    }
                    
                    // <+2376>
                    copy_1.contentOffset = .dynamic(count: count, staticCount: staticCount)
                    count.identifier.addInput(self.list!.identifier, options: .unknown2, token: 0)
                    
                    // <+2424>
                    countAttribute = count
                } else {
                    // <+2440>
                }
                
                // <+2440>
                let view = _GraphValue(childAttribute)
                // x25
                var outputs = Content.makeDebuggableViewList(view: view, inputs: copy_1)
                
                // <+2580>
                if self.inputs.options.contains(.needsDynamicTraits) {
                    let base = outputs.makeAttribute(inputs: self.inputs)
                    let itemList = Self.ItemList(base: base, item: nil)
                    // x29 - 0x1a8
                    let attribute = Attribute(itemList)
                    listAttribute = attribute
                    attribute.identifier.addInput(self.list!.identifier, options: .unknown2, token: 0)
                    outputs.views = .dynamicList(attribute, nil)
                }
                
                // <+2868>
                return outputs
            }
            
            // <+2536>
            // x19 + 0x158
            let reuseID = view!.reuseID.map { keyPath -> Int in
                // $s7SwiftUI12ForEachStateC4item2at6offsetAC4ItemCyxq_q0__G5IndexQz_SitFSis7KeyPathCy7ElementQzSiGXEfU1_TA
                /*
                 element -> x0 -> x28
                 self -> x1 -> x27
                 index -> x2 -> x29 - 0xa8
                 */
                // <+192>
                return self.view!.data[index][keyPath: keyPath]
            }
            
            // x27
            let item = Self.Item(
                id: id,
                reuseID: reuseID ?? 0,
                views: outputs.views,
                subgraph: subgraph2,
                index: index,
                offset: offset,
                contentID: self.contentID,
                seed: self.seed,
                state: self,
                isConstant: view!.reuseID == nil
            )
            
            // <+3008>
            // x23 (x19 + 0x20)
            let copy_4 = id
            self.items[copy_4] = item
            
            // <+3148>
            if let listAttribute {
                listAttribute.mutateBody(as: Self.ItemList.self, invalidating: true) { itemList in
                    // $s7SwiftUI12ForEachStateC4item2at6offsetAC4ItemCyxq_q0__G5IndexQz_SitFyAC0I4List33_1A3DD35AB7F6976908CD7AF959F34D1FLLVyxq_q0__GzXEfU2_TA
                    itemList.item = item
                }
            }
            
            // <+3284>
            if let countAttribute {
                countAttribute.mutateBody(as: Self.ItemOffset.self, invalidating: true) { itemOffset in
                    // $s7SwiftUI12ForEachStateC4item2at6offsetAC4ItemCyxq_q0__G5IndexQz_SitFyAC0I6Offset33_1A3DD35AB7F6976908CD7AF959F34D1FLLVyxq_q0__GzXEfU3_TA
                    itemOffset.item = item
                }
            }
            
            // <+3416>
            if offset >= self.firstInsertionOffset {
                // <+3448>
                self.edits.appendInsert(id: item.id)
            }
            
            // x23 = x19 + 0x170
            
            // <+3548>
            switch self.viewsPerElementCount {
            case .countingDebugReplaceableViews(let mutableBox):
                // <+3632>
                // <+4424>
                break
            case .resolved(_), .indeterminate:
                // <+3604>
                // <+4424>
                break
            case .uninitialized:
                // <+3664>
                if let staticCount = outputs.staticCount {
                    // <+4124>
                    // <+4408>
                    self.viewsPerElementCount = .resolved(staticCount)
                    // <+4424>
                } else if outputs.staticCount == nil {
                    // <+3680>
                    // x19 + 0xff
                    var flag = false
                    // x19 + 0x148
                    var staticCount: Int? = nil
                    // x19 + 0x1d0
                    var countInputs = _ViewListCountInputs(
                        customInputs: copy_1.base.customInputs,
                        options: copy_1.options,
                        baseOptions: copy_1.base.options,
                        customViewCache: nil,
                        debugReplaceableViewInfo: DebugReplaceableViewInfo(
                            countAsZero: false,
                            countedAsZero: nil
                        )
                    )
                    
                    withUnsafeMutablePointer(to: &flag) { pointer in
                        // $s7SwiftUI12ForEachStateC4item2at6offsetAC4ItemCyxq_q0__G5IndexQz_SitFySpySbGXEfU4_
                        /*
                         pointer -> x0 -> x23
                         self -> x1
                         countInputs -> x2 -> x20
                         staticCount -> x3 -> x22
                         */
                        if self.inputs.base[IsInLazyContainer.self] {
                            countInputs.debugReplaceableViewInfo = DebugReplaceableViewInfo(
                                countAsZero: true,
                                countedAsZero: pointer
                            )
                        }
                        
                        // <+76>
                        // x29 - 0x80
                        let _ = countInputs
                        // sp + 0x50
                        let copy_2 = countInputs
                        // sp
                        let _ = copy_1
                        staticCount = Content._viewListCount(inputs: copy_2)
                    }
                    
                    if
                        copy_1.base[IsInLazyContainer.self],
                        let countBox,
                        flag
                    {
                        // <+3812>
                        if let staticCount {
                            // staticCount -> x21
                            // <+3824>
                            // countBox -> x22
                            switch countBox.value {
                            case .counting(let count):
                                // <+4564>
                                countBox.value = .counting(staticCount + count)
                                self.viewsPerElementCount = .countingDebugReplaceableViews(countBox)
                                // <+4420>
                            case .uninitialized:
                                // <+4596>
                                countBox.value = .counting(staticCount)
                                self.viewsPerElementCount = .countingDebugReplaceableViews(countBox)
                                // <+4420>
                            case .indeterminate:
                                // <+3892>
                                self.viewsPerElementCount = .indeterminate
                                // <+4420>
                            }
                        } else {
                            // <+4172>
                            self.viewsPerElementCount = .indeterminate
                            // <+4196>
                            if LogForEachSlowPath.isEnabled {
                                Log.externalWarning("Unable to determine number of views per element in the collection \(_typeName(Data.self, qualified: false)). If this view only produces one view per element in the collection, consider wrapping views in a VStack to take the fast path.")
                            }
                            // <+4424>
                        }
                    } else {
                        // <+4160>
                        if let staticCount {
                            // <+4368>
                            self.viewsPerElementCount = .resolved(staticCount)
                            // <+4420>
                        } else {
                            // <+4172>
                            self.viewsPerElementCount = .indeterminate
                            // <+4196>
                            if LogForEachSlowPath.isEnabled {
                                Log.externalWarning("Unable to determine number of views per element in the collection \(_typeName(Data.self, qualified: false)). If this view only produces one view per element in the collection, consider wrapping views in a VStack to take the fast path.")
                            }
                            // <+4424>
                        }
                    }
                    
                    // <+4416>
                }
            }
            
            // <+4424>
            return item
        }
    }
    
    func uneraseItem(_ item: ForEachState<Data, ID, Content>.Item) {
        assertUnimplemented()
    }
    
    func evictItems(seed: UInt32) {
        /*
         self -> x20 -> x19
         seed -> w0
         */
        guard
            self.evictionSeed != seed,
            self.pendingEviction
        else {
            // <+1092>
            return
        }
        
        // <+180>
        self.evictionSeed = seed
        
        // x29 - 0x60
        let items: [ForEachState.Item] = .init()
        // x24/x26/x27
        var startIndex = self.items.startIndex
        // x29 - 0xe8 / x29 - 0xf0 / 0x29 - 0xf4
        let endIndex = self.items.endIndex
        var x290xe0 = 64
        
        while !(startIndex == endIndex) && (x290xe0 > 0) {
            // <+552>
            // x29 - 0xc0
            let (id, item) = self.items[startIndex]
            // item -> x24
            
            guard
                !item.isRemoved,
                item.timeToLive == 1
            else {
                // <+412>
                item.timeToLive &-= 1
                self.items.formIndex(after: &startIndex)
                continue
            }
            
            // <+652>
            assertUnimplemented()
            x290xe0 &-= 1
        }
        
        // <+852>
        for item in items {
            self.eraseItem(item)
        }
        
        self.pendingEviction = (x290xe0 == 0)
    }
    
    var traitKeys: ViewTraitKeys? {
        assertUnimplemented()
    }
    
    func count(style: _ViewList_IteratorStyle) -> Int {
        assertUnimplemented()
    }
    
    func estimatedCount(style: _ViewList_IteratorStyle) -> Int {
        assertUnimplemented()
    }
    
    var viewIDs: _ViewList_ID_Views? {
        assertUnimplemented()
    }
    
    func edit(forID id: _ViewList_ID, since: TransactionID) -> _ViewList_Edit? {
        assertUnimplemented()
    }
    
    fileprivate func matchingStrategy<T : Hashable>(for _: T.Type) -> ForEachState<Data, ID, Content>.IDTypeMatchingStrategy {
        assertUnimplemented()
    }
    
    func firstOffset<T : Hashable>(forID id: T, style: _ViewList_IteratorStyle) -> Int? {
        assertUnimplemented()
    }
}

extension ForEachState {
    final class Item {
        fileprivate let subgraph: Subgraph // 0x10
        private var refCount: UInt32 // 0x18
        fileprivate let id: ID // 0x20
        fileprivate let reuseID: Int // 0x28
        fileprivate let views: _ViewListOutputs.Views // 0x30
        fileprivate private(set) weak var state: ForEachState<Data, ID, Content>? = nil // 0x60
        fileprivate var index: Data.Index // 0x68
        fileprivate var offset: Int // 0x70
        fileprivate var contentID: Int // 0x78
        fileprivate var seed: UInt32 // 0x80
        private var isConstant: Bool // 0x84
        fileprivate var timeToLive: Int8 = 8 // 0x85
        fileprivate private(set) var isRemoved: Bool = false // 0x86
        fileprivate var hasWarned: Bool = false // 0x87
        
        init(
            id: ID,
            reuseID: Int,
            views: _ViewListOutputs.Views,
            subgraph: Subgraph,
            index: Data.Index,
            offset: Int,
            contentID: Int,
            seed: UInt32,
            state: ForEachState<Data, ID, Content>,
            isConstant: Bool
        ) {
            /*
             id -> x0 -> x27
             reuseID -> x1 -> x26
             views -> x2 -> x25
             subgraph -> x3 -> sp + 0x8
             index -> x4 -> x24
             offset -> x5 -> x23
             contentID -> x6 -> x22
             seed -> w7 -> sp + 0x4
             state -> x28
             isConstant -> sp
             */
            // <+136>
            self.id = id
            self.reuseID = reuseID
            self.views = views
            self.state = state
            self.index = index
            self.offset = offset
            self.contentID = contentID
            self.seed = seed
            self.isConstant = isConstant
            self.refCount = 1
            self.subgraph = subgraph
        }
        
        func applyTraits(to collection: inout ViewTraitCollection) {
            collection.setValueIfUnset(self.contentID, for: DynamicViewContentIDTraitKey.self)
            collection.setValueIfUnset(self.offset, for: DynamicViewContentOffsetTraitKey.self)
            
            if self.isConstant {
                // <+84>
                collection.setValueIfUnset(.tagged(self.offset), for: TagValueTraitKey<Int>.self)
            } else {
                // <+100>
                collection.setTagIfUnset(for: ID.self, value: self.id)
            }
        }
        
        func invalidate() {
            assertUnimplemented()
        }
        
        // TODO
    }
    
    fileprivate enum IDTypeMatchingStrategy {
        case exact
        case anyHashable
        case customIDRepresentation
        case noMatch
    }
    
    /*
     countingDebugReplaceableViews -> (value, 0)
     resolved -> (value, 1)
     uninitialized -> (0, 2)
     indeterminate -> (1, 2)
     */
    enum ViewsPerElementCount {
        case countingDebugReplaceableViews(MutableBox<DebugReplaceableViewCount>)
        case resolved(Int)
        case uninitialized
        case indeterminate
        
        fileprivate mutating func resolvedCount() -> Int? {
            switch self {
            case .countingDebugReplaceableViews(let box):
                switch box.value {
                case .counting(let count):
                    // <+124>
                    self = .resolved(count)
                    return count
                case .uninitialized:
                    // <+180>
                    return nil
                case .indeterminate:
                    // <+92>
                    self = .indeterminate
                    return nil
                }
            case .resolved(let count):
                return count
            case .uninitialized:
                return nil
            case .indeterminate:
                return nil
            }
        }
    }
    
    fileprivate enum LazyEdits {
        case builder(ForEachState<Data, ID, Content>.EditsBuilder)
        case raw(ForEachState<Data, ID, Content>.Edits)
        
        init() {
            self = .raw(ForEachState.Edits())
        }
        
        func finalized() -> ForEachState<Data, ID, Content>.Edits {
            assertUnimplemented()
        }
        
        mutating func appendInsert(id: ID) {
            assertUnimplemented()
        }
    }
    
    fileprivate struct EditsBuilder {
        private var data: Data
        private var idGenerator: ForEach<Data, ID, Content>.IDGenerator
        private var insertOffsets = IndexSetBuilder()
        private var edits = ForEachState<Data, ID, Content>.Edits()
        
        init(data: Data, idGenerator: ForEach<Data, ID, Content>.IDGenerator) {
            // <+212>
            self.data = data
            self.idGenerator = idGenerator
        }
        
        func appendInsert(atOffset offset: Int) {
            assertUnimplemented()
        }
        
        func removeInserts(afterOffset offset: Int) {
            assertUnimplemented()
        }
    }
    
    struct Evictor : Rule, AsyncAttribute {
        fileprivate private(set) var state: ForEachState<Data, ID, Content>
        @WeakAttribute var isEnabled: Bool?
        @Attribute fileprivate private(set) var updateSeed: UInt32
        
        var value: Void {
            /*
             state -> x0 -> x20
             updateSeed -> x2 -> x19
             */
            if self.isEnabled ?? ForEachEvictionInput.evictByDefault {
                // <+52>
                self.state.evictItems(seed: self.updateSeed)
            } else {
                // <+80>
            }
        }
    }
    
    struct Info {
        fileprivate private(set) var state: ForEachState<Data, ID, Content>
        private var seed: UInt32
    }
    
    fileprivate struct Edits {
        private var removes: Set<ID>
        private var inserts: Set<ID>
        
        @inline(always)
        init(removes: Set<ID> = Set([]), inserts: Set<ID> = Set([])) {
            self.removes = removes
            self.inserts = inserts
        }
    }
    
    fileprivate struct ItemList : Rule {
        @Attribute private(set) var base: ViewList
        var item: ForEachState<Data, ID, Content>.Item?
        
        var value: any ViewList {
            assertUnimplemented()
        }
    }
}

extension ForEachState.Info {
    struct Init : Rule, CustomStringConvertible {
        @Attribute fileprivate private(set) var view: ForEach<Data, ID, Content>
        fileprivate let state: ForEachState<Data, ID, Content>
        
        var description: String {
            assertUnimplemented()
        }
        
        var value: ForEachState.Info {
            let state = self.state
            state.update(view: self.view)
            
            return ForEachState.Info(state: state, seed: state.seed)
        }
    }
}

extension ForEach {
    enum IDGenerator {
        case keyPath(KeyPath<Data.Element, ID>)
        case offset
        
        var isConstant: Bool {
            switch self {
            case .keyPath(_):
                return false
            case .offset:
                return true
            }
        }
        
        func makeID(data: Data, index: Data.Index, offset: Int) -> ID {
            /*
             data -> x0 -> x19
             index -> x1 -> x23
             offset -> x2 -> x29 - 0x80
             return pointer -> x8 -> x29 - 0x78
             */
            // <+140>
            switch self {
            case .keyPath(let keyPath):
                return data[index][keyPath: keyPath]
            case .offset:
                return unsafeBitCast(offset, to: ID.self)
            }
        }
    }
}

struct IndexSetBuilder {
    private var indexSet = IndexSet()
    private var lastRange: Range<Int>? = nil
}

/*
 counting -> (value, 0)
 uninitialized -> (0, 1)
 indeterminate -> (1, 1)
 */
enum DebugReplaceableViewCount {
    case counting(Int)
    case uninitialized
    case indeterminate
}

struct ForEachEvictionInput : GraphInput {
    static var defaultValue: WeakAttribute<Bool> {
        return WeakAttribute()
    }
    
    // $s7SwiftUI20ForEachEvictionInputV14evictByDefault_WZ
    static let evictByDefault: Bool = isLinkedOnOrAfter(.v6)
}

fileprivate struct ForEachList<Data : RandomAccessCollection, ID : Hashable, Content : View>: ViewList, CustomStringConvertible {
    private(set) var state: ForEachState<Data, ID, Content>
    private(set) var seed: UInt32
    
    var description: String {
        assertUnimplemented()
    }
    
    var traits: ViewTraitCollection {
        assertUnimplemented()
    }
    
    var traitKeys: ViewTraitKeys? {
        assertUnimplemented()
    }
    
    var viewIDs: _ViewList_ID_Views? {
        assertUnimplemented()
    }
    
    func appendViewIDs(into: inout HeterogeneousViewIDsAccumulator) {
        assertUnimplemented()
    }
    
    func count(style: _ViewList_IteratorStyle) -> Int {
        assertUnimplemented()
    }
    
    func estimatedCount(style: _ViewList_IteratorStyle) -> Int {
        assertUnimplemented()
    }
    
    func edit(forID: _ViewList_ID, since: TransactionID) -> _ViewList_Edit? {
        assertUnimplemented()
    }
    
    func firstOffset<T>(forID: T, style: _ViewList_IteratorStyle) -> Int? where T : Hashable {
        assertUnimplemented()
    }
    
    func print(into: inout SExpPrinter) {
        assertUnimplemented()
    }
    
    func applyNodes(
        from index: inout Int,
        style: _ViewList_IteratorStyle,
        list: Attribute<any ViewList>?,
        transform: borrowing _ViewList_TemporarySublistTransform,
        to body: (inout Int, _ViewList_IteratorStyle, _ViewList_Node, borrowing _ViewList_TemporarySublistTransform) -> Bool
    ) -> Bool {
        let state = self.state
        return state.forEachItem(from: &index, style: style) { index, style, item in
            // $s7SwiftUI12ForEachStateC10applyNodes4from5style4list9transform2toSbSiz_AA23_ViewList_IteratorStyleV14AttributeGraph0Q0VyAA0mN0_pGSgAA01_mN26_TemporarySublistTransformVSbSiz_AkA01_mN5_NodeOAStXEtFSbSiz_AkC4ItemCyxq_q0__GtXEfU_TA
            /*
             index -> x0 -> x19 + 0x90
             style -> x1 -> x19 + 0x98
             item -> x2 -> x21
             state -> x3 -> x26
             transform -> x4/w5 -> x19 + 0x60
             body -> x6/x7 -> x19 + 0x70 / (x25 -> x19 + 0x58)
             */
            // state.view -> x20
            // x24
            let reuseID = state.view!.reuseID
            // x29 - 0xa0
            let views = item.views
            
            switch views {
            case .staticList(let list):
                // <+824>
                // reuseID -> x19 + 0x80
                // x29 - 0xc8
                let copy_1 = views
                let count = list.count
                let appliedCount = style.applyGranularity(to: count)
                
                if index >= appliedCount {
                    // <+1200>
                    index = appliedCount
                    return true
                } else {
                    // <+932>
                    // x29 - 0xd8
                    var viewListID = _ViewList_ID(implicitID: 0)
                    
                    if let reuseID {
                        // <+952>
                        // x24
                        let id = item.id
                        // x19 + 0x8
                        let listAttribute = state.list!
                        // x20/w22
                        let resolvedCount = state.viewsPerElementCount.resolvedCount()
                        
                        viewListID
                            .bind(
                                explicitID: id,
                                owner: listAttribute.identifier,
                                isUnary: resolvedCount == 1,
                                reuseID: item.reuseID
                            )
                        
                        // <+1524>
                    } else {
                        // <+1220>
                        // w28
                        let listAttribute = state.list!
                        // x19 + 0x10
                        let offset = item.offset
                        // x20/w22
                        let resolvedCount = state.viewsPerElementCount.resolvedCount()
                        
                        viewListID
                            .bind(
                                explicitID: AnyHashable2(
                                    ForEachConstantID(
                                        offset,
                                        listAttribute
                                    )
                                ),
                                owner: listAttribute.identifier,
                                isUnary: resolvedCount == 1,
                                reuseID: item.reuseID
                            )
                        
                        // <+1524>
                    }
                    
                    // <+1524>
                    // x19 + 0x108
                    let sublist = _ViewList_Sublist(
                        start: index,
                        count: count,
                        id: viewListID,
                        elements: _ViewList_SubgraphElements(base: list, subgraphs: _ViewList_SublistSubgraphStorage(subgraphs: [])),
                        traits: ViewTraitCollection(),
                        list: nil
                    )
                    
                    let forEachTransform = ForEachState<Data, ID, Content>
                        .Transform(
                            item: item,
                            bindID: false,
                            isUnary: state.viewsPerElementCount.resolvedCount() == 1,
                            isConstant: reuseID == nil
                        )
                    
                    let result: Bool = transform.withPushedItem(forEachTransform) { transform in
                        // $s7SwiftUI12ForEachStateC10applyNodes4from5style4list9transform2toSbSiz_AA23_ViewList_IteratorStyleV14AttributeGraph0Q0VyAA0mN0_pGSgAA01_mN26_TemporarySublistTransformVSbSiz_AkA01_mN5_NodeOAStXEtFSbSiz_AkC4ItemCyxq_q0__GtXEfU_SbASXEfU_TA
                        return body(&index, style, .sublist(sublist), transform)
                    }
                    
                    return result
                }
            case .dynamicList(let listAttribute, let modifier):
                // <+344>
                // x19 + 0xb0
                var viewList = RuleContext(attribute: state.info!).valueAndFlags(of: listAttribute, options: []).value
                
                if let modifier {
                    modifier.apply(to: &viewList)
                }
                
                // <+472>
                // transform -> x19 + 0x60 -> x19 + 0xe0
                // x20 / w26
                let resolvedCount = state.viewsPerElementCount.resolvedCount()
                
                // x29 - 0xc8
                let forEachTransform = ForEachState<Data, ID, Content>.Transform(
                    item: item,
                    bindID: true,
                    isUnary: resolvedCount == 1,
                    isConstant: reuseID == nil
                )
                
                let result: Bool = transform.withPushedItem(forEachTransform) { transform in
                    // $s7SwiftUI12ForEachStateC10applyNodes4from5style4list9transform2toSbSiz_AA23_ViewList_IteratorStyleV14AttributeGraph0Q0VyAA0mN0_pGSgAA01_mN26_TemporarySublistTransformVSbSiz_AkA01_mN5_NodeOAStXEtFSbSiz_AkC4ItemCyxq_q0__GtXEfU_SbASXEfU0_TA
                    return viewList.applyNodes(from: &index, style: style, list: listAttribute, transform: transform, to: body)
                }
                
                // <+1932>
                return result
            }
        }
    }
}

extension ForEachList {
    struct Init : StatefulRule, AsyncAttribute, CustomStringConvertible {
        fileprivate private(set) var _info: Attribute<ForEachState<Data, ID, Content>.Info>
        fileprivate private(set) var seed: UInt32
        
        var description: String {
            assertUnimplemented()
        }
        
        var info: ForEachState<Data, ID, Content>.Info {
            return _info.value
        }
        
        typealias Value = any ViewList
        
        func updateValue() {
            self.info.state.invalidateViewCounts()
            let list = ForEachList(state: self.info.state, seed: self.seed)
            self.value = list
        }
    }
}

struct IsInLazyContainer : ViewInputBoolFlag {
}

fileprivate struct ForEachChild<Data : RandomAccessCollection, ID : Hashable, Content : View> : StatefulRule, CustomStringConvertible where Data : RandomAccessCollection, ID : Hashable {
    private(set) var _info: Attribute<ForEachState<Data, ID, Content>.Info>
    let id: ID
    
    var description: String {
        assertUnimplemented()
    }
    
    var info: ForEachState<Data, ID, Content>.Info {
        return _info.value
    }
    
    typealias Value = Content
    
    func updateValue() {
        // <+684>
        // x25
        let state = self.info.state
        // x27
        // x29 - 0xc8 -> x19
        guard
            let item = state.items[self.id],
            item.seed == state.seed
        else {
            return
        }
        
        let content: Content = ObservationCenter.current._withObservation(attribute: Attribute<Content>(identifier: .current!)) { 
            // $s7SwiftUI12ForEachChild33_1A3DD35AB7F6976908CD7AF959F34D1FLLV11updateValueyyFq0_yXEfU_TA
            /*
             state -> x0 -> x22
             item -> x1 -> x29 - 0xe8
             */
            // x20
            let view = state.view!
            // x28
            let index = item.index
            let element = view.data[index]
            return view.content(element)
        }
        
        // <+2104>
        self.value = content
    }
}

extension ForEachState {
    fileprivate struct ItemOffset : Rule {
        @OptionalAttribute var existingCount: Int?
        var item: ForEachState<Data, ID, Content>.Item?
        
        var value: Int {
            assertUnimplemented()
        }
    }
    
    fileprivate struct Transform : _ViewList_SublistTransform_Item {
        private(set) var item: ForEachState<Data, ID, Content>.Item // 0x0
        private(set) var bindID: Bool // 0x8
        private(set) var isUnary: Bool // 0x9
        private(set) var isConstant: Bool // 0xa
        
        static var flags: _ViewList_SublistTransform_ItemFlags {
            return [.graphDependent]
        }
        
        func apply(sublist: inout _ViewList_Sublist) {
            /*
             sublist -> x0 -> x21
             self.item -> x1 -> x19
             self.bindID/self.isUnary/self.isConstant -> w2
             */
            self.bindID(&sublist.id)
            
            sublist
                .elements
                .subgraphs
                .subgraphs
                .append(_ViewList_Subgraph(subgraph: self.item.subgraph))
            
            self.item.applyTraits(to: &sublist.traits)
        }
        
        func bindID(_ id: inout _ViewList_ID) {
            /*
             id -> x0 -> x20
             self.item -> x1 -> x23
             self.bindID/self.isUnary/self.isConstant -> w2 -> w24
             */
            guard
                isConstant,
                let state = item.state,
                let list = state.list
            else {
                return
            }
            
            if !isUnary {
                // <+100>
                id
                    .bind(
                        explicitID: item.id,
                        owner: list.identifier,
                        isUnary: isUnary,
                        reuseID: item.reuseID
                    )
            } else {
                // <+140>
                id
                    .bind(
                        explicitID: ForEachConstantID(
                            item.offset,
                            list.identifier
                        ),
                        owner: list.identifier,
                        isUnary: isUnary,
                        reuseID: item.reuseID
                    )
            }
        }
        
        func wrapSubgraph(into storage: inout _ViewList_SublistSubgraphStorage) {
            assertUnimplemented()
        }
    }
}

fileprivate struct LogForEachSlowPath : UserDefaultKeyedFeature {
    static let key = "LogForEachSlowPath"
    
    static nonisolated(unsafe) var cachedValue: Bool? = nil
    
    static var defaultValue: Bool {
        return false
    }
}

struct ForEachConstantID : Hashable {
    private var offset: Int
    private var owner: AnyAttribute
    
    init(_ offset: Int, _ owner: AnyAttribute) {
        self.offset = offset
        self.owner = owner
    }
    
    init<T>(_ offset: Int, _ owner: Attribute<T>) {
        self.offset = offset
        self.owner = owner.identifier
    }
}
