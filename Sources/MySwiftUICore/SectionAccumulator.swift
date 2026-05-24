// D22569EAA67164B36532D028EDA82857
internal import AttributeGraph

struct SectionAccumulator {
    private var rowIDAccumulator: SectionAccumulator.RowIDAccumulator // 0x0
    private var lastExplicitSectionEnd: Int = 0 // 0x68
    private var list: (any ViewList)? = nil // 0x70
    private var contentSubgraph: Subgraph? = nil // 0x98
    private var items: [SectionAccumulator.Item] = [] // 0xa0
    private var subgraphStorage: _ViewList_SublistSubgraphStorage? = nil // 0xa8
    private var options: SectionAccumulator.Options = [] // 0xb0
    private var viewCount: Int = 0 // 0xb8
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
            assertUnimplemented()
//            self.rowIDAccumulator = .heterogeneous(<#T##HeterogeneousViewIDsAccumulator#>)
        }
        
        assertUnimplemented()
    }
    
    func formResult(from list: ViewList, listAttribute: Attribute<ViewList>?) {
        assertUnimplemented()
    }
}

extension SectionAccumulator {
    struct Item {
        // TODO
    }
    
    enum RowIDAccumulationStrategy : Hashable {
        case chunked
        case heterogeneous
    }
    
    struct Options : OptionSet {
        let rawValue: UInt8
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
    struct Features {
        // TODO
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
