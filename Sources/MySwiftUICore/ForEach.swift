// 1A3DD35AB7F6976908CD7AF959F34D1F
internal import AttributeGraph
private import Foundation

public struct ForEach<Data, ID, Content> where Data : RandomAccessCollection, ID : Hashable {
    public var data: Data
    public var content: (Data.Element) -> Content
    fileprivate private(set) var idGenerator: ForEach<Data, ID, Content>.IDGenerator
    private var reuseID: KeyPath<Data.Element, Int>? = nil
    private var obsoleteContentID: Int
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

final class ForEachState<Data : RandomAccessCollection, ID : Hashable, Content> {
    private var inputs: _ViewListInputs // 0x10
    private var parentSubgraph: Subgraph // 0x98
    fileprivate var info: Attribute<ForEachState.Info>? = nil // 0xa0
    fileprivate var list: Attribute<ViewList>? = nil // 0xa8
    private var view: ForEach<Data, ID, Content>? = nil // 0xb0
    private var viewsPerElementCount: ForEachState.ViewsPerElementCount = .uninitialized // 0xe8
    private var viewCounts: [Int] = [] // 0xf8
    private var viewCountStyle = _ViewList_IteratorStyle(granularity: 1) // 0x100
    private var items: [ID: ForEachState.Item] = .init() // 0x108
    private var edits = ForEachState.LazyEdits() // 0x110
    private var lastTransaction = TransactionID() // 0x160
    private var firstInsertionOffset: Int = -1 // 0x168
    private var contentID: Int = 0 // 0x170
    private var seed: UInt32 = 0 // 0x178
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
        self.evictionSeed &+= 1
        self.invalidateViewCounts()
        
        // <+1192>
        if (self.view != nil), case .offset = self.view!.idGenerator {
            // <+2376>
            assertUnimplemented()
        } else {
            // <+1404>
            self.view = view
            
            self.edits = ForEachState.LazyEdits()
            let editsBuilder = ForEachState.EditsBuilder(data: view.data, idGenerator: view.idGenerator)
            
            defer {
                // $s7SwiftUI12ForEachStateC6update4viewyAA0cD0Vyxq_q0_G_tF6$deferL_yySkRzSHR_AA4ViewR0_r1_lF
                self.edits = .builder(editsBuilder)
            }
            
            self.lastTransaction = TransactionID(graph: self.list!.identifier.graph)
            
            // <+1828>
            if self.firstInsertionOffset >= 0 {
                // <+1888>
                assertUnimplemented()
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
        
        if index < 1 {
            // <+896>
            // <+1184>
        } else {
            // <+568>
            if let i = self.fetchViewsPerElement() {
                // <+856>
                let applied = style.applyGranularity(to: i)
                
                if index >= applied {
                    // <+908>
                    assertUnimplemented()
                } else {
                    // <+1184>
                }
            } else {
                // <+588>
                for count in viewCounts {
                    assertUnimplemented()
                }
                // <+1172>
            }
        }
        
        // <+1184>
        // x23
        var offset = 0
        while startIndex != endIndex {
            // x28
            let item = self.item(at: startIndex, offset: offset)
            assertUnimplemented()
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
        let view = self.view!
        // x24 (x19 + 0xe8)
        let id = view.idGenerator.makeID(data: view.data, index: index, offset: offset)
        _ = consume view
        
        self.evictedIDs.remove(id)
        
        if let existing = self.items[id] {
            // <+1108>
            assertUnimplemented()
        } else {
            // <+1440>
            assertUnimplemented()
        }
        
        assertUnimplemented()
    }
    
    func uneraseItem(_ item: ForEachState<Data, ID, Content>.Item) {
        assertUnimplemented()
    }
    
    func evictItems(seed: UInt32) {
        assertUnimplemented()
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
        private let subgraph: Subgraph // 0x10
        private var refCount: UInt32 // 0x18
        private let id: ID // 0x20
        private let reuseID: Int // 0x28
        private let views: _ViewListOutputs.Views // 0x30
        private weak var state: ForEachState<Data, ID, Content>? // 0x60
        private var index: Data.Index // 0x68
        private var offset: Int // 0x70
        private var contentID: Int // 0x78
        private var seed: UInt32 // 0x80
        private var isConstant: Bool // 0x84
        private var timeToLive: Int8 // 0x85
        private var isRemoved: Bool // 0x86
        private var hasWarned: Bool // 0x87
        
        init() {
            assertUnimplemented()
        }
        
        func applyTraits(to collection: inout ViewTraitCollection) {
            assertUnimplemented()
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
    
    enum ViewsPerElementCount {
        case countingDebugReplaceableViews(MutableBox<DebugReplaceableViewCount>)
        case resolved(Int)
        case uninitialized
        case indeterminate
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
            assertUnimplemented()
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
            assertUnimplemented()
        }
    }
}

struct IndexSetBuilder {
    private var indexSet = IndexSet()
    private var lastRange: Range<Int>? = nil
}

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

fileprivate struct ForEachList<Data : RandomAccessCollection, ID : Hashable, Content>: ViewList, CustomStringConvertible {
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
    
    func applyNodes(from index: inout Int, style: _ViewList_IteratorStyle, list: AttributeGraph::Attribute<any ViewList>?, transform: borrowing _ViewList_TemporarySublistTransform, to: (inout Int, _ViewList_IteratorStyle, _ViewList_Node, borrowing _ViewList_TemporarySublistTransform) -> Bool) -> Bool {
        return self.state.forEachItem(from: &index, style: style) { index, style, state in
            // $s7SwiftUI12ForEachStateC10applyNodes4from5style4list9transform2toSbSiz_AA23_ViewList_IteratorStyleV14AttributeGraph0Q0VyAA0mN0_pGSgAA01_mN26_TemporarySublistTransformVSbSiz_AkA01_mN5_NodeOAStXEtFSbSiz_AkC4ItemCyxq_q0__GtXEfU_TA
            assertUnimplemented()
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
