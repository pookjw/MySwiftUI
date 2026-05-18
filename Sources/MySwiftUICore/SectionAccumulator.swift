// D22569EAA67164B36532D028EDA82857
internal import AttributeGraph

struct SectionAccumulator {
    private var rowIDAccumulator: SectionAccumulator.RowIDAccumulator
    private var lastExplicitSectionEnd: Int
    private var list: ViewList?
    private var contentSubgraph: Subgraph?
    private var items: [SectionAccumulator.Item]
    private var subgraphStorage: _ViewList_SublistSubgraphStorage?
    private var options: SectionAccumulator.Options
    private var viewCount: Int
    private var pendingEmptySectionTraits: [ViewTraitCollection]
    
    static func processUnsectionedContent(list: ViewList, contentSubgraph: Subgraph?, accumulationStrategy: SectionAccumulator.RowIDAccumulationStrategy) -> [SectionAccumulator.Item]? {
        assertUnimplemented()
    }
    
    init(contentSubgraph: Subgraph?, options: SectionAccumulator.Options, accumulationStrategy: SectionAccumulator.RowIDAccumulationStrategy) {
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
    
    struct Options {
        // TODO
    }
    
    struct RowIDs {
        // TODO
    }
    
    struct TransformedIDs {
        // TODO
    }
    
    fileprivate enum RowIDAccumulator {
        // TODO
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
