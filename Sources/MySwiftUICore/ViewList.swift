private import AttributeGraph

final class _ViewList_SubgraphRelease {
    private let subgraphs: ArraySlice<_ViewList_Subgraph>
    
    init() {
        fatalError("TODO")
    }
}

final class _ViewList_Subgraph {
    private let subgraph: Subgraph
    private var refcount: UInt32
    
    init() {
        fatalError("TODO")
    }
}

struct _ViewList_ID {
    private var _index: Int32
    private var implicitID: Int32
    private var explicitIDs: [_ViewList_ID.Explicit]
}

extension _ViewList_ID {
    struct Explicit {
        private let id: AnyHashable2
        private let reuseID: Int
        private let owner: AnyAttribute
        private let isUnary: Bool
    }
}

struct _ViewList_SubgraphElements {
    private var base: _ViewList_Elements
    private var subgraphs: _ViewList_SublistSubgraphStorage
}

struct _ViewList_SublistSubgraphStorage {
    private var subgraphs: [_ViewList_Subgraph]
}
