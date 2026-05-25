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
    
    func formResult(from list: any ViewList, listAttribute: Attribute<any ViewList>?) {
        assertUnimplemented()
    }
    
    fileprivate func apply(start: inout Int, style: _ViewList_IteratorStyle, node: _ViewList_Node, transform: borrowing _ViewList_TemporarySublistTransform) -> Bool {
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
    struct IDs {
        // TODO
    }
    
    struct Chunk {
        // TODO
    }
}
