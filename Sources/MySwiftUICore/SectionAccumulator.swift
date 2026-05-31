// D22569EAA67164B36532D028EDA82857
internal import AttributeGraph

struct SectionAccumulator {
    private var rowIDAccumulator: SectionAccumulator.RowIDAccumulator // 0x0
    private var lastExplicitSectionEnd: Int = 0 // 0x68
    private var list: (any ViewList)? = nil // 0x70
    private var contentSubgraph: Subgraph? = nil // 0x98
    private(set) var items: [SectionAccumulator.Item] = [] // 0xa0
    private(set) var subgraphStorage: _ViewList_SublistSubgraphStorage? = nil // 0xa8
    private(set) var options: SectionAccumulator.Options = [] // 0xb0
    private(set) var viewCount: Int = 0 // 0xb8
    private var pendingEmptySectionTraits: [ViewTraitCollection] = [] // 0xc0
    
    static func processUnsectionedContent(
        list: any ViewList,
        contentSubgraph: Subgraph?,
        accumulationStrategy: SectionAccumulator.RowIDAccumulationStrategy
    ) -> [SectionAccumulator.Item]? {
        /*
         list -> x0 -> x22
         contentSubgraph -> x1 -> x19
         accumulationStrategy -> x2 -> w21
         */
        // sp + 0x10
        guard
            let traitKeys = list.traitKeys, // x20
            !traitKeys.contains(IsSectionedTraitKey.self)
        else {
            return nil
        }
        
        // <+120>
        if
            let viewIDs = list.viewIDs,
            viewIDs.endIndex == 0
        {
            return []
        }
        
        // <+192>
        return Update.locked { 
            // $s7SwiftUI18SectionAccumulatorV4ItemV16implicitSentinel_15contentSubgraph20accumulationStrategyAeA8ViewList_p_So13AGSubgraphRefaSgAC017RowIDAccumulationK0OtFZAEyXEfU_
            /*
             list -> x0
             contentSubgraph -> x1
             accumulationStrategy -> w2
             */
            assertUnimplemented()
        }
    }
    
    init(
        contentSubgraph: Subgraph?,
        options: SectionAccumulator.Options = [],
        accumulationStrategy: SectionAccumulator.RowIDAccumulationStrategy
    ) {
        self.contentSubgraph = contentSubgraph
        self.options = options
        
        switch accumulationStrategy {
        case .chunked:
            // <+144>
            self.rowIDAccumulator = .chunked([])
        case .heterogeneous:
            // <+84>
            self.rowIDAccumulator = .heterogeneous(HeterogeneousViewIDsAccumulator())
        }
        
        // <+168>
        if options.contains(.retainSubgraphs) {
            self.subgraphStorage = _ViewList_SublistSubgraphStorage(subgraphs: [])
        }
    }
    
    mutating func formResult(from list: any ViewList, listAttribute: Attribute<any ViewList>?) {
        /*
         self -> x20 -> x19
         list -> x0 -> x21
         listAttribute -> x1 -> x20
         */
        self.list = list
        Update.begin()
        
        // x29 - 0x38
        var index = 0
        list.applyNodes(
            from: &index,
            style: _ViewList_IteratorStyle(granularity: 1),
            list: listAttribute,
            transform: _ViewList_TemporarySublistTransform(),
            to: { index, style, node, transform in
                // $s7SwiftUI18SectionAccumulatorV10formResult4from13listAttributeyAA8ViewList_p_0I5Graph0I0VyAaG_pGSgtFSbSiz_AA01_jK14_IteratorStyleVAA01_jK5_NodeOAA01_jK26_TemporarySublistTransformVtXEfU_TA
                return self.apply(
                    start: &index,
                    style: style,
                    node: node,
                    transform: transform
                )
            }
        )
        
        // <+176>
        if self.lastExplicitSectionEnd >= self.viewCount {
            // <+200>
        } else {
            self.appendImplicitSection()
        }
        
        // <+200>
        if self.items.isEmpty {
            if self.viewCount < 1 {
                self.items = []
            } else {
                let accumulationStrategy: RowIDAccumulationStrategy
                switch self.rowIDAccumulator {
                case .chunked(_):
                    accumulationStrategy = .chunked
                case .heterogeneous(_):
                    accumulationStrategy = .heterogeneous
                }
                
                self.items = [
                    SectionAccumulator.Item.implicitSentinel(
                        list,
                        contentSubgraph: nil,
                        accumulationStrategy: accumulationStrategy
                    )
                ]
            }
        }
        
        Update.end()
        
        // <+408>
        self.list = nil
    }
    
    fileprivate mutating func apply(
        start: inout Int,
        style: _ViewList_IteratorStyle,
        node: _ViewList_Node,
        transform: borrowing _ViewList_TemporarySublistTransform
    ) -> Bool {
        /*
         self -> x20 -> x21
         start -> x0 -> x23
         style -> x1 -> x28
         node -> x2
         transform -> x3 -> x25/w27
         */
        // x29 - 0xc8
        let copy_1 = node
        
        switch copy_1 {
        case .list(let list):
            // <+108>
            // x19 + 0x1c0
            let traitKeys = list.0.traitKeys
            
            if
                let traitKeys,
                !traitKeys.contains(IsSectionedTraitKey.self)
            {
                // <+1368>
                // x28
                let listCount = list.0.count
                // x20
                let rowIDAccumulatorCount = self.rowIDAccumulator.count
                
                switch self.rowIDAccumulator {
                case .chunked(var chunked):
                    // <+1728>
                    // rowIDAccumulatorCount -> x20 -> x19 + 0x10
                    // inlined
                    // x27/x28
                    let copiedTransform = transform.copy()
                    
                    // <+2932>
                    // inlined
                    let chunk = SectionAccumulator.RowIDs.Chunk(
                        list: list.0,
                        listAttribute: list.1,
                        transform: copiedTransform,
                        start: start,
                        count: listCount,
                        lowerBound: rowIDAccumulatorCount
                    )
                    
                    // <+3868>
                    chunked.append(chunk)
                    self.rowIDAccumulator = .chunked(chunked)
                    // <+4096>
                case .heterogeneous(var accumulator):
                    // <+1444>
                    // x19 + 0x170
                    var listID = _ViewList_ID()
                    // inlined
                    transform.bindID(&listID)
                    // <+2684>
                    if let first = listID.explicitIDs.first {
                        let anyValue = first.id.anyValue
                        
                        func project<T : Hashable>(value: T) {
                            accumulator
                                .withExplicitID(
                                    value,
                                    isUnary: listID.explicitIDs.first?.isUnary ?? false,
                                    body: { accumulator in
                                        // $s7SwiftUI18SectionAccumulatorV5apply33_D22569EAA67164B36532D028EDA82857LL5start5style4node9transformSbSiz_AA23_ViewList_IteratorStyleVAA01_oP5_NodeOAA01_oP26_TemporarySublistTransformVtFyAA013Heterogeneouso3IDsD0VzXEfU_TA
                                        list.0.appendViewIDs(into: &accumulator)
                                    }
                                )
                        }
                        
                        _openExistential(anyValue, do: project)
                        // <+4048>
                    } else {
                        // <+3624>
                        list.0.appendViewIDs(into: &accumulator)
                        // <+4048>
                    }
                    
                    // <+4048>
                    self.rowIDAccumulator = .heterogeneous(accumulator)
                    // <+4096>
                }
                
                // <+4096>
                self.viewCount += listCount
                return true
            } else {
                // <+216>
                return list.0.applyNodes(
                    from: &start,
                    style: style,
                    list: list.1,
                    transform: transform,
                    to: { index, style, node, transform in
                        // $s7SwiftUI18SectionAccumulatorV5apply33_D22569EAA67164B36532D028EDA82857LL5start5style4node9transformSbSiz_AA23_ViewList_IteratorStyleVAA01_oP5_NodeOAA01_oP26_TemporarySublistTransformVtFSbSiz_AkmOtXEfU0_TA
                        self.apply(start: &index, style: style, node: node, transform: transform)
                    }
                )
            }
        case .sublist(let sublist):
            // <+528>
            // x19 + 0x100
            var copy_2 = sublist
            transform.apply(sublist: &copy_2)
            // x20
            let count = self.rowIDAccumulator.count
            // x19 + 0x1c0
            let copy_3 = self.rowIDAccumulator
            
            switch copy_3 {
            case .chunked(var chunks):
                // <+1096>
                let chunk = SectionAccumulator.RowIDs.Chunk(
                    ids: .sublist(
                        _ViewList_ID.ElementCollection(
                            id: copy_2.id,
                            count: copy_2.count
                        )
                    ),
                    count: copy_2.count,
                    lowerBound: count
                )
                
                chunks.append(chunk)
                self.rowIDAccumulator = .chunked(chunks)
                // <+1188>
            case .heterogeneous(let accumulator):
                // <+628>
                // x19 + 0x60
                var copy_4 = accumulator
                copy_2.appendViewIDs(into: &copy_4)
                self.rowIDAccumulator = .heterogeneous(copy_4)
                // <+1188>
            }
            
            // <+1188>
            self.viewCount += copy_2.count
            return true
        case .group(let group):
            // <+356>
            // x22
            let lists = group.lists
            
            for list in lists {
                let result = self.apply(
                    start: &start,
                    style: style,
                    node: .list(list.list, list.attribute),
                    transform: transform
                )
                
                guard result else {
                    return false
                }
            }
            
            return true
        case .section(let section):
            // <+724>
            if self.lastExplicitSectionEnd >= self.viewCount {
                // <+768>
            } else {
                self.appendImplicitSection()
            }
            
            // <+768>
            let style = _ViewList_IteratorStyle(granularity: 1)
            let count = section.count(style: style)
            
            // <+812>
            if count < 1 {
                // <+1216>
                self.lastExplicitSectionEnd = self.viewCount
                
                let itemsCount = self.items.count
                if itemsCount != 0 {
                    self.items[itemsCount &- 1].traits.append(section.traits)
                } else {
                    // <+1776>
                    self.pendingEmptySectionTraits.append(section.traits)
                }
                
                // <+4120>
                return true
            } else {
                // <+820>
                let contentCount = section.content.list.count
                
                if
                    self.options.contains(.retainSubgraphs),
                    var subgraphStorage
                {
                    transform.wrapSubgraphs(into: &subgraphStorage)
                    self.subgraphStorage = subgraphStorage
                }
                
                // <+948>
                // inlined
                // x19 + 0x1c0
                var item = SectionAccumulator.Item(
                    features: [],
                    list: section,
                    contentSubgraph: self.contentSubgraph,
                    sectionList: section,
                    transform: transform.copy(), // inlined
                    ids: SectionAccumulator.RowIDs(chunks: []), // 원래 초기값 없음
                    headerCount: 0, // 원래 초기값 없음
                    footerCount: 0, // 원래 초기값 없음
                    id: section.id,
                    start: 0,
                    traits: self.pendingEmptySectionTraits
                )
                
                // <+1888>
                // x19 + 0x198
                let content = section.content
                // x19 + 0x60
                let copy_2 = self.rowIDAccumulator
                // x25
                let chunks: [SectionAccumulator.RowIDs.Chunk]
                switch copy_2 {
                case .chunked(let array):
                    // <+2196>
                    // inlined
                    let chunk = SectionAccumulator.RowIDs.Chunk(
                        list: content.list,
                        listAttribute: content.attribute,
                        transform: item.transform,
                        start: 0,
                        count: contentCount,
                        lowerBound: 0
                    )
                    
                    chunks = [chunk]
                    // <+3080>
                case .heterogeneous(_):
                    // <+1988>
                    // x19 + 0x60
                    var accumulator = HeterogeneousViewIDsAccumulator()
                    content.list.appendViewIDs(into: &accumulator)
                    // x19 + 0x170 (x24)
                    let viewIDs = accumulator.finalize()
                    
                    let chunk = SectionAccumulator.RowIDs.Chunk(
                        ids: .heterogeneousViewIDs(viewIDs),
                        count: viewIDs.count,
                        lowerBound: 0
                    )
                    
                    chunks = [chunk]
                    // <+3080>
                }
                
                // <+3080>
                item.ids = SectionAccumulator.RowIDs(chunks: chunks)
                // x26
                let headerCount = section.header.list.count
                // x27
                let footerCount = section.footer.list.count
                // <+3236>
                item.traits.append(contentsOf: [section.traits])
                item.headerCount = headerCount
                item.footerCount = footerCount
                
                // <+3392>
                // x19 + 0x60
                let copy_3 = item
                self.items.append(copy_3)
                
                // <+3504>
                self.pendingEmptySectionTraits.removeAll(keepingCapacity: true)
                // <+3588>
                self.viewCount += count
                self.lastExplicitSectionEnd = self.viewCount
                
                return true
            }
        }
    }
    
    fileprivate mutating func appendImplicitSection() {
        // self -> x20 -> x19
        // sp + 0xb0
        guard let copy_1 = self.list else {
            preconditionFailure("Missing list")
        }
        
        // <+80>
        // x29 - 0x78
        let copy_2 = copy_1
        // x29 - 0xe0
        let rowIDAccumulator = self.rowIDAccumulator
        
        switch self.rowIDAccumulator {
        case .chunked(let chunks):
            // <+228>
            self.rowIDAccumulator = .chunked([])
        case .heterogeneous(let accumulator):
            // <+164>
            self.rowIDAccumulator = .heterogeneous(HeterogeneousViewIDsAccumulator())
        }
        
        // <+244>
        // sp + 0xb0
        let item = SectionAccumulator.Item(
            features: .implicit,
            list: copy_2,
            contentSubgraph: self.contentSubgraph,
            sectionList: nil,
            transform: _ViewList_SublistTransform(),
            ids: rowIDAccumulator.finalize(),
            headerCount: 0,
            footerCount: 0,
            id: UInt32(self.items.count),
            start: self.lastExplicitSectionEnd,
            traits: [copy_2.traits]
        )
        
        // sp + 0x18
        let copy_3 = item
        self.items.append(copy_3)
    }
}

extension SectionAccumulator {
    struct Item {
        var features: SectionAccumulator.Item.Features // 0x0
        var list: any ViewList // 0x8
        var contentSubgraph: Subgraph? // 0x30
        var sectionList: _ViewList_Section? // 0x38
        var transform: _ViewList_SublistTransform // 0x58
        var ids: SectionAccumulator.RowIDs // 0x68
        var headerCount: Int // 0x70
        var footerCount: Int // 0x78
        var id: UInt32 // 0x80
        var start: Int // 0x88
        var traits: [ViewTraitCollection] // 0x90
        
        var count: Int {
            return self.traits.count
        }
        
        var hasRows: Bool {
            return self.traits.count > 0
        }
        
        static func implicitSentinel(
            _ list: any ViewList,
            contentSubgraph: Subgraph?,
            accumulationStrategy: SectionAccumulator.RowIDAccumulationStrategy
        ) -> SectionAccumulator.Item {
            assertUnimplemented()
        }
    }
    
    enum RowIDAccumulationStrategy : Hashable {
        case chunked
        case heterogeneous
    }
    
    struct Options : OptionSet {
        let rawValue: UInt8
        
        static var retainSubgraphs: SectionAccumulator.Options {
            return SectionAccumulator.Options(rawValue: 1 << 0)
        }
    }
    
    struct RowIDs : RandomAccessCollection {
        private let chunks: [SectionAccumulator.RowIDs.Chunk]
        
        init(
            list: any ViewList,
            listAttribute: Attribute<any ViewList>?,
            start: Int,
            count: Int,
            accumulationStrategy: SectionAccumulator.RowIDAccumulationStrategy
        ) {
            assertUnimplemented()
        }
        
        var heterogeneous: HeterogeneousViewIDs? {
            assertUnimplemented()
        }
        
        init(ids: [_ViewList_ID]) {
            self.chunks = [
                SectionAccumulator.RowIDs.Chunk(
                    ids: .idArray(ids),
                    count: ids.count,
                    lowerBound: 0
                )
            ]
        }
        
        @inline(always) // 원래 없음
        init(chunks: [SectionAccumulator.RowIDs.Chunk]) {
            self.chunks = chunks
        }
        
        var startIndex: Int {
            assertUnimplemented()
        }
        
        var endIndex: Int {
            assertUnimplemented()
        }
        
        subscript(index: Int) -> _ViewList_ID.Canonical {
            assertUnimplemented()
        }
    }
    
    struct TransformedIDs : RandomAccessCollection, Equatable {
        static func == (lhs: SectionAccumulator.TransformedIDs, rhs: SectionAccumulator.TransformedIDs) -> Bool {
            assertUnimplemented()
        }
        
        private(set) var base: _ViewList_ID_Views
        private(set) var transform: _ViewList_SublistTransform
        
        subscript(position: Int) -> _ViewList_ID {
            assertUnimplemented()
        }
        
        func index(before i: Int) -> Int {
            assertUnimplemented()
        }
        
        var startIndex: Int {
            assertUnimplemented()
        }
        
        var endIndex: Int {
            assertUnimplemented()
        }
        
        var indices: Range<Int> {
            assertUnimplemented()
        }
        
        func index(_ i: Int, offsetBy distance: Int) -> Int {
            assertUnimplemented()
        }
        
        func distance(from start: Int, to end: Int) -> Int {
            assertUnimplemented()
        }
        
        func index(after i: Int) -> Int {
            assertUnimplemented()
        }
        
        var isEmpty: Bool {
            assertUnimplemented()
        }
        
        func index(_ i: Int, offsetBy distance: Int, limitedBy limit: Int) -> Int? {
            assertUnimplemented()
        }
        
        func formIndex(before i: inout Int) {
            assertUnimplemented()
        }
        
        func formIndex(after i: inout Int) {
            assertUnimplemented()
        }
        
        func makeIterator() -> IndexingIterator<SectionAccumulator.TransformedIDs> {
            assertUnimplemented()
        }
        
        var count: Int {
            assertUnimplemented()
        }
        
        var underestimatedCount: Int {
            assertUnimplemented()
        }
        
        subscript(bounds: Range<Int>) -> Slice<SectionAccumulator.TransformedIDs> {
            assertUnimplemented()
        }
    }
    
    fileprivate enum RowIDAccumulator {
        case chunked([SectionAccumulator.RowIDs.Chunk])
        case heterogeneous(HeterogeneousViewIDsAccumulator)
        
        func finalize() -> SectionAccumulator.RowIDs {
            switch self {
            case .chunked(let chunks):
                // <+212>
                return SectionAccumulator.RowIDs(chunks: chunks)
            case .heterogeneous(let accumulator):
                // <+44>
                // x29 - 0x98
                let copy_1 = accumulator
                // sp + 0x18
                let copy_2 = copy_1
                // sp + 0x80
                let viewIDs = copy_2.finalize()
                // <+124>
                return SectionAccumulator.RowIDs(
                    chunks: [
                        SectionAccumulator.RowIDs.Chunk(
                            ids: .heterogeneousViewIDs(viewIDs),
                            count: viewIDs.count,
                            lowerBound: 0
                        )
                    ]
                )
            }
        }
        
        var count: Int {
            // sp + 0x98
            let copy_1 = self
            
            switch copy_1 {
            case .chunked(let chunks):
                // <+212>
                if let chunk = chunks.last {
                    return chunk.count + chunk.lowerBound
                } else {
                    return 0
                }
            case .heterogeneous(let accumulator):
                // <+48>
                // inlined
                return accumulator.count
            }
        }
    }
}

extension SectionAccumulator.Item {
    struct Features : OptionSet {
        let rawValue: UInt8
        
        init(rawValue: UInt8) {
            self.rawValue = rawValue
        }
        
        static var implicit: SectionAccumulator.Item.Features {
            return SectionAccumulator.Item.Features(rawValue: 1 << 0)
        }
    }
}

extension SectionAccumulator.RowIDs {
    enum IDs {
        case viewListIDs(_ViewList_ID_Views)
        case idArray([_ViewList_ID])
        case sublist(_ViewList_ID.ElementCollection)
        case heterogeneousViewIDs(HeterogeneousViewIDs)
    }
    
    struct Chunk {
        var ids: SectionAccumulator.RowIDs.IDs
        var count: Int
        var lowerBound: Int
        
        @inline(always) // 원래 없음
        init(
            ids: SectionAccumulator.RowIDs.IDs,
            count: Int,
            lowerBound: Int
        ) {
            self.ids = ids
            self.count = count
            self.lowerBound = lowerBound
        }
        
        init(
            list: any ViewList,
            listAttribute: Attribute<any ViewList>?,
            transform: _ViewList_SublistTransform,
            start: Int,
            count: Int,
            lowerBound: Int
        ) {
            /*
             list -> x0 -> x22
             listAttribute -> x1 -> x24
             transform -> x2 -> x25/x19
             start -> x3 -> x26
             count -> x4 -> x21
             lowerBound -> x5 -> x29 - 0x98
             */
            if let viewIDs = list.viewIDs {
                // <+112>
                let views = _ViewList_ID._Views<SectionAccumulator.TransformedIDs>(
                    SectionAccumulator.TransformedIDs(
                        base: viewIDs,
                        transform: transform
                    ),
                    isDataDependent: true
                )
                
                // <+360>
                self.ids = .viewListIDs(views)
                // <+372>
            } else {
                // <+168>
                var start = start
                var count = count
                
                var ids: [_ViewList_ID] = []
                ids.reserveCapacity(count)
                
                var transform = transform
                
                transform.withTemporaryTransform { transform in
                    list.applyIDs(
                        from: &start,
                        listAttribute: listAttribute,
                        transform: transform,
                        to: { id in
                            // $s7SwiftUI18SectionAccumulatorV6RowIDsV5ChunkV4list0H9Attribute9transform5start5count10lowerBoundAgA8ViewList_p_0I5Graph0I0VyAaN_pGSgAA01_oP17_SublistTransformVS3itcfcSbAA01_op10_TemporaryrS0VXEfU_SbAA01_oP3_IDVXEfU_TA.3
                            ids.append(id)
                            count -= 1
                            return count != 0
                        }
                    )
                }
                
                self.ids = .idArray(ids)
                // <+372>
            }
            
            // <+372>
            self.count = count
            self.lowerBound = lowerBound
        }
    }
}
