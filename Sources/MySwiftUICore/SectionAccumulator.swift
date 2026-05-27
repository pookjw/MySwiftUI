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
        
        assertUnimplemented()
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
                        lowerBound: 0
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
            assertUnimplemented()
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
            /*
             0x68 -> lastExplicitSectionEnd
             0xb8 -> viewCount
             */
            if self.lastExplicitSectionEnd >= self.viewCount {
                // <+768>
            } else {
                self.appendImplicitSection()
            }
            
            // <+768>
            let style = _ViewList_IteratorStyle(granularity: 1)
            let count = section.count(style: style)
            
            // <+812>
            // count가 안 맞음
            assertUnimplemented()
        }
        
        assertUnimplemented()
    }
    
    fileprivate func appendImplicitSection() {
        assertUnimplemented()
    }
}

extension SectionAccumulator {
    struct Item {
        var features: SectionAccumulator.Item.Features // 0x0
        var list: ViewList // 0x8
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
    
    struct RowIDs {
        // TODO
    }
    
    struct TransformedIDs {
        // TODO
    }
    
    fileprivate enum RowIDAccumulator {
        case chunked([SectionAccumulator.RowIDs.Chunk])
        case heterogeneous(HeterogeneousViewIDsAccumulator)
        
        func finalize() -> SectionAccumulator.RowIDs {
            assertUnimplemented()
        }
        
        var count: Int {
            assertUnimplemented()
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
        
        init(
            list: any ViewList,
            listAttribute: Attribute<any ViewList>?,
            transform: _ViewList_SublistTransform,
            start: Int,
            count: Int,
            lowerBound: Int
        ) {
            assertUnimplemented()
        }
    }
}
