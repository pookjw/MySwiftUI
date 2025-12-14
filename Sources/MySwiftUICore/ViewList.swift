internal import AttributeGraph

final class _ViewList_SubgraphRelease {
    private let subgraphs: ArraySlice<_ViewList_Subgraph>
    
    init() {
        fatalError("TODO")
    }
}

class _ViewList_Subgraph {
    final let subgraph: Subgraph
    final internal(set) var refcount: UInt32
    
    init() {
        fatalError("TODO")
    }
    
    final func wrapping(_ vistList: ViewList) -> _ViewList_Subgraph {
        fatalError("TODO")
    }
    
    func invalidate() {
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

struct _ViewList_Sublist {
    private var start: Int
    private var count: Int
    private var id: _ViewList_ID
    private var elements: _ViewList_SubgraphElements
    private var traits: ViewTraitCollection
    private var list: Attribute<ViewList>?
}
